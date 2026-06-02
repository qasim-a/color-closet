import { useQuery } from '@tanstack/react-query'
import { useState } from 'react'
import { searchByColor } from '../api/products'
import ProductCard from '../components/ProductCard'
import ColorWheel from '../components/ColorWheel'

const PAGE_SIZE = 20
type Mode = 'single' | 'outfit'

export default function Home() {
  const [mode, setMode] = useState<Mode>('single')

  // single mode
  const [selectedHex, setSelectedHex] = useState<string | null>(null)
  const [page, setPage] = useState(1)

  // outfit mode — lifted state so wheels can sync
  const [primaryHex, setPrimaryHex] = useState<string | null>(null)
  const [primarySelected, setPrimarySelected] = useState<string | null>(null)
  const [secondaryHex, setSecondaryHex] = useState<string | null>(null)
  const [secondarySelected, setSecondarySelected] = useState<string | null>(null)
  const [outfitPage1, setOutfitPage1] = useState(1)
  const [outfitPage2, setOutfitPage2] = useState(1)

  // single selected state for single mode wheel
  const [singleSelected, setSingleSelected] = useState<string | null>(null)

  const { data: products = [], isLoading } = useQuery({
    queryKey: ['products', selectedHex],
    queryFn: () => searchByColor(selectedHex!),
    enabled: !!selectedHex && mode === 'single',
  })

  const { data: primaryProducts = [], isLoading: primaryLoading } = useQuery({
    queryKey: ['products', primaryHex],
    queryFn: () => searchByColor(primaryHex!),
    enabled: !!primaryHex && mode === 'outfit',
  })

  const { data: secondaryProducts = [], isLoading: secondaryLoading } = useQuery({
    queryKey: ['products', secondaryHex],
    queryFn: () => searchByColor(secondaryHex!),
    enabled: !!secondaryHex && mode === 'outfit',
  })

  const handleModeSwitch = (newMode: Mode) => {
    setMode(newMode)
    setSelectedHex(null)
    setSingleSelected(null)
    setPrimaryHex(null)
    setPrimarySelected(null)
    setSecondaryHex(null)
    setSecondarySelected(null)
    setPage(1)
    setOutfitPage1(1)
    setOutfitPage2(1)
  }

  // clicking a complement on primary wheel → sets secondary
  const handlePrimaryComplementSelect = (hex: string) => {
    setSecondarySelected(hex)
    setSecondaryHex(hex)
    setOutfitPage2(1)
  }

  // clicking a complement on secondary wheel → sets primary
  const handleSecondaryComplementSelect = (hex: string) => {
    setPrimarySelected(hex)
    setPrimaryHex(hex)
    setOutfitPage1(1)
  }

  const displayed = products.slice(0, page * PAGE_SIZE)
  const hasMore = displayed.length < products.length

  return (
    <div>
      <div className="hero">
        <h1 className="logo">Color Closet</h1>

        <div className="mode-tabs">
          <button
            className={`mode-tab ${mode === 'single' ? 'mode-tab-active' : ''}`}
            onClick={() => handleModeSwitch('single')}
          >
            Single Color
          </button>
          <button
            className={`mode-tab ${mode === 'outfit' ? 'mode-tab-active' : ''}`}
            onClick={() => handleModeSwitch('outfit')}
          >
            Outfit Builder
          </button>
        </div>

        {mode === 'single' && (
          <>
            <p className="caption">
              {selectedHex
                ? 'Click any item to shop on ASOS'
                : 'Pick a color to find matching clothes'}
            </p>
            <ColorWheel
              selected={singleSelected}
              setSelected={setSingleSelected}
              onColorSelect={(hex) => { setSelectedHex(hex); setPage(1) }}
              isLoading={isLoading}
            />
          </>
        )}

        {mode === 'outfit' && (
          <>
            <p className="caption">
              Pick two colors to build an outfit
            </p>
            <div className="outfit-wheels">
              <div className="outfit-wheel-col">
                <ColorWheel
                  selected={primarySelected}
                  setSelected={setPrimarySelected}
                  onColorSelect={(hex) => { setPrimaryHex(hex); setOutfitPage1(1) }}
                  isLoading={primaryLoading}
                  showComplements
                  onComplementSelect={handlePrimaryComplementSelect}
                />
              </div>
              <div className="outfit-wheel-divider" />
              <div className="outfit-wheel-col">
                <ColorWheel
                  selected={secondarySelected}
                  setSelected={setSecondarySelected}
                  onColorSelect={(hex) => { setSecondaryHex(hex); setOutfitPage2(1) }}
                  isLoading={secondaryLoading}
                  showComplements
                  onComplementSelect={handleSecondaryComplementSelect}
                />
              </div>
            </div>
          </>
        )}
      </div>

      {/* Single mode results */}
      {mode === 'single' && (selectedHex || isLoading) && (
        <div className="results-section">
          <div className="results-header">
            {selectedHex && (
              <div className="results-color-dot" style={{ backgroundColor: selectedHex }} />
            )}
            <span className="results-title">
              {isLoading ? 'Finding matches...' : `${products.length} matches`}
            </span>
          </div>
          <div className="product-grid">
            {displayed.map(product => (
              <ProductCard key={product.id} product={product} labelHex={selectedHex} />
            ))}
          </div>
          {hasMore && !isLoading && (
            <button className="load-more-btn" onClick={() => setPage(p => p + 1)}>
              Load more
            </button>
          )}
        </div>
      )}

      {/* Outfit builder results */}
      {mode === 'outfit' && (primaryHex || secondaryHex) && (
        <div className="results-section">
          <div className="outfit-grids">
            <div className="outfit-grid-col">
              {primaryHex && (
                <div className="results-header">
                  <div className="results-color-dot" style={{ backgroundColor: primaryHex }} />
                  <span className="results-title">
                    {primaryLoading ? 'Finding...' : `${primaryProducts.length} matches`}
                  </span>
                </div>
              )}
              {primaryLoading && <div className="loading">Finding matches...</div>}
              {!primaryLoading && primaryHex && primaryProducts.length === 0 && (
                <div className="empty">No matches found</div>
              )}
              <div className="product-grid">
                {primaryProducts.slice(0, outfitPage1 * PAGE_SIZE).map(product => (
                  <ProductCard key={product.id} product={product} labelHex={primaryHex} />
                ))}
              </div>
              {primaryProducts.slice(0, outfitPage1 * PAGE_SIZE).length < primaryProducts.length && (
                <button className="load-more-btn" onClick={() => setOutfitPage1(p => p + 1)}>
                  Load more
                </button>
              )}
            </div>

            <div className="outfit-results-divider" />

            <div className="outfit-grid-col">
              {secondaryHex && (
                <div className="results-header">
                  <div className="results-color-dot" style={{ backgroundColor: secondaryHex }} />
                  <span className="results-title">
                    {secondaryLoading ? 'Finding...' : `${secondaryProducts.length} matches`}
                  </span>
                </div>
              )}
              {!secondaryHex && (
                <div className="empty">Pick a second color to see matches</div>
              )}
              {secondaryLoading && <div className="loading">Finding matches...</div>}
              {!secondaryLoading && secondaryHex && secondaryProducts.length === 0 && (
                <div className="empty">No matches found</div>
              )}
              <div className="product-grid">
                {secondaryProducts.slice(0, outfitPage2 * PAGE_SIZE).map(product => (
                  <ProductCard key={product.id} product={product} labelHex={secondaryHex} />
                ))}
              </div>
              {secondaryProducts.slice(0, outfitPage2 * PAGE_SIZE).length < secondaryProducts.length && (
                <button className="load-more-btn" onClick={() => setOutfitPage2(p => p + 1)}>
                  Load more
                </button>
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  )
}