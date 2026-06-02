import { useState } from 'react'
import type { Product } from '../types/product'

interface Props {
  product: Product
}

export default function ProductCard({ product }: Props) {
  const [imgError, setImgError] = useState(false)

  const imageUrl = product.image_url || null

  return (
    <div className="product-card">
      <div className="product-image-container">
        {imageUrl && !imgError ? (
          <img
            src={imageUrl}
            alt={product.name}
            className="product-image"
            onError={() => setImgError(true)}
          />
        ) : (
          <div className="product-image-placeholder" />
        )}
        {product.colour_hex && (
          <div
            className="colour-dot"
            style={{ backgroundColor: product.colour_hex }}
          />
        )}
      </div>
      <div className="product-info">
        <p className="product-brand">{product.brand_name}</p>
        <p className="product-name">{product.name}</p>
        <p className="product-price">{product.price_text}</p>
      </div>
    </div>
  )
}