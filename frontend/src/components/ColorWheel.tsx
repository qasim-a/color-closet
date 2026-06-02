import type { Dispatch, SetStateAction } from 'react'

const COLORS = [
  { name: 'Red',       hex: '#c42020' },
  { name: 'Burgundy',  hex: '#7a1830' },
  { name: 'Brown',     hex: '#6b3d1e' },
  { name: 'Beige',     hex: '#c8ab85' },
  { name: 'Orange',    hex: '#e06820' },
  { name: 'Yellow',    hex: '#e0b820' },
  { name: 'Olive',     hex: '#6b7a28' },
  { name: 'Green',     hex: '#258525' },
  { name: 'Turquoise', hex: '#1ab5c0' },
  { name: 'Sky',       hex: '#3a90d4' },
  { name: 'Blue',      hex: '#2540b8' },
  { name: 'Purple',    hex: '#6820aa' },
  { name: 'Pink',      hex: '#e06890' },
  { name: 'White',     hex: '#f2f2f2' },
  { name: 'Gray',      hex: '#808080' },
  { name: 'Black',     hex: '#141414' },
]
  
const COMPLEMENTS: Record<string, [string, string]> = {
  '#c42020': ['#6b7a28', '#141414'],   // red → olive, black
  '#7a1830': ['#c8ab85', '#6b7a28'],   // burgundy → beige, olive
  '#6b3d1e': ['#3a90d4', '#c8ab85'],   // brown → sky, beige
  '#c8ab85': ['#7a1830', '#6b3d1e'],   // beige → burgundy, brown
  '#e06820': ['#2540b8', '#141414'],   // orange → blue, black
  '#e0b820': ['#141414', '#6b7a28'],   // yellow → black, olive
  '#6b7a28': ['#c42020', '#c8ab85'],   // olive → red, beige
  '#258525': ['#f2f2f2', '#141414'],   // green → white, black
  '#1ab5c0': ['#c42020', '#f2f2f2'],   // turquoise → red, white
  '#3a90d4': ['#6b3d1e', '#f2f2f2'],   // sky → brown, white
  '#2540b8': ['#e06820', '#f2f2f2'],   // blue → orange, white
  '#6820aa': ['#f2f2f2', '#e0b820'],   // purple → white, yellow
  '#e06890': ['#6b7a28', '#f2f2f2'],   // pink → olive, white
  '#f2f2f2': ['#141414', '#7a1830'],   // white → black, burgundy
  '#808080': ['#c42020', '#f2f2f2'],   // gray → red, white
  '#141414': ['#f2f2f2', '#c42020'],   // black → white, red
}

interface Props {
  onColorSelect: (hex: string) => void
  isLoading: boolean
  selected: string | null
  setSelected: Dispatch<SetStateAction<string | null>>
  showComplements?: boolean
  onComplementSelect?: (hex: string) => void
}

export default function ColorWheel({
  onColorSelect,
  isLoading,
  selected,
  setSelected,
  showComplements = false,
  onComplementSelect,
}: Props) {
  const handleSelect = (hex: string) => {
    setSelected(hex)
    onColorSelect(hex)
  }

  const complements = selected ? COMPLEMENTS[selected] : null

  return (
    <div className="color-wheel-wrapper">
      <div className="color-ring">
        {COLORS.map((color, i) => {
          const angle = (i / COLORS.length) * 360
          const radius = 130
          const rad = (angle - 90) * (Math.PI / 180)
          const x = 160 + radius * Math.cos(rad)
          const y = 160 + radius * Math.sin(rad)

          return (
            <button
              key={color.name}
              className={`ring-swatch ${selected === color.hex ? 'ring-swatch-selected' : ''}`}
              style={{
                backgroundColor: color.hex,
                left: `${x}px`,
                top: `${y}px`,
              }}
              onClick={() => handleSelect(color.hex)}
              title={color.name}
              disabled={isLoading}
            />
          )
        })}

        <div className="ring-center">
          {selected ? (
            <div
              className="ring-center-preview"
              style={{ backgroundColor: selected }}
            />
          ) : (
            <span className="ring-center-text">Pick a color</span>
          )}
        </div>
      </div>

      {selected && (
        <div className="selected-label">
          {COLORS.find(c => c.hex === selected)?.name}
          {isLoading && ' — finding matches...'}
        </div>
      )}

      {showComplements && complements && (
        <div className="complements">
          <p className="complements-label">Pairs well with</p>
          <div className="complements-swatches">
            {complements.map(hex => {
              const color = COLORS.find(c => c.hex === hex)
              return (
                <button
                  key={hex}
                  className="ring-swatch complement-ring-swatch"
                  style={{ backgroundColor: hex }}
                  onClick={() => onComplementSelect?.(hex)}
                  title={color?.name}
                />
              )
            })}
          </div>
          <div className="complements-names">
            {complements.map(hex => {
              const color = COLORS.find(c => c.hex === hex)
              return (
                <span key={hex} className="complement-name">
                  {color?.name}
                </span>
              )
            })}
          </div>
        </div>
      )}
    </div>
  )
}