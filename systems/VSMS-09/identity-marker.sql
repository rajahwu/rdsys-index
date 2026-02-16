-- ============================================  
-- VSM SCHOOL BRAND KIT - DATABASE POPULATION  
-- ============================================

-- Insert VSM School as child of Radiant Systems  
INSERT INTO brands (name, slug, tagline, tone, keywords, parent_brand_id, created_at, updated_at)  
VALUES (  
'VSM School',  
'vsm-school',  
'From foundation to mastery, one phase at a time',  
'Calm, precise, and encouraging — feels like a trusted guide who meets you where you are and walks you toward mastery with patience and clarity. Never rushed, never condescending. Celebrates incremental progress and systematic growth. Professional yet warm, structured yet human.',  
'Calm · Precise · Encouraging · Systematic · Mastery · Guided · Progressive',  
(SELECT id FROM brands WHERE slug = 'radiant-systems'),  
datetime('now'),  
datetime('now')  
);

-- ============================================  
-- COLORS  
-- ============================================

INSERT INTO brand_colors (brand_id, token_name, hex, rgb, cmyk, pantone, usage_notes, is_primary)  
VALUES  
-- Primary brand colors  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'brand.primary', '#1C2C4B', '28, 44, 75', '95, 82, 50, 45', '534 C', 'Deep Indigo — primary brand identity, headings, key emphasis, trust and depth', 1),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'brand.secondary', '#A78A55', '167, 138, 85', '30, 40, 75, 20', '4505 C', 'Warm Gold — achievement, value, highlights, progress indicators', 1),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'brand.neutralDark', '#4A4A4A', '74, 74, 74', '60, 52, 52, 45', 'Cool Gray 11 C', 'Stone Grey — body text, secondary headings, grounded elements', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'brand.neutralLight', '#F5F5F5', '245, 245, 245', '3, 2, 2, 0', 'Cool Gray 1 C', 'Soft Background — page base, card surfaces, breathing space', 0),

-- Additional neutrals    
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'neutral.white', '#FFFFFF', '255, 255, 255', '0, 0, 0, 0', 'White', 'Pure white — overlays, highest contrast', 0),    
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'neutral.mid', '#9E9E9E', '158, 158, 158', '40, 32, 32, 5', 'Cool Gray 6 C', 'Mid grey — borders, dividers, inactive states', 0),    
    
-- Semantic accent colors    
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'accent.success', '#88A57B', '136, 165, 123', '45, 20, 55, 5', '5635 C', 'Sage Green — success states, completion, mastery achieved', 0),    
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'accent.warning', '#E2B13C', '226, 177, 60', '10, 30, 85, 0', '7548 C', 'Amber — warnings, attention needed, caution', 0),    
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'accent.error', '#C5544D', '197, 84, 77', '20, 75, 70, 10', '7418 C', 'Terra Cotta — errors, critical alerts, needs correction', 0);

-- ============================================  
-- TYPOGRAPHY  
-- ============================================

INSERT INTO brand_typography (brand_id, token_name, font_family, font_weight, size_px, size_rem, line_height, letter_spacing, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'type.display', 'Noto Sans Display', 'SemiBold (600)', 40, 2.5, 1.2, '-0.01em', 'Hero text, landing pages, major impact'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'type.h1', 'Noto Sans Display', 'SemiBold (600)', 32, 2.0, 1.3, 'normal', 'Page titles, phase headers'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'type.h2', 'Noto Sans Display', 'SemiBold (600)', 28, 1.75, 1.35, 'normal', 'Section headers, major divisions'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'type.h3', 'Noto Sans Display', 'Medium (500)', 22, 1.375, 1.4, 'normal', 'Subsection headers, lesson titles'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'type.h4', 'Noto Sans Display', 'Medium (500)', 18, 1.125, 1.4, 'normal', 'Card titles, minor headings'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'type.body.large', 'Inter', 'Regular (400)', 18, 1.125, 1.7, 'normal', 'Lead paragraphs, introductions'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'type.body', 'Inter', 'Regular (400)', 16, 1.0, 1.6, 'normal', 'Standard content, instructions, descriptions'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'type.body.small', 'Inter', 'Regular (400)', 14, 0.875, 1.6, 'normal', 'Secondary information, metadata'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'type.caption', 'Inter', 'Regular (400)', 12, 0.75, 1.5, 'normal', 'Tiny labels, timestamps, footnotes'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'type.emphasis', 'Inter', 'Medium (500)', 16, 1.0, 1.6, 'normal', 'Emphasized body text, key concepts'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'type.button', 'Inter', 'Medium (500)', 16, 1.0, 1.0, '0.02em', 'Button labels, CTAs'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'type.label', 'Inter', 'Medium (500)', 14, 0.875, 1.5, '0.05em', 'Form labels, card categories, phase labels');

