import { useState } from 'react'

interface Props {
  onSearch: (query: string) => void
  initialQuery?: string
}

export default function SearchBar({ onSearch, initialQuery = '' }: Props) {
  const [value, setValue] = useState(initialQuery)

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    if (value.trim()) onSearch(value.trim())
  }

  return (
    <form className="search-bar" onSubmit={handleSubmit}>
      <input
        type="text"
        value={value}
        onChange={e => setValue(e.target.value)}
        placeholder="Search for clothing..."
        className="search-input"
      />
      <button type="submit" className="search-btn">Search</button>
    </form>
  )
}