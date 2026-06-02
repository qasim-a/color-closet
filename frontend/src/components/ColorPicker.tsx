import { useState } from 'react'
import type { Color } from '../types/product'

interface Props {
  colors: Color[]
  selectedColor: string | null
  onColorSelect: (color: string | null) => void
}

export default function ColorPicker({ colors, selectedColor, onColorSelect }: Props) {
  const [showAll, setShowAll] = useState(false)

  const displayed = showAll ? colors : colors.slice(0, 20)

  return (
    <div className="color-picker">
      <div className="color-swatches">
        <button
          className={`swatch-btn ${selectedColor === null ? 'active' : ''}`}
          onClick={() => onColorSelect(null)}
        >
          <div className="swatch all-swatch" />
          <span>All</span>
        </button>
        {displayed.map(color => (
          <button
            key={color.name}
            className={`swatch-btn ${selectedColor === color.name ? 'active' : ''}`}
            onClick={() => onColorSelect(color.name)}
            title={color.name}
          >
            <div
              className="swatch"
              style={{ backgroundColor: color.hex }}
            />
            <span>{color.name}</span>
          </button>
        ))}
      </div>
      {colors.length > 20 && (
        <button
          className="show-more"
          onClick={() => setShowAll(!showAll)}
        >
          {showAll ? 'Show less' : `Show all ${colors.length} colors`}
        </button>
      )}
    </div>
  )
}