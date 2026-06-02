def hex_to_rgb(hex_color: str) -> tuple | None:
    try:
        hex_color = hex_color.lstrip('#')
        return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))
    except Exception:
        return None


def color_distance(rgb1: tuple, rgb2: tuple) -> float:
    return (
        (rgb1[0] - rgb2[0]) ** 2 +
        (rgb1[1] - rgb2[1]) ** 2 +
        (rgb1[2] - rgb2[2]) ** 2
    ) ** 0.5


def rgb_to_hsl(rgb: tuple) -> tuple:
    r, g, b = rgb[0] / 255, rgb[1] / 255, rgb[2] / 255
    max_c = max(r, g, b)
    min_c = min(r, g, b)
    l = (max_c + min_c) / 2

    if max_c == min_c:
        h = s = 0.0
    else:
        d = max_c - min_c
        s = d / (2 - max_c - min_c) if l > 0.5 else d / (max_c + min_c)
        if max_c == r:
            h = (g - b) / d + (6 if g < b else 0)
        elif max_c == g:
            h = (b - r) / d + 2
        else:
            h = (r - g) / d + 4
        h /= 6

    return (h * 360, s * 100, l * 100)


def hsl_color_distance(rgb1: tuple, rgb2: tuple) -> float:
    h1, s1, l1 = rgb_to_hsl(rgb1)
    h2, s2, l2 = rgb_to_hsl(rgb2)

    hue_diff = min(abs(h1 - h2), 360 - abs(h1 - h2))

    return (
        (hue_diff * 2) ** 2 +
        (s1 - s2) ** 2 +
        (l1 - l2) ** 2
    ) ** 0.5