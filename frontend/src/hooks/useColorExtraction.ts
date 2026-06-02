import { useCallback } from 'react'

const COLOR_BUCKETS = 8

function rgbToHex(r: number, g: number, b: number): string {
  return '#' + [r, g, b].map(v => v.toString(16).padStart(2, '0')).join('')
}

function hexToRgb(hex: string): [number, number, number] | null {
  const clean = hex.replace('#', '')
  if (clean.length !== 6) return null
  return [
    parseInt(clean.slice(0, 2), 16),
    parseInt(clean.slice(2, 4), 16),
    parseInt(clean.slice(4, 6), 16),
  ]
}

function colorDistance(
  a: [number, number, number],
  b: [number, number, number]
): number {
  return Math.sqrt(
    Math.pow(a[0] - b[0], 2) +
    Math.pow(a[1] - b[1], 2) +
    Math.pow(a[2] - b[2], 2)
  )
}

function quantizeColor(r: number, g: number, b: number): string {
  const step = 256 / COLOR_BUCKETS
  const qr = Math.floor(r / step) * step
  const qg = Math.floor(g / step) * step
  const qb = Math.floor(b / step) * step
  return `${qr},${qg},${qb}`
}

function isBackground(
  r: number,
  g: number,
  b: number,
  isLightLabel: boolean
): boolean {
  // always filter pure white
  if (r > 240 && g > 240 && b > 240) return true

  // for non-light-colored garments, also filter grey/beige backgrounds
  if (!isLightLabel) {
    const max = Math.max(r, g, b)
    const min = Math.min(r, g, b)
    const saturation = max === 0 ? 0 : (max - min) / max
    // filter low saturation (grey/beige) pixels
    if (saturation < 0.15 && r > 150) return true
  }

  return false
}

function extractTopColors(
  imageData: Uint8ClampedArray,
  width: number,
  height: number,
  topN: number = 3,
  isLightLabel: boolean = false
): Array<[number, number, number]> {
  const buckets: Record<string, { count: number; r: number; g: number; b: number }> = {}

  const xMin = Math.floor(width * 0.2)
  const xMax = Math.floor(width * 0.8)
  const yMin = Math.floor(height * 0.15)
  const yMax = Math.floor(height * 0.85)

  for (let y = 0; y < height; y++) {
    for (let x = 0; x < width; x++) {
      const i = (y * width + x) * 4
      const r = imageData[i]
      const g = imageData[i + 1]
      const b = imageData[i + 2]

      if (isBackground(r, g, b, isLightLabel)) continue

      const inCenter = x >= xMin && x <= xMax && y >= yMin && y <= yMax
      const weight = inCenter ? 8 : 1

      const key = quantizeColor(r, g, b)
      if (!buckets[key]) {
        buckets[key] = { count: 0, r, g, b }
      }
      buckets[key].count += weight
    }
  }

  return Object.values(buckets)
    .sort((a, b) => b.count - a.count)
    .slice(0, topN)
    .map(b => [b.r, b.g, b.b])
}

export function useColorExtraction() {
  const extractColor = useCallback(
    (
      imageElement: HTMLImageElement,
      labelHex: string | null
    ): string | null => {
      try {
        const canvas = document.createElement('canvas')
        const SIZE = 100
        canvas.width = SIZE
        canvas.height = SIZE

        const ctx = canvas.getContext('2d')
        if (!ctx) return null

        ctx.drawImage(imageElement, 0, 0, SIZE, SIZE)
        const { data } = ctx.getImageData(0, 0, SIZE, SIZE)

        const labelRgb = labelHex ? hexToRgb(labelHex) : null

        // isLightLabel should only be true for near-white/grey colors
        // light green, light pink etc should still filter backgrounds
        const isLightLabel = labelRgb
            ? (() => {
                const avg = (labelRgb[0] + labelRgb[1] + labelRgb[2]) / 3
                const max = Math.max(...labelRgb)
                const min = Math.min(...labelRgb)
                const saturation = max === 0 ? 0 : (max - min) / max
                // only treat as light if both bright AND low saturation (near white/grey)
                return avg > 180 && saturation < 0.15
            })()
            : false

        const topColors = extractTopColors(data, SIZE, SIZE, 3, isLightLabel)
        if (topColors.length === 0) return null

        if (!labelRgb) {
          const [r, g, b] = topColors[0]
          return rgbToHex(r, g, b)
        }

        // pick whichever of top 3 is closest to the label
        let bestColor = topColors[0]
        let bestDistance = colorDistance(topColors[0], labelRgb)

        for (let i = 1; i < topColors.length; i++) {
          const dist = colorDistance(topColors[i], labelRgb)
          if (dist < bestDistance) {
            bestDistance = dist
            bestColor = topColors[i]
          }
        }

        return rgbToHex(bestColor[0], bestColor[1], bestColor[2])
      } catch {
        return null
      }
    },
    []
  )

  return { extractColor }
}