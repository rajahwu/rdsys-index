-- ============================================  
-- GRINDLINE STUDIO BRAND KIT - DATABASE POPULATION  
-- ============================================

-- Insert Grindline Studio as child of Radiant Systems  
INSERT INTO brands (id, name, slug, tagline, tone, keywords, created_at, updated_at)  
VALUES (  
'gls-15',  
'Grindline Studio',  
'grindline-studio',  
'Where Hustle Meets Flow',  
'Gritty, confident, street-smart — speaks with the voice of creators in the trenches. Direct and energetic without corporate polish. Celebrates daily grind, momentum, and tangible progress. Uses action verbs, no-nonsense language, and occasional slang that feels earned, not forced. Resilient, collaborative, community-driven.',  
'Hustle · Momentum · Craft · Resilience · Street-Smart · Community',  
NOW(),  
NOW()  
);

-- ============================================  
-- COLORS  
-- ============================================

INSERT INTO brand_colors (brand_id, token_name, hex, rgb, cmyk, pantone, usage_notes, is_primary)  
VALUES  
-- Primary brand colors  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'grindline.dark', '#2E2E2E', '46, 46, 46', '70, 64, 62, 60', 'Black 7 C', 'Asphalt Gray — base dark, urban grounding, night grind',  TRUE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'grindline.teal', '#00A6A6', '0, 166, 166', '75, 10, 30, 0', '3262 C', 'Electric Teal — energy, modernity, movement, primary accent',  TRUE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'grindline.coral', '#FF5A5F', '255, 90, 95', '0, 70, 60, 0', '178 C', 'Burnt Coral — passion, urgency, call to action',  TRUE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'grindline.gold', '#FFC857', '255, 200, 87', '0, 20, 70, 0', '1225 C', 'Warm Gold — achievement, spotlight, success moments',  TRUE),

-- Neutral colors    
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'neutral.light', '#F3F3F3', '243, 243, 243', '4, 3, 3, 0', 'Cool Gray 1 C', 'Light backgrounds, clean surfaces',  FALSE),    
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'neutral.mid', '#6B7280', '107, 114, 128', '45, 35, 28, 5', 'Cool Gray 8 C', 'Secondary text, muted content',  FALSE),    
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'neutral.white', '#FFFFFF', '255, 255, 255', '0, 0, 0, 0', 'White', 'Pure white — overlays, high contrast',  FALSE);

-- ============================================  
-- TYPOGRAPHY  
-- ============================================

INSERT INTO brand_typography (brand_id, token_name, font_family, font_weight, size_px, size_rem, line_height, letter_spacing, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'type.display', 'Oswald', 'Bold (700)', 48, 3.0, 1.1, '0.02em', 'Hero headlines, major impact, street presence'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'type.h1', 'Oswald', 'Bold (700)', 36, 2.25, 1.2, '0.01em', 'Page titles, section headers'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'type.h2', 'Oswald', 'SemiBold (600)', 28, 1.75, 1.25, 'normal', 'Subsection headers'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'type.h3', 'Oswald', 'SemiBold (600)', 22, 1.375, 1.3, 'normal', 'Card titles, feature headers'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'type.h4', 'Oswald', 'Medium (500)', 18, 1.125, 1.4, 'normal', 'Minor headings'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'type.body.large', 'Libre Franklin', 'Regular (400)', 18, 1.125, 1.6, 'normal', 'Lead paragraphs, introductions'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'type.body', 'Libre Franklin', 'Regular (400)', 16, 1.0, 1.6, 'normal', 'Standard content, descriptions'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'type.body.small', 'Libre Franklin', 'Regular (400)', 14, 0.875, 1.5, 'normal', 'Secondary information, metadata'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'type.caption', 'Libre Franklin', 'Regular (400)', 12, 0.75, 1.5, 'normal', 'Tiny labels, timestamps'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'type.button.large', 'Oswald', 'SemiBold (600)', 16, 1.0, 1.0, '0.05em', 'Large CTAs — uppercase'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'type.button', 'Oswald', 'SemiBold (600)', 14, 0.875, 1.0, '0.05em', 'Standard buttons — uppercase');

-- ============================================  
-- ICONS  
-- ============================================