-- ============================================  
-- ICONS  
-- ============================================

-- Phase Icons (VSM Methodology)  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'phases', 'genesis', 'icons/phases/genesis.svg', '24x24', '2px', 'Genesis phase — seed sprouting', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'phases', 'source-code', 'icons/phases/source-code.svg', '24x24', '2px', 'Source Code phase — foundation blocks', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'phases', 'powerhouse', 'icons/phases/powerhouse.svg', '24x24', '2px', 'Powerhouse phase — energy core', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'phases', 'excellence', 'icons/phases/excellence.svg', '24x24', '2px', 'Excellence phase — refined gem', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'phases', 'mastery', 'icons/phases/mastery.svg', '24x24', '2px', 'Mastery phase — summit peak', 1);

-- Tool/Action Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'tools', 'practice', 'icons/tools/practice.svg', '24x24', '2px', 'Practice action — repetition symbol', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'tools', 'reflect', 'icons/tools/reflect.svg', '24x24', '2px', 'Reflect action — thought bubble', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'tools', 'progress', 'icons/tools/progress.svg', '24x24', '2px', 'Progress indicator — upward arrow', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'tools', 'complete', 'icons/tools/complete.svg', '24x24', '2px', 'Complete action — checkmark', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'tools', 'bookmark', 'icons/tools/bookmark.svg', '24x24', '2px', 'Bookmark — save for later', 0);

-- Navigation Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'nav', 'home', 'icons/nav/home.svg', '24x24', '2px', 'Home navigation — house outline', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'nav', 'lessons', 'icons/nav/lessons.svg', '24x24', '2px', 'Lessons navigation — stacked pages', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'nav', 'progress-chart', 'icons/nav/progress-chart.svg', '24x24', '2px', 'Progress navigation — ascending chart', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'nav', 'resources', 'icons/nav/resources.svg', '24x24', '2px', 'Resources navigation — toolbox', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'nav', 'profile', 'icons/nav/profile.svg', '24x24', '2px', 'Profile navigation — user circle', 0);

-- Status Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'status', 'in-progress', 'icons/status/in-progress.svg', '24x24', '2px', 'In progress — circular progress indicator', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'status', 'completed', 'icons/status/completed.svg', '24x24', '2px', 'Completed — filled circle with check', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'status', 'locked', 'icons/status/locked.svg', '24x24', '2px', 'Locked — padlock', 0),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'status', 'available', 'icons/status/available.svg', '24x24', '2px', 'Available — open door', 0);

-- ============================================  
-- ASSETS  
-- ============================================

-- Logos  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'logo', 'icon', 'VSM Peak Icon', 'logo/vsm-peak-icon.svg', 'svg', 'Stylized mountain peak forming V — primary brand mark'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'logo', 'lockup', 'VSM Peak Lockup', 'logo/vsm-peak-lockup.svg', 'svg', 'Peak icon + VSM School wordmark horizontal'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'logo', 'icon-light', 'VSM Peak Icon Light', 'logo/vsm-peak-icon-light.svg', 'svg', 'Light version for dark backgrounds'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'logo', 'lockup-light', 'VSM Peak Lockup Light', 'logo/vsm-peak-lockup-light.svg', 'svg', 'Light lockup for dark backgrounds');

-- Illustrations - Phase Markers  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'illustration', 'phase-marker', 'Mountain Base', 'illustrations/phases/mountain-base.svg', 'svg', 'Foundation phase elevation visual'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'illustration', 'phase-marker', 'Mountain Mid', 'illustrations/phases/mountain-mid.svg', 'svg', 'Mid-journey phase elevation visual'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'illustration', 'phase-marker', 'Mountain Summit', 'illustrations/phases/mountain-summit.svg', 'svg', 'Mastery phase summit visual');

