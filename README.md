# Color Closet

A color-first clothing discovery tool. Pick a color, find matching clothes.

**[Live Demo](https://color-closet.vercel.app)**

![Color Closet Demo](assets/demo.gif)

---

## What it does

Most clothing sites treat color as one filter among many. Color Closet makes it the entire experience.

- **Color Wheel** — pick any of 16 perceptual colors from an interactive ring
- **Instant matching** — products are sorted by how closely their extracted color matches your selection
- **Outfit Builder** — pick two colors side by side, with curated fashion complement suggestions
- **H&M catalog** — 689 tops, bottoms, jackets, shoes, and accessories

---

## How the color matching works

This was the interesting engineering problem.

Clothing retailers label colors inconsistently — the same shade of blue might be "Navy Iris", "Dark Night Navy", or "Copenhagen Blue" depending on the brand. Text-based color filtering breaks down fast.

Instead, Color Closet extracts the dominant color directly from each product image:

1. **Image processing** — each product image is downloaded and resized to 100×100px
2. **Background filtering** — near-white and near-neutral gray pixels are removed (H&M uses a consistent light gray background)
3. **KMeans clustering** — pixels are grouped into 5 color clusters; if the dominant cluster is still background-like, the second cluster is used instead
4. **Palette assignment** — the extracted hex is mapped to one of 16 palette colors using a hue-dominant HSL distance function, which prevents neutral colors like beige from attracting visually distinct colors that happen to share similar lightness values
5. **Result sorting** — within a palette bucket, products are ranked by perceptual color distance from the exact shade the user selected

The palette assignment uses a custom distance function that weights hue 3x more than saturation and ignores lightness almost entirely for saturated colors — because whether a red is light or dark matters less than whether it's actually red.

---

## Tech stack

| Layer | Technology |
|---|---|
| Frontend | React, TypeScript, Vite |
| Backend | Python, FastAPI |
| Database | PostgreSQL |
| Color extraction | Pillow, scikit-learn, NumPy |
| Deployment | Vercel (frontend), Render (backend + DB) |

---

## Data

Product data sourced from the H&M Personalized Fashion Recommendations dataset, enhanced with accessible S3 image URLs by Qdrant. Color extraction and palette assignment were run as a batch process across all 689 products using the pipeline described above.