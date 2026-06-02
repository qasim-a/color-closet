export interface Product {
  id: number
  name: string
  brand_name: string
  price_value: number | null
  price_text: string | null
  colour_raw: string | null
  colour_normalized: string | null
  colour_hex: string | null
  palette_colors: string | null
  image_url: string | null
  is_marked_down: boolean
}