-- Illustrations - Empty States  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'illustration', 'empty-state', 'Begin Journey', 'illustrations/empty-states/begin-journey.svg', 'svg', 'Empty state encouraging user to start learning'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'illustration', 'empty-state', 'No Lessons', 'illustrations/empty-states/no-lessons.svg', 'svg', 'Empty state when no lessons available');

-- Illustrations - Onboarding  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'illustration', 'onboarding', 'Path Upward', 'illustrations/onboarding/path-upward.svg', 'svg', 'Onboarding visual showing progressive journey'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'illustration', 'onboarding', 'First Steps', 'illustrations/onboarding/first-steps.svg', 'svg', 'Onboarding visual for beginning learners');

-- Textures  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'texture', 'ink-wash', 'Ink Wash 1', 'illustrations/textures/ink-wash-1.png', 'png', 'Subtle ink-wash texture overlay option 1'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'texture', 'ink-wash', 'Ink Wash 2', 'illustrations/textures/ink-wash-2.png', 'png', 'Subtle ink-wash texture overlay option 2'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'texture', 'atmospheric', 'Mist Overlay', 'illustrations/textures/mist-overlay.png', 'png', 'Atmospheric mist effect for layering');

-- ============================================  
-- GUIDELINES  
-- ============================================

INSERT INTO brand_guidelines (brand_id, section, content, display_order)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'color-usage',  
'Color Usage Guidelines:

