-- ============================================  
-- DROPFRAME BRAND KIT - DATABASE POPULATION  
-- ============================================

-- Insert Dropframe as child of Radiant Systems  
INSERT INTO brands (name, slug, tagline, tone, keywords, created_at, updated_at)  
VALUES (  
'Dropframe',  
'dropframe',  
'Build Your Brand in Motion',  
'Precise, confident, slightly technical but approachable — speaks with clarity about modular systems and scalable design. Strategic without being cold, supportive without slang. Action-oriented language that invites creators to plan, scale, and launch with precision. Professional polish with cinematic energy.',  
'Modular · Precise · Motion · Scalable · Cinematic · Strategic',  
NOW(),  
NOW()  
);

-- ============================================  
-- COLORS  
-- ============================================

INSERT INTO brand_colors (brand_id, token_name, hex, rgb, cmyk, pantone, usage_notes, is_primary)  
VALUES  
-- Primary brand colors  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'dropframe.teal', '#006E6D', '0, 110, 109', '100, 25, 30, 30', '3282 C', 'Cobbs Creek Teal — primary brand accent, calm energy, digital modernity',  TRUE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'dropframe.red', '#C41230', '196, 18, 48', '10, 95, 80, 10', '186 C', 'Colonial Red — calls to action, focus, urgency',  TRUE),

-- Tier colors    
((SELECT id FROM brands WHERE slug = 'dropframe'), 'tier.gold', '#FFC857', '255, 200, 87', '0, 20, 70, 0', '1225 C', 'Tier 1 accent — Warm Gold, achievement highlights',  FALSE),    
((SELECT id FROM brands WHERE slug = 'dropframe'), 'tier.lavender', '#B497BD', '180, 151, 189', '35, 35, 5, 0', '2567 C', 'Tier 2 accent — West Philly Lavender, trust, polish',  FALSE),    
((SELECT id FROM brands WHERE slug = 'dropframe'), 'tier.slate', '#4B4B4B', '75, 75, 75', '60, 52, 52, 40', 'Cool Gray 11 C', 'Tier 3 accent — Slate Gray, secondary depth',  FALSE),    
    
-- Neutral colors    
((SELECT id FROM brands WHERE slug = 'dropframe'), 'neutral.light', '#F5F5F5', '245, 245, 245', '3, 2, 2, 0', 'Cool Gray 1 C', 'Background surfaces, light base',  FALSE),    
((SELECT id FROM brands WHERE slug = 'dropframe'), 'neutral.dark', '#212121', '33, 33, 33', '75, 68, 67, 70', 'Black 6 C', 'Primary text, high emphasis',  FALSE),    
((SELECT id FROM brands WHERE slug = 'dropframe'), 'neutral.white', '#FFFFFF', '255, 255, 255', '0, 0, 0, 0', 'White', 'Pure white — cards, overlays',  FALSE);

-- ============================================  
-- TYPOGRAPHY  
-- ============================================

INSERT INTO brand_typography (brand_id, token_name, font_family, font_weight, size_px, size_rem, line_height, letter_spacing, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'type.display', 'Inter', 'Bold (700)', 40, 2.5, 1.2, '-0.01em', 'Hero headlines, major impact'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'type.h1', 'Inter', 'Bold (700)', 32, 2.0, 1.25, '-0.01em', 'Page titles, section headers'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'type.h2', 'Inter', 'Bold (700)', 24, 1.5, 1.3, 'normal', 'Subsection headers'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'type.h3', 'Inter', 'SemiBold (600)', 20, 1.25, 1.4, 'normal', 'Card titles, component headers'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'type.h4', 'Inter', 'SemiBold (600)', 18, 1.125, 1.4, 'normal', 'Minor headings'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'type.body.large', 'Libre Franklin', 'Regular (400)', 18, 1.125, 1.6, 'normal', 'Lead paragraphs, introductions'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'type.body', 'Libre Franklin', 'Regular (400)', 16, 1.0, 1.6, 'normal', 'Standard content, descriptions'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'type.body.small', 'Libre Franklin', 'Regular (400)', 14, 0.875, 1.5, 'normal', 'Secondary information, metadata'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'type.caption', 'Libre Franklin', 'Regular (400)', 12, 0.75, 1.5, 'normal', 'Tiny labels, timestamps, footnotes'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'type.button.large', 'Inter', 'SemiBold (600)', 16, 1.0, 1.0, '0.05em', 'Primary CTAs — uppercase'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'type.button', 'Inter', 'SemiBold (600)', 14, 0.875, 1.0, '0.05em', 'Standard buttons — uppercase');

