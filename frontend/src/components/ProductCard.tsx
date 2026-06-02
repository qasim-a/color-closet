import { useState } from 'react'
import type { Product } from '../types/product'

interface Props {
  product: Product
  labelHex?: string | null
}

export default function ProductCard({ product, labelHex }: Props) {
  const [imgError, setImgError] = useState(false)

  const imageUrl = product.image_url
    ? product.image_url.startsWith('/kaggle-images')
      ? `${import.meta.env.VITE_API_URL}${product.image_url}`
      : product.image_url
    : null

  

  const displayHex = product.colour_hex ?? labelHex

  return (
    <a
      href={product.product_url}
      target="_blank"
      rel="noopener noreferrer"
      className="product-card"
    >
      <div className="product-image-container">
        {imageUrl && !imgError ? (
          <img
            src={imageUrl}
            alt={product.name}
            className="product-image"
            crossOrigin="anonymous"
            onError={() => setImgError(true)}
          />
        ) : (
          <div className="product-image-placeholder" />
        )}
        {displayHex && (
          <div
            className="colour-dot"
            style={{ backgroundColor: displayHex }}
          />
        )}
      </div>
      <div className="product-info">
        <p className="product-brand">{product.brand_name}</p>
        <p className="product-name">{product.name}</p>
        <p className="product-price">{product.price_text}</p>
      </div>
    </a>
  )
}