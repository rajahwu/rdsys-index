-- ============================================  
-- STYLE SYSTEM BRAND KIT - DATABASE POPULATION  
-- ============================================

-- Insert Style System as standalone brand (it came before Radiant Systems organizationally)  
INSERT INTO brands (id, name, slug, tagline, tone, keywords, created_at, updated_at)  
VALUES (  
'ss-04', 
'Style System',  
'style-system',  
'Live, Interactive, Always in Sync',  
'Clean, modern, modular, and trustworthy — with just enough personality to feel human. Professional without being cold, systematic without being rigid. Speaks with clarity and precision, values consistency and scalability. This is the foundation all other systems build upon.',  
'Modular · Precise · Scalable · Visual Hierarchy · Clarity',  
NOW(),  
NOW(),
ON CONFLICT (id) DO NOTHING;  
);

-- ============================================  
-- COLORS  
-- ============================================

INSERT INTO brand_colors (brand_id, token_name, hex, rgb, cmyk, pantone, usage_notes, is_primary)  
VALUES  
-- Primary brand colors  
((SELECT id FROM brands WHERE slug = 'style-system'), 'brand.primary', '#3B82F6', '59, 130, 246', '76, 47, 0, 0', '2727 C', 'Primary actions, highlights, key icons, brand identity',  TRUE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'brand.primary.light', '#60A5FA', '96, 165, 250', '62, 34, 0, 0', '2728 C', 'Hover states, secondary accents, lighter emphasis',  TRUE),

-- Neutral scale (complete hierarchy)    
((SELECT id FROM brands WHERE slug = 'style-system'), 'neutral.900', '#111827', '17, 24, 39', '85, 70, 55, 65', 'Black 6 C', 'Headings, high-contrast text, primary emphasis',  FALSE),    
((SELECT id FROM brands WHERE slug = 'style-system'), 'neutral.800', '#1F2937', '31, 41, 55', '75, 60, 45, 50', '533 C', 'Body text, primary content, readable dark',  FALSE),    
((SELECT id FROM brands WHERE slug = 'style-system'), 'neutral.700', '#374151', '55, 65, 81', '65, 50, 40, 30', '532 C', 'Secondary headings, medium emphasis',  FALSE),    
((SELECT id FROM brands WHERE slug = 'style-system'), 'neutral.600', '#4B5563', '75, 85, 99', '55, 45, 35, 20', 'Cool Gray 11 C', 'Tertiary text, subtle headings',  FALSE),    
((SELECT id FROM brands WHERE slug = 'style-system'), 'neutral.500', '#6B7280', '107, 114, 128', '45, 35, 28, 5', 'Cool Gray 8 C', 'Secondary text, icon defaults, muted content',  FALSE),    
((SELECT id FROM brands WHERE slug = 'style-system'), 'neutral.400', '#9CA3AF', '156, 163, 175', '30, 20, 15, 0', 'Cool Gray 5 C', 'Placeholder text, disabled states',  FALSE),    
((SELECT id FROM brands WHERE slug = 'style-system'), 'neutral.300', '#D1D5DB', '209, 213, 219', '15, 10, 8, 0', 'Cool Gray 4 C', 'Borders, dividers, inactive elements',  FALSE),    
((SELECT id FROM brands WHERE slug = 'style-system'), 'neutral.200', '#E5E7EB', '229, 231, 235', '8, 5, 4, 0', 'Cool Gray 2 C', 'Light borders, subtle separators',  FALSE),    
((SELECT id FROM brands WHERE slug = 'style-system'), 'neutral.100', '#F3F4F6', '243, 244, 246', '4, 3, 2, 0', 'Cool Gray 1 C', 'Subtle backgrounds, hover states',  FALSE),    
((SELECT id FROM brands WHERE slug = 'style-system'), 'neutral.50', '#F9FAFB', '249, 250, 251', '2, 1, 1, 0', 'White', 'Light backgrounds, card surfaces, page base',  FALSE),    
    