-- ============================================  
-- ICONS  
-- ============================================

-- Service Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'services', 'brand-systems', 'icons/services/brand-systems.svg', '24x24', '1.5px', 'Brand Systems Architecture — modular grid',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'services', 'creative-production', 'icons/services/creative-production.svg', '24x24', '1.5px', 'Creative Production — frame/filmstrip',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'services', 'ecommerce-enable', 'icons/services/ecommerce-enable.svg', '24x24', '1.5px', 'Ecommerce Enablement — shopping cart with motion',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'services', 'launch-campaigns', 'icons/services/launch-campaigns.svg', '24x24', '1.5px', 'Launch Campaigns — rocket/launch',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'services', 'operational-consulting', 'icons/services/operational-consulting.svg', '24x24', '1.5px', 'Operational Consulting — checklist/process flow',  FALSE);

-- Interface Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'interface', 'frame', 'icons/interface/frame.svg', '24x24', '1.5px', 'Frame — crop marks, filmstrip borders',  TRUE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'interface', 'grid', 'icons/interface/grid.svg', '24x24', '1.5px', 'Grid — modular layout',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'interface', 'motion', 'icons/interface/motion.svg', '24x24', '1.5px', 'Motion — directional arrows, flow',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'interface', 'scale', 'icons/interface/scale.svg', '24x24', '1.5px', 'Scale — size indicators, growth',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'interface', 'precision', 'icons/interface/precision.svg', '24x24', '1.5px', 'Precision — target, alignment guides',  FALSE);

-- Navigation Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'nav', 'services', 'icons/nav/services.svg', '24x24', '1.5px', 'Services navigation — grid icon',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'nav', 'portfolio', 'icons/nav/portfolio.svg', '24x24', '1.5px', 'Portfolio navigation — frame/gallery',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'nav', 'process', 'icons/nav/process.svg', '24x24', '1.5px', 'Process navigation — flow diagram',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'nav', 'contact', 'icons/nav/contact.svg', '24x24', '1.5px', 'Contact navigation — message',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'nav', 'menu', 'icons/nav/menu.svg', '24x24', '1.5px', 'Menu — horizontal lines',  FALSE);

-- Status Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'status', 'in-progress', 'icons/status/in-progress.svg', '24x24', '1.5px', 'In progress — circular progress',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'status', 'complete', 'icons/status/complete.svg', '24x24', '1.5px', 'Complete — checkmark in frame',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'status', 'ready', 'icons/status/ready.svg', '24x24', '1.5px', 'Ready — green indicator',  FALSE),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'status', 'pending', 'icons/status/pending.svg', '24x24', '1.5px', 'Pending — clock',  FALSE);

-- ============================================  
-- ASSETS  
-- ============================================

-- Logos  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'logo', 'lockup', 'Primary Logo Lockup', 'logo/dropframe-lockup.svg', 'svg', 'DF monogram in frame + Dropframe wordmark horizontal'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'logo', 'lockup-white', 'Logo for Dark Backgrounds', 'logo/dropframe-lockup-white.svg', 'svg', 'White version for dark backgrounds'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'logo', 'icon', 'DF Monogram Icon', 'logo/df-monogram.svg', 'svg', 'DF in frame — primary brand mark'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'logo', 'icon-white', 'DF Monogram White', 'logo/df-monogram-white.svg', 'svg', 'White icon for dark backgrounds');

-- Illustrations - Backgrounds  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'illustration', 'background', 'Grid Overlay', 'illustrations/backgrounds/grid-overlay.svg', 'svg', 'Subtle modular grid pattern for backgrounds'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'illustration', 'background', 'Motion Gradient', 'illustrations/backgrounds/motion-gradient.svg', 'svg', 'Cinematic gradient with motion blur'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'illustration', 'background', 'Frame Pattern', 'illustrations/backgrounds/frame-pattern.svg', 'svg', 'Repeating frame motif background');

