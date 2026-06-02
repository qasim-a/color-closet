export interface Product {
    id: number
    name: string
    brand_name: string
    price_value: number | null
    price_text: string | null
    colour_raw: string | null
    colour_normalized: string | null
    colour_hex: string | null
    image_url: string | null
    product_url: string
    is_marked_down: boolean
  }
  
  export interface Color {
    name: string
    hex: string
  }