-- Semantic accent colors    
((SELECT id FROM brands WHERE slug = 'style-system'), 'accent.success', '#10B981', '16, 185, 129', '70, 0, 55, 0', '3405 C', 'Success states, confirmations, positive feedback',  FALSE),    
((SELECT id FROM brands WHERE slug = 'style-system'), 'accent.warning', '#F59E0B', '245, 158, 11', '0, 35, 95, 0', '130 C', 'Warnings, cautions, attention needed',  FALSE),    
((SELECT id FROM brands WHERE slug = 'style-system'), 'accent.error', '#EF4444', '239, 68, 68', '0, 72, 72, 0', '1788 C', 'Errors, critical alerts, destructive actions',  FALSE);

-- ============================================  
-- TYPOGRAPHY  
-- ============================================

INSERT INTO brand_typography (brand_id, token_name, font_family, font_weight, size_px, size_rem, line_height, letter_spacing, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.display', 'Inter', 'Bold (700)', 48, 3.0, 1.1, '-0.02em', 'Large hero text, major marketing headlines'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.h1', 'Inter', 'Bold (700)', 32, 2.0, 1.25, '-0.01em', 'Page titles, top-level headings'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.h2', 'Inter', 'Bold (700)', 24, 1.5, 1.3, 'normal', 'Section headers, major divisions'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.h3', 'Inter', 'SemiBold (600)', 20, 1.25, 1.4, 'normal', 'Subsection headers, card titles'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.h4', 'Inter', 'SemiBold (600)', 18, 1.125, 1.4, 'normal', 'Minor headings, list titles'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.body.large', 'Inter', 'Regular (400)', 18, 1.125, 1.6, 'normal', 'Lead paragraphs, emphasized content'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.body', 'Inter', 'Regular (400)', 16, 1.0, 1.5, 'normal', 'Standard paragraphs, UI labels, descriptions'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.body.small', 'Inter', 'Regular (400)', 14, 0.875, 1.5, 'normal', 'Secondary information, metadata'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.caption', 'Inter', 'Regular (400)', 12, 0.75, 1.5, 'normal', 'Tiny labels, legal text, timestamps'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.mono', 'JetBrains Mono', 'Regular (400)', 14, 0.875, 1.6, 'normal', 'Code snippets, token names, technical data'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.button.large', 'Inter', 'SemiBold (600)', 16, 1.0, 1.0, '0.01em', 'Large button labels, primary CTAs'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.button', 'Inter', 'Medium (500)', 14, 0.875, 1.0, '0.01em', 'Standard button labels'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'type.button.small', 'Inter', 'Medium (500)', 12, 0.75, 1.0, '0.01em', 'Small button labels, compact CTAs');

-- ============================================  
-- ICONS  
-- ============================================

-- Token Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'tokens', 'color-swatch', 'icons/tokens/color-swatch.svg', '24x24', '2px', 'Color token representation',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'tokens', 'typography-a', 'icons/tokens/typography-a.svg', '24x24', '2px', 'Typography token representation',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'tokens', 'spacing-ruler', 'icons/tokens/spacing-ruler.svg', '24x24', '2px', 'Spacing token representation',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'tokens', 'shadow-layers', 'icons/tokens/shadow-layers.svg', '24x24', '2px', 'Shadow/elevation token representation',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'tokens', 'grid-template', 'icons/tokens/grid-template.svg', '24x24', '2px', 'Grid/layout token representation',  FALSE);

-- Nav Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'nav', 'tokens', 'icons/nav/tokens.svg', '24x24', '2px', 'Navigate to tokens section',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'nav', 'components', 'icons/nav/components.svg', '24x24', '2px', 'Navigate to components section',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'nav', 'docs', 'icons/nav/docs.svg', '24x24', '2px', 'Navigate to documentation',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'nav', 'search', 'icons/nav/search.svg', '24x24', '2px', 'Search functionality',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'nav', 'settings', 'icons/nav/settings.svg', '24x24', '2px', 'Settings/preferences',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'nav', 'home', 'icons/nav/home.svg', '24x24', '2px', 'Home/dashboard',  FALSE);

