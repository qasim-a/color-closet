import axios from 'axios'
import type { Product } from '../types/product'

const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL,
})

export const searchByColor = async (hex: string): Promise<Product[]> => {
  const res = await api.get('/api/products/color', {
    params: { hex }
  })
  return res.data
}