-- Service Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'services', 'brand-systems', 'icons/services/brand-systems.svg', '24x24', '2.5px', 'Brand Systems — modular blocks, construction',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'services', 'creative-production', 'icons/services/creative-production.svg', '24x24', '2.5px', 'Creative Production — paint palette, spray can',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'services', 'ecommerce', 'icons/services/ecommerce.svg', '24x24', '2.5px', 'Ecommerce — shopping bag, storefront',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'services', 'launch-campaigns', 'icons/services/launch-campaigns.svg', '24x24', '2.5px', 'Launch Campaigns — megaphone, rocket',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'services', 'ops-consulting', 'icons/services/ops-consulting.svg', '24x24', '2.5px', 'Ops Consulting — clipboard, checklist',  FALSE);

-- Action Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'actions', 'build', 'icons/actions/build.svg', '24x24', '2.5px', 'Build — hammer, wrench',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'actions', 'create', 'icons/actions/create.svg', '24x24', '2.5px', 'Create — pencil, brush',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'actions', 'launch', 'icons/actions/launch.svg', '24x24', '2.5px', 'Launch — rocket, arrow up',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'actions', 'connect', 'icons/actions/connect.svg', '24x24', '2.5px', 'Connect — link, handshake',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'actions', 'progress', 'icons/actions/progress.svg', '24x24', '2.5px', 'Progress — upward arrow, growth',  FALSE);

-- Navigation Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'nav', 'services', 'icons/nav/services.svg', '24x24', '2.5px', 'Services — grid blocks',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'nav', 'work', 'icons/nav/work.svg', '24x24', '2.5px', 'Work — briefcase, toolbox',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'nav', 'team', 'icons/nav/team.svg', '24x24', '2.5px', 'Team — people, community',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'nav', 'contact', 'icons/nav/contact.svg', '24x24', '2.5px', 'Contact — speech bubble',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'nav', 'menu', 'icons/nav/menu.svg', '24x24', '2.5px', 'Menu — stacked lines',  FALSE);

-- Status Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'status', 'active', 'icons/status/active.svg', '24x24', '2.5px', 'Active — filled circle with pulse',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'status', 'grinding', 'icons/status/grinding.svg', '24x24', '2.5px', 'Grinding — rotating gear',  TRUE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'status', 'complete', 'icons/status/complete.svg', '24x24', '2.5px', 'Complete — solid checkmark',  FALSE),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'status', 'queued', 'icons/status/queued.svg', '24x24', '2.5px', 'Queued — stacked dots',  FALSE);

-- ============================================  
-- ASSETS  
-- ============================================

-- Logos  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'logo', 'lockup', 'Horizontal Lockup', 'logo/grindline-lockup.svg', 'svg', 'Grindline mark + GRINDLINE STUDIO wordmark horizontal'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'logo', 'lockup-white', 'White Lockup', 'logo/grindline-lockup-white.svg', 'svg', 'White version for dark backgrounds'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'logo', 'stacked', 'Stacked Lockup', 'logo/grindline-stacked.svg', 'svg', 'Mark above wordmark for square spaces'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'logo', 'mark', 'Grindline Mark', 'logo/grindline-mark.svg', 'svg', 'Grinding wheel/gear mark — primary brand icon'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'logo', 'mark-white', 'White Mark', 'logo/grindline-mark-white.svg', 'svg', 'White mark for dark backgrounds');

-- Textures  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'texture', 'overlay', 'Grain Overlay', 'illustrations/textures/grain-overlay.png', 'png', 'Subtle noise texture at 5-10% opacity'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'texture', 'pattern', 'Halftone Pattern', 'illustrations/textures/halftone-pattern.svg', 'svg', 'Dot pattern for depth without solid fills'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'texture', 'background', 'Paper Texture', 'illustrations/textures/paper-texture.png', 'png', 'Subtle paper grain for light backgrounds'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'texture', 'photo', 'Concrete Wall', 'illustrations/textures/concrete-wall.jpg', 'jpg', 'Urban textured background');

-- Illustrations - Backgrounds  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'illustration', 'background', 'Urban Wall', 'illustrations/backgrounds/urban-wall.jpg', 'jpg', 'Textured city wall for hero sections'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'illustration', 'background', 'Workspace Texture', 'illustrations/backgrounds/workspace-texture.jpg', 'jpg', 'Studio workspace background'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'illustration', 'background', 'Street Scene', 'illustrations/backgrounds/street-scene.jpg', 'jpg', 'Urban street photography background');