-- Status Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'status', 'success', 'icons/status/success.svg', '24x24', '2px', 'Success state checkmark',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'status', 'warning', 'icons/status/warning.svg', '24x24', '2px', 'Warning state triangle',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'status', 'error', 'icons/status/error.svg', '24x24', '2px', 'Error state X',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'status', 'info', 'icons/status/info.svg', '24x24', '2px', 'Information state circle',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'status', 'loading', 'icons/status/loading.svg', '24x24', '2px', 'Loading spinner',  FALSE);

-- Action Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'actions', 'edit', 'icons/actions/edit.svg', '24x24', '2px', 'Edit/modify action',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'actions', 'delete', 'icons/actions/delete.svg', '24x24', '2px', 'Delete/remove action',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'actions', 'copy', 'icons/actions/copy.svg', '24x24', '2px', 'Copy/duplicate action',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'actions', 'download', 'icons/actions/download.svg', '24x24', '2px', 'Download action',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'actions', 'upload', 'icons/actions/upload.svg', '24x24', '2px', 'Upload action',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'actions', 'add', 'icons/actions/add.svg', '24x24', '2px', 'Add/create action',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'actions', 'remove', 'icons/actions/remove.svg', '24x24', '2px', 'Remove/subtract action',  FALSE);

-- UI Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'ui', 'chevron-up', 'icons/ui/chevron-up.svg', '24x24', '2px', 'Chevron pointing up',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'ui', 'chevron-down', 'icons/ui/chevron-down.svg', '24x24', '2px', 'Chevron pointing down',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'ui', 'chevron-left', 'icons/ui/chevron-left.svg', '24x24', '2px', 'Chevron pointing left',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'ui', 'chevron-right', 'icons/ui/chevron-right.svg', '24x24', '2px', 'Chevron pointing right',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'ui', 'menu', 'icons/ui/menu.svg', '24x24', '2px', 'Menu hamburger icon',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'ui', 'close', 'icons/ui/close.svg', '24x24', '2px', 'Close X icon',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'ui', 'expand', 'icons/ui/expand.svg', '24x24', '2px', 'Expand arrows',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'ui', 'collapse', 'icons/ui/collapse.svg', '24x24', '2px', 'Collapse icon',  FALSE),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'ui', 'external-link', 'icons/ui/external-link.svg', '24x24', '2px', 'External link indicator',  FALSE);

-- ============================================  
-- ASSETS  
-- ============================================

-- Logos  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'logo', 'horizontal', 'Primary Logo Lockup', 'logo/logo-horizontal.svg', 'svg', 'Horizontal wordmark for headers and marketing'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'logo', 'horizontal-dark', 'Logo for Dark Backgrounds', 'logo/logo-horizontal-dark.svg', 'svg', 'Inverted colors for dark backgrounds'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'logo', 'square', 'Square Logo', 'logo/logo-square.svg', 'svg', 'Stacked version for square spaces'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'logo', 'icon', 'Icon-Only Logo', 'logo/logo-icon.svg', 'svg', 'Icon mark for favicons and app icons');

-- Illustrations - Empty States  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'illustration', 'empty-state', 'No Data', 'illustrations/empty-states/no-data.svg', 'svg', 'Empty state when no data exists'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'illustration', 'empty-state', 'No Results', 'illustrations/empty-states/no-results.svg', 'svg', 'Empty state for search with no results'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'illustration', 'empty-state', 'Empty Grid', 'illustrations/empty-states/empty-grid.svg', 'svg', 'Empty grid/table state');