-- Illustrations - Diagrams  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'illustration', 'diagram', 'Modular System', 'illustrations/diagrams/modular-system.svg', 'svg', 'Visual diagram of modular brand systems'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'illustration', 'diagram', 'Process Flow', 'illustrations/diagrams/process-flow.svg', 'svg', 'Step-by-step process visualization'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'illustration', 'diagram', 'Brand Architecture', 'illustrations/diagrams/brand-architecture.svg', 'svg', 'Brand systems architecture diagram');

-- Illustrations - Empty States  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'illustration', 'empty-state', 'No Projects', 'illustrations/empty-states/no-projects.svg', 'svg', 'Empty state when no projects exist'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'illustration', 'empty-state', 'Start Building', 'illustrations/empty-states/start-building.svg', 'svg', 'Encouraging empty state to begin project');

-- ============================================  
-- GUIDELINES  
-- ============================================

INSERT INTO brand_guidelines (brand_id, section, content, display_order)  
VALUES  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'color-usage',  
'Color Usage Guidelines:

PRIMARY PALETTE:  
- dropframe.teal (#006E6D): Primary brand accent, calm energy, digital modernity  
- dropframe.red (#C41230): Calls to action, focus, urgency  
- Cooler, more technical than Grindline — evokes digital clarity with cinematic teal-and-red contrast

TIER COLORS:  
- tier.gold (#FFC857): Achievement highlights, Tier 1 services  
- tier.lavender (#B497BD): Trust and polish, Tier 2 services  
- tier.slate (#4B4B4B): Secondary depth, Tier 3 services

COLOR PAIRING:  
- Primary UI: dropframe.teal on neutral.light or neutral.white  
- CTAs: dropframe.red on neutral.white (high contrast)  
- Tier highlights: Gold/Lavender/Slate as accents on neutral backgrounds  
- Text: neutral.dark on neutral.light or neutral.white on dropframe.teal  
- Interactive states: Default teal, hover darker teal, active red

Dropframe palette keeps backgrounds clean and modern without competing with accent colors.',  TRUE),

((SELECT id FROM brands WHERE slug = 'dropframe'), 'typography-usage',    
'Typography Usage Guidelines:

FONT FAMILIES:  
- Headings: Inter (geometric precision, tech-forward clarity)  
- Body: Libre Franklin (clean, accessible readability)

WEIGHT HIERARCHY:  
- Bold (700): Display, H1, H2 — major impact  
- SemiBold (600): H3, H4, Buttons — moderate emphasis  
- Regular (400): All body content

LETTER-SPACING:  
- Display/H1: -0.01em (slightly tighter for optical balance)  
- Buttons: +0.05em (uppercase with looser spacing for impact)  
- All others: normal

LINE HEIGHT:  
- Headings: 1.2-1.4 (tighter for visual rhythm)  
- Body: 1.6 (generous for readability)  
- Buttons: 1.0 (compact for CTAs)

FALLBACK STACKS:  
- Inter: "Inter", "Manrope", "Neue Haas Grotesk", sans-serif  
- Libre Franklin: "Libre Franklin", "Work Sans", -apple-system, sans-serif

Typography balances geometric precision (Inter) with accessible clarity (Libre Franklin) for design-systems feel.', 2),

((SELECT id FROM brands WHERE slug = 'dropframe'), 'spacing-system',    
'Spacing System Guidelines:

BASE UNIT: 8px (0.5rem)  
All spacing is multiples of 8 for grid-aligned consistency.

SPACING SCALE:  
8px — Tiny gaps  
16px — Small spacing  
24px — Standard gaps  
32px — Section spacing  
48px — Large sections  
64px — Major divisions  
96px — Hero spacing

UI SPACING:  
- 16px between elements  
- 24px between groups  
- 32px between major sections

CARD PADDING:  
- Standard: 24px  
- Spacious: 32px

CONTAINER PADDING:  
- Mobile: 16px  
- Tablet: 24px  
- Desktop: 32px  
- Large Desktop: 48px

The 8px base unit ensures modular, grid-friendly layouts essential for precision design systems.', 3),

((SELECT id FROM brands WHERE slug = 'dropframe'), 'iconography-rules',    
'Iconography Guidelines:

STYLE:  
Thin-line, geometric icons with consistent stroke width. Modern and systematic. More geometric and precise than organic.

STROKE: 1.5px (thinner than typical 2px for refined look)  
CORNER RADIUS: 2px on internal corners, rounded stroke caps  
SIZES: 16×16px (inline), 20×20px (compact), 24×24px (standard), 32×32px (features)

ICON GRID:  
- Base canvas: 24×24px  
- Live area: 22×22px (1px padding)  
- Align to pixel grid for crisp rendering

COLOR USAGE:  
- Default: tier.slate (#4B4B4B)  
- Active: dropframe.teal (#006E6D)  
- CTA: dropframe.red (#C41230)

SPECIAL GLYPH:  
DF Monogram in Frame — "DF" letterforms inside square frame with subtle crop marks at corners. Primary brand mark used in logo, favicon, loading states, service badges.

CATEGORIES:  
- Services: 5 icons (brand systems, creative, ecommerce, launch, ops)  
- Interface: 5 icons (frame, grid, motion, scale, precision)  
- Navigation: 5 icons (services, portfolio, process, contact, menu)  
- Status: 4 icons (in-progress, complete, ready, pending)

Icons prioritize geometric precision and modular clarity.', 4),

((SELECT id FROM brands WHERE slug = 'dropframe'), 'illustration-photography',    
'Illustration and Photography Guidelines:

ILLUSTRATION STYLE:  
Modular, geometric compositions with subtle gradients and animation-frame motifs. Clean, polished, cinematic — minimal grit, maximum clarity.

VISUAL ELEMENTS:  
- Modular grid overlays (subtle frame lines)  
- Animation frames (filmstrip-style sequences)  
- UI screenshots with frame highlights  
- Abstract geometric shapes  
- Motion blur hints (directional gradients, speed lines)

PALETTE:  
- Neutral backgrounds (neutral.light, neutral.white)  
- Vibrant accents (dropframe.teal, dropframe.red)  
- Tier colors for layering (Gold, Lavender, Slate)  
- Subtle gradients for cinematic polish

PHOTOGRAPHY DIRECTION:  
- Clean studio shots, process close-ups, UI mockups  
- Soft, even lighting with subtle highlights  
- Grid-aligned, rule of thirds composition  
- Slight cool color grade, preserve teal tones  
- Minimal saturation boost

DO''S:  
✓ Clean, organized workspaces  
✓ Digital screens showing work  
✓ Motion blur for energy  
✓ Modular, grid-based compositions  
✓ Cinematic color grading

DON''TS:  
✗ Cluttered backgrounds  
✗ Harsh lighting or high contrast  
✗ Stock "business meeting" imagery  
✗ Overly saturated colors  
✗ Casual/unprofessional setups

MOOD:  
Cinematic precision meets design-systems thinking. Think: modern motion design tools, polished UI kits, Apple product photography, frame-by-frame storyboards.', 5),

((SELECT id FROM brands WHERE slug = 'dropframe'), 'logo-usage',    
'Logo Usage Guidelines:

LOGO VARIANTS:  
- Primary lockup: DF monogram in frame + "Dropframe" wordmark (horizontal)  
- Icon-only: DF monogram in frame for app icons, favicons

MINIMUM SIZES:  
- Lockup: 140px width minimum  
- Icon: 32px minimum

CLEAR SPACE:  
Maintain padding equal to height of "D" in "Dropframe" on all sides.

APPROVED BACKGROUNDS:  
- neutral.light (#F5F5F5)  
- neutral.white (#FFFFFF)  
- Dark overlays (use white version)  
- Clean, uncluttered surfaces only

SPECIAL GLYPH:  
DF Monogram in Frame — "DF" inside square frame with subtle crop marks represents modular systems and motion design. Appears on:  
- Logo lockup  
- Favicon/app icon  
- Loading states  
- Footer signature  
- Service badges

PROHIBITED USES:  
✗ Don''t stretch or distort the frame or letterforms  
✗ Don''t rotate logo  
✗ Don''t apply gradients or effects to logo itself  
✗ Don''t use colors outside approved palette  
✗ Don''t place on busy backgrounds without sufficient contrast  
✗ Don''t crowd with other elements inside clear space

The frame motif symbolizes systematic design and motion precision — treat it as functional mark, not decoration.', 6);

-- ============================================  
-- SPACING TOKENS  
-- ============================================

INSERT INTO brand_spacing (brand_id, token_name, value, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'base-unit', '8px', 'Foundation of all spacing — all values are multiples'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'space-xs', '8px', 'Tiny gaps — 0.5rem'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'space-sm', '16px', 'Small spacing — 1rem'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'space-md', '24px', 'Standard gaps — 1.5rem'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'space-lg', '32px', 'Section spacing — 2rem'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'space-xl', '48px', 'Large sections — 3rem'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'space-2xl', '64px', 'Major divisions — 4rem'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'space-3xl', '96px', 'Hero spacing — 6rem'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'card-padding-standard', '24px', 'Standard card internal padding'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'card-padding-spacious', '32px', 'Spacious card internal padding'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'container-mobile', '16px', 'Container padding on mobile devices'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'container-tablet', '24px', 'Container padding on tablets'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'container-desktop', '32px', 'Container padding on desktop'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'container-lg-desktop', '48px', 'Container padding on large desktop'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'radius-sm', '4px', 'Small elements: buttons, tags, small cards'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'radius-md', '8px', 'Standard cards, inputs'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'radius-lg', '12px', 'Feature cards, modals'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'radius-xl', '16px', 'Hero sections, large containers'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'border-thin', '1px', 'Standard dividers, subtle borders'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'border-medium', '2px', 'Emphasis borders, active states'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'border-thick', '3px', 'Strong emphasis, frame motifs');

-- ============================================  
-- SHADOW TOKENS  
-- ============================================

INSERT INTO brand_shadows (brand_id, token_name, css_value, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'elevation-sm', '0 2px 4px rgba(0, 110, 109, 0.08)', 'Subtle elevation for cards'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'elevation-md', '0 4px 8px rgba(0, 110, 109, 0.12)', 'Standard elevation for hover states, dropdowns'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'elevation-lg', '0 8px 16px rgba(0, 110, 109, 0.16)', 'Prominent elevation for modals, important panels'),  
((SELECT id FROM brands WHERE slug = 'dropframe'), 'focus-ring', '0 0 0 3px rgba(0, 110, 109, 0.3)', 'Keyboard focus ring — teal for brand consistency');

-- ============================================  
-- VERIFICATION QUERIES  
-- ============================================

-- Verify brand was created  
SELECT 'Brand Created:' as status, name, slug, tagline FROM brands WHERE slug = 'dropframe';

-- Count all elements  
SELECT  
'Element Counts:' as status,  
(SELECT COUNT(*) FROM brand_colors WHERE brand_id = (SELECT id FROM brands WHERE slug = 'dropframe')) as colors,  
(SELECT COUNT(*) FROM brand_typography WHERE brand_id = (SELECT id FROM brands WHERE slug = 'dropframe')) as typography,  
(SELECT COUNT(*) FROM brand_icons WHERE brand_id = (SELECT id FROM brands WHERE slug = 'dropframe')) as icons,  
(SELECT COUNT(*) FROM brand_assets WHERE brand_id = (SELECT id FROM brands WHERE slug = 'dropframe')) as assets,  
(SELECT COUNT(*) FROM brand_guidelines WHERE brand_id = (SELECT id FROM brands WHERE slug = 'dropframe')) as guidelines,  
(SELECT COUNT(*) FROM brand_spacing WHERE brand_id = (SELECT id FROM brands WHERE slug = 'dropframe')) as spacing_tokens,  
(SELECT COUNT(*) FROM brand_shadows WHERE brand_id = (SELECT id FROM brands WHERE slug = 'dropframe')) as shadow_tokens;

-- View brand color palette  
SELECT 'Color Palette:' as section, token_name, hex, usage_notes  
FROM brand_colors  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'dropframe')  
ORDER BY is_primary DESC, token_name;

-- View service icons  
SELECT 'Service Icons:' as section, name, description  
FROM brand_icons  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'dropframe')  
AND category = 'services'  
ORDER BY name;

-- View typography scale  
SELECT 'Typography Scale:' as section, token_name, font_family, size_px, usage_notes  
FROM brand_typography  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'dropframe')  
ORDER BY size_px DESC;