-- Illustrations - Graphics  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'illustration', 'graphic', 'Under Construction', 'illustrations/graphics/under-construction.svg', 'svg', 'Work-in-progress graphic with grit'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'illustration', 'graphic', 'Process Panel', 'illustrations/graphics/process-panel.svg', 'svg', 'Comic-style process explanation'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'illustration', 'graphic', 'Success Stamp', 'illustrations/graphics/success-stamp.svg', 'svg', 'Gold spray-paint stamp effect');

-- Illustrations - Empty States  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'illustration', 'empty-state', 'No Projects', 'illustrations/empty-states/no-projects.svg', 'svg', 'Empty state when no work exists'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'illustration', 'empty-state', 'Start Grinding', 'illustrations/empty-states/start-grinding.svg', 'svg', 'Encouraging empty state to begin work');


-- ============================================  
-- GUIDELINES  
-- ============================================

INSERT INTO brand_guidelines (brand_id, section, content, display_order)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'color-usage',  
'Color Usage Guidelines:

PRIMARY PALETTE:  
- grindline.dark (#2E2E2E): Asphalt Gray — base dark, urban grounding, night grind  
- grindline.teal (#00A6A6): Electric Teal — energy, modernity, movement, primary accent  
- grindline.coral (#FF5A5F): Burnt Coral — passion, urgency, calls to action  
- grindline.gold (#FFC857): Warm Gold — achievement, spotlight, success moments

VIBE:  
Urban energy and street-level hustle. More saturation and warmth than Dropframe — less corporate, more human. Asphalt provides gritty grounding. Electric Teal brings kinetic energy. Burnt Coral creates passionate urgency. Warm Gold celebrates wins.

COLOR PAIRING:  
- Primary brand: grindline.dark + grindline.teal  
- High energy: grindline.teal + grindline.coral  
- Achievement: grindline.gold on grindline.dark  
- Text: grindline.dark on neutral.light or neutral.white on grindline.dark  
- CTAs: grindline.coral on neutral.white (high contrast, urgent)  
- Success states: grindline.gold accents

USAGE NOTES:  
This palette has more grit than Dropframe. Embrace texture overlays and grain. Don''t sanitize — the imperfection is intentional.', 1),

((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'typography-usage',    
'Typography Usage Guidelines:

FONT FAMILIES:  
- Headings: Oswald (condensed, industrial strength, street-level presence)  
- Body: Libre Franklin (clean, accessible, straightforward)

WEIGHT HIERARCHY:  
- Bold (700): Display, H1 — major street presence  
- SemiBold (600): H2, H3, Buttons — moderate impact  
- Medium (500): H4 — minor headings  
- Regular (400): All body content

LETTER-SPACING:  
- Display: +0.02em (prevents cramped feeling despite condensed width)  
- H1: +0.01em (slight breathing room)  
- Buttons: +0.05em (uppercase with loose tracking for max impact)  
- All others: normal

LINE HEIGHT:  
- Headings: 1.1-1.4 (tight but not crushed)  
- Body: 1.6 (generous for readability)  
- Buttons: 1.0 (compact for CTAs)

FALLBACK STACKS:  
- Oswald: "Oswald", "Inter", "Franklin Gothic", sans-serif  
- Libre Franklin: "Libre Franklin", "Work Sans", "Open Sans", sans-serif

Typography feels more grounded and urban than Dropframe''s geometric precision. Oswald brings street-sign energy without being distressed or forced.', 2),

((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'spacing-system',    
'Spacing System Guidelines:

BASE UNIT: 8px  
All spacing is multiples of 8 for consistency.

SPACING SCALE:  
8px — Tiny gaps  
16px — Small spacing  
24px — Standard gaps  
32px — Section spacing  
48px — Large sections  
64px — Major divisions

UI SPACING:  
- 16px between related elements  
- 24px between element groups  
- 32px between major sections

CARD PADDING:  
- Compact: 20px (tighter than Dropframe''s 24px)  
- Spacious: 32px

CONTAINER PADDING:  
- Mobile: 16px  
- Tablet: 24px  
- Desktop: 32px

TIGHTER FEEL:  
Grindline uses slightly tighter spacing than Dropframe to feel more packed, energetic, urban — less breathing room, more action.', 3),

((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'iconography-rules',    
'Iconography Guidelines:

STYLE:  
Bold, solid-fill icons with strong presence. More weight than typical line icons — think street signage and industrial marks. Geometric but organic, imperfect edges welcome.

STROKE: 2.5px (thicker than refined systems — more presence)  
FILL STYLE: Solid fills preferred over outlines for key icons  
CORNER RADIUS: 2-3px, slightly more rounded than sharp geometric  
SIZES: 20×20px (compact), 24×24px (standard), 32×32px (features), 40×40px (hero)

ICON GRID:  
- Base canvas: 24×24px  
- Live area: 20×20px (2px padding)  
- Less strict pixel-grid alignment than Dropframe — slight organic variation acceptable

COLOR USAGE:  
- Default: neutral.mid (#6B7280)  
- Active: grindline.teal (#00A6A6)  
- CTA: grindline.coral (#FF5A5F)  
- Success: grindline.gold (#FFC857)

SPECIAL GLYPH:  
Grindline Mark — Stylized grinding wheel or gear shape representing continuous motion and momentum. Primary brand mark used in logo, favicon, loading states (animated rotation), corner stamps, achievement badges.

CATEGORIES:  
- Services: 5 icons (brand systems, creative, ecommerce, launch, ops)  
- Actions: 5 icons (build, create, launch, connect, progress)  
- Navigation: 5 icons (services, work, team, contact, menu)  
- Status: 4 icons (active, grinding, complete, queued)

Icons prioritize bold presence over refined precision — street-level impact.', 4),

((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'illustration-photography',    
'Illustration and Photography Guidelines:

ILLUSTRATION STYLE:  
Urban, textured, street-art influenced. Hand-drawn quality with intentional imperfection. Layered compositions with grit and depth. Think: wheat-paste posters, spray-painted stencils, DIY zine aesthetic.

VISUAL ELEMENTS:  
- Hand-drawn line work (intentional roughness)  
- Halftone patterns and textures  
- Layered paper cutout style  
- Spray paint effects (soft edges, overspray)  
- Stencil-style typography integration  
- Urban photography backgrounds (textured walls, concrete)

PALETTE:  
- grindline.dark base with vibrant pops of teal, coral, gold  
- Textures and grain encouraged  
- Don''t over-polish — embrace the grit

PHOTOGRAPHY DIRECTION:  
- Candid process shots, hands at work  
- Urban environments, street-level business  
- Natural light, golden hour warmth  
- Rule of thirds but not precious — capture energy  
- Warm grade with grain, boost contrast

DO''S:  
✓ Real work in progress  
✓ Authentic urban environments  
✓ Hands-on process shots  
✓ Textured backgrounds (brick, concrete, wood)  
✓ Dynamic angles and movement

DON''TS:  
✗ Sterile studios  
✗ Overly posed corporate shots  
✗ Stock imagery  
✗ Perfect white backgrounds  
✗ Static, lifeless compositions

MOOD:  
Street-level maker culture meets professional execution. Brooklyn studio spaces, skate culture graphics, independent labels, urban murals. Show the work, not just the result.', 5),

((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'logo-usage',    
'Logo Usage Guidelines:

LOGO VARIANTS:  
- Horizontal lockup: Grindline mark + "GRINDLINE STUDIO" wordmark  
- Stacked: Mark above wordmark for square spaces  
- Icon-only: Grindline mark alone for app icons, favicons

MINIMUM SIZES:  
- Horizontal: 160px width minimum  
- Stacked: 80px width minimum  
- Icon: 32px minimum

CLEAR SPACE:  
Maintain padding equal to height of mark on all sides.

APPROVED BACKGROUNDS:  
- grindline.dark (#2E2E2E)  
- neutral.light (#F3F3F3)  
- Textured walls (concrete, brick)  
- Urban photography  
- Clean surfaces with texture overlay

SPECIAL GLYPH:  
Grindline Mark — Grinding wheel/gear shape represents continuous motion, momentum, and the grind itself. Can rotate/animate in loading states.

PROHIBITED USES:  
✗ Don''t stretch or distort proportions  
✗ Don''t sanitize the grit — embrace imperfection  
✗ Don''t use colors outside palette  
✗ Don''t place on low-contrast busy backgrounds

FLEXIBILITY:  
Logo can be "pasted" at slight angles for street-poster effect — this is intentional, not a mistake. The mark should feel lived-in, not precious.', 6);

-- ============================================  
-- SPACING TOKENS  
-- ============================================

INSERT INTO brand_spacing (brand_id, token_name, value, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'base-unit', '8px', 'Foundation of all spacing'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'space-xs', '8px', 'Tiny gaps'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'space-sm', '16px', 'Small spacing'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'space-md', '24px', 'Standard gaps'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'space-lg', '32px', 'Section spacing'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'space-xl', '48px', 'Large sections'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'space-2xl', '64px', 'Major divisions'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'card-padding-compact', '20px', 'Compact card padding — tighter than Dropframe'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'card-padding-spacious', '32px', 'Spacious card padding'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'container-mobile', '16px', 'Container padding on mobile'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'container-tablet', '24px', 'Container padding on tablets'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'container-desktop', '32px', 'Container padding on desktop'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'radius-sm', '4px', 'Small elements: buttons, tags'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'radius-md', '6px', 'Cards, inputs — softer than geometric 8px'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'radius-lg', '12px', 'Feature sections, modals'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'radius-organic', '8-16px', 'Variable radius for hand-drawn elements'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'border-thin', '1px', 'Standard dividers'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'border-medium', '2px', 'Emphasis, active states'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'border-heavy', '3-4px', 'Strong emphasis, street-sign style');

-- ============================================  
-- SHADOW TOKENS  
-- ============================================

INSERT INTO brand_shadows (brand_id, token_name, css_value, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'elevation-sm', '0 2px 4px rgba(46, 46, 46, 0.15)', 'Card lift, subtle depth'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'elevation-md', '0 4px 8px rgba(46, 46, 46, 0.2)', 'Hover states, dropdowns'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'elevation-lg', '0 8px 16px rgba(46, 46, 46, 0.3)', 'Modals, major overlays — stronger than Dropframe'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'glow-teal', '0 0 20px rgba(0, 166, 166, 0.4)', 'Active states, neon-sign effect'),  
((SELECT id FROM brands WHERE slug = 'grindline-studio'), 'focus-ring', '0 0 0 3px rgba(0, 166, 166, 0.5)', 'Keyboard focus — electric teal');

-- ============================================  
-- VERIFICATION QUERIES  
-- ============================================

-- Verify brand was created  
SELECT 'Brand Created:' as status, name, slug, tagline FROM brands WHERE slug = 'grindline-studio';

-- Count all elements  
SELECT  
'Element Counts:' as status,  
(SELECT COUNT(*) FROM brand_colors WHERE brand_id = (SELECT id FROM brands WHERE slug = 'grindline-studio')) as colors,  
(SELECT COUNT(*) FROM brand_typography WHERE brand_id = (SELECT id FROM brands WHERE slug = 'grindline-studio')) as typography,  
(SELECT COUNT(*) FROM brand_icons WHERE brand_id = (SELECT id FROM brands WHERE slug = 'grindline-studio')) as icons,  
(SELECT COUNT(*) FROM brand_assets WHERE brand_id = (SELECT id FROM brands WHERE slug = 'grindline-studio')) as assets,  
(SELECT COUNT(*) FROM brand_guidelines WHERE brand_id = (SELECT id FROM brands WHERE slug = 'grindline-studio')) as guidelines,  
(SELECT COUNT(*) FROM brand_spacing WHERE brand_id = (SELECT id FROM brands WHERE slug = 'grindline-studio')) as spacing_tokens,  
(SELECT COUNT(*) FROM brand_shadows WHERE brand_id = (SELECT id FROM brands WHERE slug = 'grindline-studio')) as shadow_tokens;

-- View brand color palette  
SELECT 'Color Palette:' as section, token_name, hex, usage_notes  
FROM brand_colors  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'grindline-studio')  
ORDER BY is_primary DESC, token_name;

-- View service icons  
SELECT 'Service Icons:' as section, name, description  
FROM brand_icons  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'grindline-studio')  
AND category = 'services'  
ORDER BY name;

-- View typography scale  
SELECT 'Typography Scale:' as section, token_name, font_family, size_px, usage_notes  
FROM brand_typography  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'grindline-studio')  
ORDER BY size_px DESC;