PRIMARY PALETTE:  
- brand.primary (Deep Indigo #1C2C4B): Headings, key emphasis, trust and depth  
- brand.secondary (Warm Gold #A78A55): Achievement highlights, progress indicators, value moments  
- brand.neutralDark (Stone Grey #4A4A4A): Body text, secondary headings  
- brand.neutralLight (Soft Background #F5F5F5): Page base, card surfaces

COLOR PAIRING:  
- Primary emphasis: brand.primary on brand.neutralLight  
- Achievement/progress: brand.secondary accents on neutral backgrounds  
- Text hierarchy: brand.primary (headings) > brand.neutralDark (body) > neutral.mid (secondary)  
- Success moments: accent.success sparingly, only for genuine completion

SEMANTIC ACCENTS:  
- Success (Sage Green #88A57B): Completion, mastery achieved  
- Warning (Amber #E2B13C): Attention needed, caution  
- Error (Terra Cotta #C5544D): Needs correction, critical alerts

VSM School palette evokes elevation and calm mastery. Deep Indigo provides trustworthy depth. Warm Gold signals achievement. Natural, muted semantic tones fit the misty mountain aesthetic.', 1),

((SELECT id FROM brands WHERE slug = 'vsm-school'), 'typography-usage',    
'Typography Usage Guidelines:

FONT FAMILIES:  
- Headings: Noto Sans Display (humanist warmth, professional clarity)  
- Body: Inter (exceptional readability for educational content)

WEIGHT HIERARCHY:  
- SemiBold (600): Display, H1, H2 — major emphasis  
- Medium (500): H3, H4, buttons, labels — moderate emphasis  
- Regular (400): All body content

LINE HEIGHT:  
- Headings: 1.2-1.4 (tighter for visual rhythm)  
- Body text: 1.6-1.7 (generous for focused reading and learning)  
- Captions: 1.5 minimum

LETTER-SPACING:  
- Display: -0.01em (subtle tightening for optical balance)  
- Labels: +0.05em (looser for improved legibility at small sizes)  
- Buttons: +0.02em (slightly looser for readability)  
- All others: normal

FALLBACK STACKS:  
- Noto Sans Display: "Noto Sans Display", "Source Sans Pro", "Open Sans", sans-serif  
- Inter: "Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif

Generous line heights support focused reading. Typography creates calm, approachable learning environment.', 2),

((SELECT id FROM brands WHERE slug = 'vsm-school'), 'spacing-system',    
'Spacing System Guidelines:

BASE UNIT: 4px  
All spacing is multiples of 4 for consistency.

SPACING SCALE:  
- xs: 4px — Tiny gaps  
- sm: 8px — Small spacing between related elements  
- md: 16px — Standard gaps, content spacing  
- lg: 24px — Section spacing, generous breathing room  
- xl: 32px — Major divisions  
- xxl: 48px — Hero spacing

CONTENT SPACING:  
- 16px between related elements  
- 24px between sections  
- 32px for major divisions

CARD PADDING:  
- 24px for generous breathing room in learning content  
- Supports focused reading without cramped feeling

CONTAINER PADDING:  
- Mobile: 16px  
- Tablet: 24px  
- Desktop: 32px

The 4px base unit allows for precise control while maintaining rhythm and breathing space essential for educational content.', 3),

((SELECT id FROM brands WHERE slug = 'vsm-school'), 'imagery-photography',    
'Imagery and Photography Guidelines:

STYLE:  
Atmospheric and contemplative. Combines misty mountain photography with subtle ink-wash textures. Minimal detail, maximum mood. Focus on elevation, journey, and calm progress.

PHOTOGRAPHY DIRECTION:  
- Misty/foggy mountain landscapes  
- Soft, diffused lighting  
- Horizontal orientation preferred  
- Rule of thirds composition  
- Negative space for text overlays  
- Muted, natural color palette  
- Desaturate to match brand palette  
- Overlay with brand.primary at 5-10% opacity

MOOD:  
Calm, elevated, patient — never rushed or dramatic. Think: Japanese ink paintings meet Scandinavian minimalism.

DO''S:  
✓ Misty atmospheres  
✓ Layered mountain silhouettes  
✓ Soft lighting  
✓ Muted colors  
✓ Contemplative, patient mood  
✓ Horizontal compositions  
✓ Generous negative space

DON''TS:  
✗ Sharp, dramatic peaks  
✗ Harsh lighting or high contrast  
✗ Saturated colors  
✗ Busy, cluttered compositions  
✗ Action shots or high energy  
✗ Human elements at large scale (if included, keep small against landscape)

VISUAL REFERENCE:  
Traditional sumi-e (ink wash painting), minimalist mountain photography, topographic maps with subtle elevation markers.', 4),

((SELECT id FROM brands WHERE slug = 'vsm-school'), 'illustration-style',    
'Illustration Style Guidelines:

VISUAL APPROACH:  
Atmospheric illustrations combining layered mountain silhouettes with ink-wash textures. Minimal detail, maximum mood and meaning.

PALETTE:  
- Primarily brand.neutralLight backgrounds  
- brand.primary (Deep Indigo) and brand.secondary (Warm Gold) accents  
- Subtle gradients allowed for atmospheric effects (rare exception)

VISUAL ELEMENTS:  
- Layered mountain silhouettes (depth through transparency)  
- Ink-wash textures (organic, hand-crafted feel)  
- Subtle mist/fog effects (elevation and clarity through clouds)  
- Minimal line work — prefer filled shapes with soft edges

USE CASES:  
- Phase markers: Each phase represented by mountain elevation level  
- Empty states: Calm mountain vista with encouraging messaging  
- Onboarding: Progressive journey up mountain path  
- Achievement badges: Peak icons with gold accents  
- Background textures: Subtle ink-wash overlays on cards

COMPOSITION:  
- Grid-aligned but organic  
- 2-4 layers maximum  
- Breathing space essential  
- Focus on journey metaphor

Illustrations inspire calm focus and patient progression toward mastery.', 5),

((SELECT id FROM brands WHERE slug = 'vsm-school'), 'logo-usage',    
'Logo Usage Guidelines:

LOGO VARIANTS:  
- Primary lockup: VSM Peak icon + "VSM School" wordmark (horizontal)  
- Icon-only: Peak symbol alone for app icons, favicons, achievement badges  
- Light versions: Available for dark backgrounds

MINIMUM SIZES:  
- Lockup: 140px width minimum  
- Icon: 32px minimum

CLEAR SPACE:  
Maintain padding equal to height of peak on all sides of logo.

APPROVED BACKGROUNDS:  
- brand.neutralLight (primary)  
- White  
- Dark overlays (use light/inverted versions)  
- Clean photography with sufficient contrast

SPECIAL GLYPH:  
VSM Peak — Stylized mountain peak forming "V" shape. Primary brand mark used on:  
- Logo lockup  
- App icon  
- Achievement badges  
- Phase completion markers  
- Favicon

PROHIBITED USES:  
✗ Don''t stretch or distort the peak shape  
✗ Don''t rotate (mountain must be upright — symbolic of ascent)  
✗ Don''t apply effects or filters  
✗ Don''t use colors outside approved palette  
✗ Don''t place on busy backgrounds without sufficient contrast  
✗ Don''t crowd with other elements inside clear space  
✗ Don''t modify or recreate peak geometry

The peak symbol represents the journey to mastery — treat it with respect for the metaphor.', 6);

-- ============================================  
-- SPACING TOKENS  
-- ============================================

INSERT INTO brand_spacing (brand_id, token_name, value, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'base-unit', '4px', 'Foundation of all spacing — all values are multiples'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'space-xs', '4px', 'Tiny gaps'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'space-sm', '8px', 'Small spacing between related elements'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'space-md', '16px', 'Standard gaps, content spacing'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'space-lg', '24px', 'Section spacing, generous breathing room'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'space-xl', '32px', 'Major divisions'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'space-xxl', '48px', 'Hero spacing, maximum breathing room'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'card-padding', '24px', 'Generous padding for learning content cards'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'container-mobile', '16px', 'Container padding on mobile devices'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'container-tablet', '24px', 'Container padding on tablets'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'container-desktop', '32px', 'Container padding on desktop'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'radius-sm', '4px', 'Small elements: buttons, tags, badges'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'radius-md', '8px', 'Standard UI: cards, inputs'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'radius-lg', '16px', 'Large containers: modals, panels, feature cards'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'radius-icon', '2px', 'Icon internal corners');

-- ============================================  
-- SHADOW TOKENS  
-- ============================================

INSERT INTO brand_shadows (brand_id, token_name, css_value, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'elevation-subtle', '0 2px 8px rgba(28, 44, 75, 0.08)', 'Subtle elevation for cards, gentle lift'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'elevation-medium', '0 4px 12px rgba(28, 44, 75, 0.12)', 'Medium elevation for hover states, dropdowns'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'elevation-prominent', '0 8px 24px rgba(28, 44, 75, 0.16)', 'Prominent elevation for modals, important panels'),  
((SELECT id FROM brands WHERE slug = 'vsm-school'), 'focus-ring', '0 0 0 3px rgba(167, 138, 85, 0.4)', 'Keyboard focus ring — Warm Gold for encouraging feel');

-- ============================================  
-- VERIFICATION QUERIES  
-- ============================================

-- Verify brand was created  
SELECT 'Brand Created:' as status, name, slug, tagline FROM brands WHERE slug = 'vsm-school';

-- Count all elements  
SELECT  
'Element Counts:' as status,  
(SELECT COUNT(*) FROM brand_colors WHERE brand_id = (SELECT id FROM brands WHERE slug = 'vsm-school')) as colors,  
(SELECT COUNT(*) FROM brand_typography WHERE brand_id = (SELECT id FROM brands WHERE slug = 'vsm-school')) as typography,  
(SELECT COUNT(*) FROM brand_icons WHERE brand_id = (SELECT id FROM brands WHERE slug = 'vsm-school')) as icons,  
(SELECT COUNT(*) FROM brand_assets WHERE brand_id = (SELECT id FROM brands WHERE slug = 'vsm-school')) as assets,  
(SELECT COUNT(*) FROM brand_guidelines WHERE brand_id = (SELECT id FROM brands WHERE slug = 'vsm-school')) as guidelines,  
(SELECT COUNT(*) FROM brand_spacing WHERE brand_id = (SELECT id FROM brands WHERE slug = 'vsm-school')) as spacing_tokens,  
(SELECT COUNT(*) FROM brand_shadows WHERE brand_id = (SELECT id FROM brands WHERE slug = 'vsm-school')) as shadow_tokens;

-- View brand color palette  
SELECT 'Color Palette:' as section, token_name, hex, usage_notes  
FROM brand_colors  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'vsm-school')  
ORDER BY is_primary DESC, token_name;

-- View phase icons  
SELECT 'Phase Icons:' as section, name, description  
FROM brand_icons  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'vsm-school')  
AND category = 'phases'  
ORDER BY name;

-- View typography scale  
SELECT 'Typography Scale:' as section, token_name, font_family, size_px, usage_notes  
FROM brand_typography  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'vsm-school')  
ORDER BY size_px DESC;