-- Illustrations - Onboarding  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'illustration', 'onboarding', 'Token System', 'illustrations/onboarding/token-system.svg', 'svg', 'Onboarding slide explaining design tokens'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'illustration', 'onboarding', 'Component Structure', 'illustrations/onboarding/component-structure.svg', 'svg', 'Onboarding slide showing component architecture'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'illustration', 'onboarding', 'Spacing Scale', 'illustrations/onboarding/spacing-scale.svg', 'svg', 'Onboarding slide demonstrating spacing system');

-- Illustrations - Diagrams  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'illustration', 'diagram', 'Color Hierarchy', 'illustrations/diagrams/color-hierarchy.svg', 'svg', 'Diagram showing color scale and usage'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'illustration', 'diagram', 'Type Scale', 'illustrations/diagrams/type-scale.svg', 'svg', 'Diagram showing typography hierarchy'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'illustration', 'diagram', 'Spacing Grid', 'illustrations/diagrams/spacing-grid.svg', 'svg', 'Diagram showing 8px grid system');

-- ============================================  
-- GUIDELINES  
-- ============================================

INSERT INTO brand_guidelines (brand_id, section, content, display_order)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'color-usage',  
'Color Usage Guidelines:

PRIMARY UI:  
- brand.primary on neutral.50 or neutral.900  
- brand.primary.light for hover states

TEXT HIERARCHY:  
- neutral.900 for headings (high emphasis)  
- neutral.800 for body text (readable dark)  
- neutral.500 for secondary text (muted)  
- neutral.300 for borders and dividers

INTERACTIVE STATES:  
- Default: neutral.500  
- Hover: brand.primary.light  
- Active: brand.primary  
- Disabled: neutral.400

SEMANTIC FEEDBACK:  
- Success: accent.success (green) - confirmations, positive actions  
- Warning: accent.warning (amber) - cautions, important notices  
- Error: accent.error (red) - errors, destructive actions  
- Use sparingly, only when semantic meaning required

Style System uses sophisticated blue (brand.primary) for trustworthy, professional identity. Complete neutral scale (50-900) provides comprehensive hierarchy for any UI need.',  TRUE),

