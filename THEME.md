# Theming guide

## Overview

The blog supports light and dark themes that users can toggle. Themes are implemented using CSS files that get swapped at runtime via JavaScript.

## How it works

### 1. Theme Files

Theme CSS files are located in the `themes/` directory:

```plaintext
themes/
├── layout.html      # Shared HTML templates
├── post.html
├── tag.html
├── sidebar.html
├── light.css        # Light theme styles
└── dark.css         # Dark theme styles
```

### 2. CSS custom properties

Themes use CSS custom properties (CSS variables) for colors and styling. This allows for easy theming without duplicating styles:

```css
/* light.css example */
:root {
    --bg-color: #ffffff;
    --text-color: #333333;
    --link-color: #0066cc;
    --header-bg: #f5f5f5;
    --border-color: #dddddd;
    --code-bg: #f4f4f4;
    --tag-bg: #e8e8e8;
}

/* dark.css example */
:root {
    --bg-color: #0d1117;
    --text-color: #c9d1d9;
    --link-color: #58a6ff;
    --header-bg: #161b22;
    --border-color: #30363d;
    --code-bg: #161b22;
    --tag-bg: #21262d;
}
```

### 3. Runtime theme switching

The theme switcher uses JavaScript to:

1. Detect system preference on first visit
2. Store user's choice in localStorage
3. Swap the CSS file when toggling themes

The theme toggle button appears in the site header. Clicking it switches between `/themes/light.css` and `/themes/dark.css`.

## Creating a new theme

### Step 1: Create theme CSS file

Create a new CSS file in the `themes/` directory:

```bash
# Example: Creating a "blue" theme
touch themes/blue.css
```

### Step 2: Define CSS variables

Add your theme's color scheme using CSS custom properties:

```css
:root {
    --bg-color: #e3f2fd;
    --text-color: #1565c0;
    --link-color: #1976d2;
    --header-bg: #bbdefb;
    --border-color: #90caf9;
    --code-bg: #bbdefb;
    --tag-bg: #bbdefb;
}
```

### Step 3: Update configuration

Edit `config.yaml` to add your new theme:

```yaml
themes:
  light: "blue"    # Your new theme
  dark: "dark"     # Existing dark theme
```

### Step 4: Build and test

```bash
./blog.sh -build
```

The new theme's CSS will be copied to `public/themes/blue.css` and used as the light theme.

## Theme variables reference

| Variable | Purpose |
|----------|---------|
| `--bg-color` | Page background |
| `--text-color` | Main text color |
| `--link-color` | Link color |
| `--header-bg` | Header background |
| `--border-color` | Border color |
| `--code-bg` | Code block background |
| `--tag-bg` | Tag background |

## Adding more themes

You can have multiple themes beyond just light and dark. For example:

```yaml
themes:
  light: "blue"     # Blue-themed light mode
  dark: "dark"      # Default dark mode
```

The blog will generate CSS files for both themes at build time:
- `public/themes/blue.css`
- `public/themes/dark.css`

## Best practices

1. **Define all variables**: Ensure your theme defines all CSS custom properties used in the templates
2. **Test contrast**: Verify text is readable against backgrounds
3. **Match element styling**: Consider how all elements look (headers, code blocks, tags, etc.)
4. **Keep themes consistent**: Similar visual weight and feel between light/dark variants