((SELECT id FROM brands WHERE slug = 'style-system'), 'typography-usage',    
'Typography Usage Guidelines:

WEIGHT HIERARCHY:  
- Bold (700): Display and major headings (H1, H2) only  
- SemiBold (600): Subsections (H3, H4) and large buttons  
- Medium (500): Standard buttons  
- Regular (400): All body content

LETTER-SPACING:  
- Display text: -0.02em (tighter for optical balance)  
- H1: -0.01em (slightly tighter)  
- All others: normal  
- Buttons: +0.01em (slightly looser for readability)

FALLBACK STACKS:  
- Inter: Inter, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif  
- Mono: "JetBrains Mono", "Fira Code", "SF Mono", Monaco, Consolas, monospace

ACCESSIBILITY:  
- Minimum body text: 16px  
- Line height: 1.5 minimum for body text, 1.6 for small text  
- Headings: Tighter line height (1.1-1.4) for better visual rhythm

Inter provides exceptional clarity across all sizes with excellent web rendering. JetBrains Mono essential for technical content.', 2),

((SELECT id FROM brands WHERE slug = 'style-system'), 'spacing-system',    
'Spacing System Guidelines:

BASE UNIT: 8px  
All spacing is multiples of the base unit for consistency and rhythm.

SPACING SCALE:  
4px - Tiny gaps (between inline elements)  
8px - Small gaps (related elements)  
12px - Compact spacing  
16px - Standard gaps (groups, cards)  
24px - Section spacing (breathing room)  
32px - Large sections  
48px - Major divisions  
64px - Page-level spacing  
96px - Hero spacing

UI SPACING:  
- 8px between related elements  
- 16px between element groups  
- 24px between major sections

CONTAINER PADDING:  
- Mobile: 16px  
- Tablet: 24px  
- Desktop: 32px

GRID GAPS:  
- Dense layouts: 16px  
- Standard layouts: 24px  
- Spacious layouts: 32px

MARKETING LAYOUTS:  
- Minimum padding: 24px  
- Preferred padding: 48px for breathing room', 3),

((SELECT id FROM brands WHERE slug = 'style-system'), 'iconography-rules',    
'Iconography Guidelines:

STYLE: Flat, minimal, 2px stroke or solid fill. Geometric precision with 2px rounded corners.

STROKE SCALING:  
- 16px icons: 1.5px stroke  
- 24px icons: 2px stroke (base)  
- 32px icons: 3px stroke

ICON GRID:  
- Base canvas: 24×24px  
- Live area: 20×20px (2px padding all sides)  
- Align to 2px grid for pixel-perfect rendering

COLOR USAGE:  
- Default: neutral.500 (#6B7280)  
- Active: brand.primary (#3B82F6)  
- Disabled: neutral.300 (#D1D5DB)  
- Success: accent.success  
- Warning: accent.warning  
- Error: accent.error

DESIGN PRINCIPLES:  
- Prioritize clarity over decoration  
- Consistent stroke weight across complexity  
- All icons tested at 16px for legibility  
- Rounded caps on stroke ends  
- 2px corner radius on internal corners

Export as SVG with proper viewBox and accessibility labels.', 4),

((SELECT id FROM brands WHERE slug = 'style-system'), 'shadows-elevation',    
'Shadow and Elevation Guidelines:

ELEVATION LEVELS:

Level 1 (Subtle):  
box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1), 0 1px 2px rgba(0, 0, 0, 0.06);  
Usage: Cards on page, subtle lift

Level 2 (Standard):  
box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.06);  
Usage: Hover states, dropdowns, menus

Level 3 (Prominent):  
box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1), 0 4px 6px rgba(0, 0, 0, 0.05);  
Usage: Modals, popovers, tooltips, floating panels

FOCUS RING:  
box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.5);  
Usage: Keyboard focus states for accessibility

PRINCIPLES:  
- Use sparingly - not every element needs shadow  
- Shadows suggest interactive elevation  
- Heavier shadows = higher in Z-space  
- Maintain subtle, professional feel  
- Avoid heavy drop shadows', 5),

((SELECT id FROM brands WHERE slug = 'style-system'), 'logo-usage',    
'Logo Usage Guidelines:

LOCKUPS:  
- Horizontal: Primary wordmark for headers, marketing  
- Square: Stacked or icon for app icons, favicons  
- Icon-only: Tight spaces where wordmark won''t fit

MINIMUM SIZES:  
- Horizontal: 120px width minimum  
- Square: 48px minimum  
- Icon-only: 32px minimum

CLEAR SPACE:  
Maintain padding equal to height of "S" in "Style" on all sides of logo.

APPROVED BACKGROUNDS:  
- White / neutral.50 (light mode)  
- neutral.900 (dark mode - use inverted colors)  
- Clean, uncluttered surfaces only

PROHIBITED USES:  
✗ Don''t stretch, skew, or distort proportions  
✗ Don''t rotate or tilt  
✗ Don''t apply gradients, effects, or filters  
✗ Don''t use colors outside approved palette  
✗ Don''t place on busy backgrounds without sufficient contrast  
✗ Don''t crowd with other elements inside clear space  
✗ Don''t recreate or modify logo elements

When in doubt, use provided asset files without modification.', 6);

-- ============================================  
-- SPACING TOKENS  
-- ============================================

INSERT INTO brand_spacing (brand_id, token_name, value, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'base-unit', '8px', 'Foundation of all spacing — all values are multiples'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'space-1', '4px', 'Tiny gaps between inline elements'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'space-2', '8px', 'Small gaps between related elements'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'space-3', '12px', 'Compact spacing'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'space-4', '16px', 'Standard gaps between groups'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'space-6', '24px', 'Section spacing with breathing room'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'space-8', '32px', 'Large section divisions'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'space-12', '48px', 'Major divisions, marketing layouts'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'space-16', '64px', 'Page-level spacing'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'space-24', '96px', 'Hero spacing, maximum breathing room'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'container-mobile', '16px', 'Container padding on mobile devices'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'container-tablet', '24px', 'Container padding on tablets'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'container-desktop', '32px', 'Container padding on desktop'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'grid-gap-dense', '16px', 'Dense grid layouts'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'grid-gap-standard', '24px', 'Standard grid layouts'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'grid-gap-spacious', '32px', 'Spacious grid layouts'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'radius-sm', '2px', 'Small elements, badges, tags'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'radius-md', '4px', 'Buttons, inputs, standard UI'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'radius-lg', '8px', 'Cards, primary surfaces'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'radius-xl', '12px', 'Large containers, modals, panels');

-- ============================================  
-- SHADOW TOKENS  
-- ============================================

INSERT INTO brand_shadows (brand_id, token_name, css_value, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'style-system'), 'elevation-1', '0 1px 3px rgba(0, 0, 0, 0.1), 0 1px 2px rgba(0, 0, 0, 0.06)', 'Subtle lift for cards on page'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'elevation-2', '0 4px 6px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.06)', 'Standard elevation for hover states, dropdowns'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'elevation-3', '0 10px 15px rgba(0, 0, 0, 0.1), 0 4px 6px rgba(0, 0, 0, 0.05)', 'Prominent elevation for modals, popovers, tooltips'),  
((SELECT id FROM brands WHERE slug = 'style-system'), 'focus-ring', '0 0 0 3px rgba(59, 130, 246, 0.5)', 'Keyboard focus ring for accessibility (brand.primary at 50% opacity)');

-- ============================================  
-- VERIFICATION QUERIES  
-- ============================================

-- Verify brand was created  
SELECT 'Brand Created:' as status, name, slug, tagline FROM brands WHERE slug = 'style-system';

-- Count all elements  
SELECT  
'Element Counts:' as status,  
(SELECT COUNT(*) FROM brand_colors WHERE brand_id = (SELECT id FROM brands WHERE slug = 'style-system')) as colors,  
(SELECT COUNT(*) FROM brand_typography WHERE brand_id = (SELECT id FROM brands WHERE slug = 'style-system')) as typography,  
(SELECT COUNT(*) FROM brand_icons WHERE brand_id = (SELECT id FROM brands WHERE slug = 'style-system')) as icons,  
(SELECT COUNT(*) FROM brand_assets WHERE brand_id = (SELECT id FROM brands WHERE slug = 'style-system')) as assets,  
(SELECT COUNT(*) FROM brand_guidelines WHERE brand_id = (SELECT id FROM brands WHERE slug = 'style-system')) as guidelines,  
(SELECT COUNT(*) FROM brand_spacing WHERE brand_id = (SELECT id FROM brands WHERE slug = 'style-system')) as spacing_tokens,  
(SELECT COUNT(*) FROM brand_shadows WHERE brand_id = (SELECT id FROM brands WHERE slug = 'style-system')) as shadow_tokens;

-- View primary brand colors  
SELECT 'Primary Colors:' as section, token_name, hex, usage_notes  
FROM brand_colors  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'style-system')  
AND is_primary = 1;

-- View complete neutral scale  
SELECT 'Neutral Scale:' as section, token_name, hex  
FROM brand_colors  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'style-system')  
AND token_name LIKE 'neutral.%'  
ORDER BY CAST(SUBSTR(token_name, 9) AS INTEGER) DESC;

-- View all icon categories  
SELECT 'Icon Categories:' as section, category, COUNT(*) as count  
FROM brand_icons  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'style-system')  
GROUP BY category  
ORDER BY category;

-- View spacing scale  
SELECT 'Spacing Scale:' as section, token_name, value  
FROM brand_spacing  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'style-system')  
AND token_name LIKE 'space-%'  
ORDER BY CAST(REPLACE(REPLACE(token_name, 'space-', ''), 'px', '') AS INTEGER);