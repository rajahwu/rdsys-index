-- ============================================  
-- CONTENT FACTOR BRAND KIT - DATABASE POPULATION  
-- ============================================

-- Insert Content Factor as child of Radiant Systems  
INSERT INTO brands (name, slug, tagline, tone, keywords, created_at, updated_at)  
VALUES (  
'Content Factor',  
'content-factor',  
'Live, Interactive, Always in Sync',  
'Systematic, efficient, developer-friendly — built for creators who value process over chaos. Speaks with clarity and confidence about turning raw content into published assets. Celebrates proof-of-work and visible progress. No fluff, just function. Professional but energetic, structured yet dynamic.',  
'Pipeline · Systematic · Modular · Proof-of-Work · Efficient · Developer-Centric',  
NOW(),  
NOW()  
);

-- ============================================  
-- COLORS  
-- ============================================

INSERT INTO brand_colors (brand_id, token_name, hex, rgb, cmyk, pantone, usage_notes, is_primary)  
VALUES  
-- Pipeline stage colors (primary brand colors)  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'pipeline.build', '#F97316', '249, 115, 22', '0, 54, 91, 0', '1655 C', 'Build stage — orange, foundation work, initial creation',  TRUE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'pipeline.capture', '#06B6D4', '6, 182, 212', '75, 10, 15, 0', '311 C', 'Capture stage — cyan, collecting and gathering content',  TRUE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'pipeline.transform', '#84CC16', '132, 204, 22', '50, 0, 95, 0', '375 C', 'Transform stage — lime, processing and refining',  TRUE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'pipeline.publish', '#2563EB', '37, 99, 235', '85, 58, 0, 0', '2727 C', 'Publish stage — blue, deployment and distribution',  TRUE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'pipeline.measure', '#DB2777', '219, 39, 119', '10, 85, 20, 0', '213 C', 'Measure stage — pink, analytics and feedback',  TRUE),

-- Neutral colors    
((SELECT id FROM brands WHERE slug = 'content-factor'), 'neutral.background', '#F9FAFB', '249, 250, 251', '2, 1, 1, 0', 'Cool Gray 1 C', 'Page base, light backgrounds',  FALSE),    
((SELECT id FROM brands WHERE slug = 'content-factor'), 'neutral.surface', '#FFFFFF', '255, 255, 255', '0, 0, 0, 0', 'White', 'Cards, panels, white surfaces',  FALSE),    
((SELECT id FROM brands WHERE slug = 'content-factor'), 'neutral.border', '#E5E7EB', '229, 231, 235', '8, 5, 4, 0', 'Cool Gray 2 C', 'Borders, dividers, separators',  FALSE),    
    
-- Text colors    
((SELECT id FROM brands WHERE slug = 'content-factor'), 'text.primary', '#111827', '17, 24, 39', '85, 70, 55, 65', 'Black 6 C', 'Headings, primary content, high emphasis',  FALSE),    
((SELECT id FROM brands WHERE slug = 'content-factor'), 'text.secondary', '#4B5563', '75, 85, 99', '55, 45, 35, 20', 'Cool Gray 11 C', 'Secondary text, muted content',  FALSE);

-- ============================================  
-- TYPOGRAPHY  
-- ============================================

INSERT INTO brand_typography (brand_id, token_name, font_family, font_weight, size_px, size_rem, line_height, letter_spacing, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'type.display', 'Space Grotesk', 'Bold (700)', 36, 2.25, 1.2, '-0.01em', 'Hero headlines, major impact'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'type.h1', 'Space Grotesk', 'Bold (700)', 30, 1.875, 1.25, '-0.01em', 'Page titles, section headers'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'type.h2', 'Space Grotesk', 'SemiBold (600)', 24, 1.5, 1.3, 'normal', 'Subsection headers'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'type.h3', 'Space Grotesk', 'SemiBold (600)', 20, 1.25, 1.4, 'normal', 'Card titles, component headers'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'type.h4', 'Space Grotesk', 'Medium (500)', 18, 1.125, 1.4, 'normal', 'Minor headings'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'type.body.large', 'Inter', 'Regular (400)', 18, 1.125, 1.75, 'normal', 'Lead paragraphs'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'type.body', 'Inter', 'Regular (400)', 16, 1.0, 1.5, 'normal', 'Standard content, UI labels'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'type.body.small', 'Inter', 'Regular (400)', 14, 0.875, 1.5, 'normal', 'Secondary information'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'type.caption', 'Inter', 'Regular (400)', 12, 0.75, 1.5, 'normal', 'Tiny labels, timestamps'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'type.mono', 'JetBrains Mono', 'Regular (400)', 14, 0.875, 1.6, 'normal', 'Code, logs, technical data'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'type.button', 'Inter', 'Medium (500)', 16, 1.0, 1.0, '0.02em', 'Button labels, CTAs');

-- ============================================  
-- ICONS  
-- ============================================

-- Pipeline Stage Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'pipeline', 'build', 'icons/pipeline/build.svg', '24x24', '2px', 'Build stage — hammer/construction',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'pipeline', 'capture', 'icons/pipeline/capture.svg', '24x24', '2px', 'Capture stage — inbox/collection',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'pipeline', 'transform', 'icons/pipeline/transform.svg', '24x24', '2px', 'Transform stage — gears/processing',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'pipeline', 'publish', 'icons/pipeline/publish.svg', '24x24', '2px', 'Publish stage — rocket/deploy',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'pipeline', 'measure', 'icons/pipeline/measure.svg', '24x24', '2px', 'Measure stage — chart/analytics',  FALSE);

-- Action Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'actions', 'play', 'icons/actions/play.svg', '24x24', '2px', 'Start pipeline',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'actions', 'pause', 'icons/actions/pause.svg', '24x24', '2px', 'Halt process',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'actions', 'refresh', 'icons/actions/refresh.svg', '24x24', '2px', 'Restart pipeline',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'actions', 'download', 'icons/actions/download.svg', '24x24', '2px', 'Export content',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'actions', 'upload', 'icons/actions/upload.svg', '24x24', '2px', 'Import content',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'actions', 'copy', 'icons/actions/copy.svg', '24x24', '2px', 'Duplicate content',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'actions', 'delete', 'icons/actions/delete.svg', '24x24', '2px', 'Remove content',  FALSE);

-- Navigation Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'nav', 'dashboard', 'icons/nav/dashboard.svg', '24x24', '2px', 'Dashboard view — grid layout',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'nav', 'pipeline', 'icons/nav/pipeline.svg', '24x24', '2px', 'Pipeline view — flow diagram',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'nav', 'content', 'icons/nav/content.svg', '24x24', '2px', 'Content library — document stack',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'nav', 'settings', 'icons/nav/settings.svg', '24x24', '2px', 'Settings — gear icon',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'nav', 'logs', 'icons/nav/logs.svg', '24x24', '2px', 'Logs — terminal icon',  FALSE);

-- Status Icons  
INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'status', 'success', 'icons/status/success.svg', '24x24', '2px', 'Success — checkmark circle',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'status', 'warning', 'icons/status/warning.svg', '24x24', '2px', 'Warning — alert triangle',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'status', 'error', 'icons/status/error.svg', '24x24', '2px', 'Error — X circle',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'status', 'in-progress', 'icons/status/in-progress.svg', '24x24', '2px', 'In progress — spinning loader',  FALSE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'status', 'queued', 'icons/status/queued.svg', '24x24', '2px', 'Queued — clock icon',  FALSE);

-- ============================================  
-- ASSETS  
-- ============================================

-- Logos  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'logo', 'lockup', 'Factor X Lockup', 'logo/factor-x-lockup.svg', 'svg', 'X mark + CONTENT FACTOR wordmark horizontal'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'logo', 'lockup-dark', 'Factor X Lockup Dark', 'logo/factor-x-lockup-dark.svg', 'svg', 'Light version for dark backgrounds'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'logo', 'icon', 'Factor X Icon', 'logo/factor-x-icon.svg', 'svg', 'X mark in circle — primary brand mark',  TRUE),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'logo', 'icon-dark', 'Factor X Icon Dark', 'logo/factor-x-icon-dark.svg', 'svg', 'Light icon for dark backgrounds');

-- Illustrations - Diagrams  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'illustration', 'diagram', 'Pipeline Flow', 'illustrations/diagrams/pipeline-flow.svg', 'svg', 'Flow diagram showing all five pipeline stages'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'illustration', 'diagram', 'Dashboard Layout', 'illustrations/diagrams/dashboard-layout.svg', 'svg', 'Modular dashboard UI layout'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'illustration', 'diagram', 'Content Stages', 'illustrations/diagrams/content-stages.svg', 'svg', 'Visual explanation of content moving through stages');

-- Illustrations - Empty States  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'illustration', 'empty-state', 'No Content', 'illustrations/empty-states/no-content.svg', 'svg', 'Empty state when no content exists'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'illustration', 'empty-state', 'Start Pipeline', 'illustrations/empty-states/start-pipeline.svg', 'svg', 'Encouraging empty state to begin pipeline');

-- Illustrations - Onboarding  
INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'illustration', 'onboarding', 'Pipeline Intro', 'illustrations/onboarding/pipeline-intro.svg', 'svg', 'Onboarding visual introducing pipeline concept'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'illustration', 'onboarding', 'Stage Explanation', 'illustrations/onboarding/stage-explanation.svg', 'svg', 'Onboarding visual explaining each stage');

-- ============================================  
-- GUIDELINES  
-- ============================================

INSERT INTO brand_guidelines (brand_id, section, content, display_order)  
VALUES  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'color-usage',  
'Color Usage Guidelines:

PIPELINE STAGE COLORS (PRIMARY PALETTE):  
These five colors define Content Factor''s identity and map directly to pipeline stages:

- Build (#F97316, Orange): Foundation work, initial creation  
- Capture (#06B6D4, Cyan): Collecting and gathering content  
- Transform (#84CC16, Lime): Processing and refining  
- Publish (#2563EB, Blue): Deployment and distribution  
- Measure (#DB2777, Pink): Analytics and feedback

USAGE RULES:  
- Pipeline visualization: Use all five colors in sequence  
- UI elements: Neutral backgrounds with pipeline color accents  
- Active states: Match the relevant pipeline stage color  
- Progress indicators: Color-coded by current stage  
- Never use pipeline colors decoratively — they always map to stages

NEUTRAL PALETTE:  
- background (#F9FAFB): Page base, light backgrounds  
- surface (#FFFFFF): Cards, panels, white surfaces  
- border (#E5E7EB): Borders, dividers, separators

TEXT:  
- primary (#111827): Headings, high emphasis  
- secondary (#4B5563): Body text, muted content

Each stage color is vibrant and distinct, making progress immediately visible.',  TRUE),

((SELECT id FROM brands WHERE slug = 'content-factor'), 'typography-usage',    
'Typography Usage Guidelines:

FONT FAMILIES:  
- Headings: Space Grotesk (geometric precision with personality)  
- Body: Inter (clarity for UI and content)  
- Mono: JetBrains Mono (code, logs, technical displays)

WEIGHT HIERARCHY:  
- Bold (700): Display, H1 — major impact  
- SemiBold (600): H2, H3 — section headers  
- Medium (500): H4, buttons — moderate emphasis  
- Regular (400): Body text, all content

LETTER-SPACING:  
- Display/H1: -0.01em (slightly tighter for optical balance)  
- Buttons: +0.02em (slightly looser for readability)  
- All others: normal

LINE HEIGHT:  
- Headings: 1.2-1.4 (tighter for visual rhythm)  
- Body: 1.5 (standard readability)  
- Body Large: 1.75 (generous for lead paragraphs)  
- Mono: 1.6 (comfortable for code reading)

FALLBACK STACKS:  
- Space Grotesk: "Space Grotesk", "Archivo", "Work Sans", sans-serif  
- Inter: "Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif  
- JetBrains Mono: "JetBrains Mono", "Fira Code", "SF Mono", Consolas, monospace

Typography balances systematic clarity (Inter) with geometric personality (Space Grotesk) and developer credibility (JetBrains Mono).', 2),

((SELECT id FROM brands WHERE slug = 'content-factor'), 'spacing-system',    
'Spacing System Guidelines:

BASE UNIT: 4px (0.25rem)  
All spacing is multiples of 4 for consistency.

SPACING SCALE:  
- xs: 4px (0.25rem) — Tiny gaps  
- sm: 8px (0.5rem) — Small spacing  
- md: 16px (1rem) — Standard gaps  
- lg: 24px (1.5rem) — Section spacing  
- xl: 32px (2rem) — Major divisions  
- 2xl: 48px (3rem) — Large sections  
- 3xl: 64px (4rem) — Hero spacing

UI SPACING:  
- 8px between related elements  
- 16px between element groups  
- 24px between major sections

CARD PADDING:  
- Compact: 16px  
- Standard: 24px  
- Spacious: 32px

CONTAINER PADDING:  
- Mobile: 16px  
- Tablet: 24px  
- Desktop: 32px

The 4px base unit provides precise control while maintaining rhythm essential for modular dashboards and systematic layouts.', 3),

((SELECT id FROM brands WHERE slug = 'content-factor'), 'iconography-rules',    
'Iconography Guidelines:

STYLE:  
Clean, geometric icons with 2px stroke weight. Modern and systematic. Mix of outlined and filled styles depending on emphasis level.

STROKE: 2px consistent across all outlined icons  
CORNER RADIUS: 2px on internal corners, rounded stroke caps  
SIZES: 16×16px (inline), 20×20px (compact), 24×24px (standard), 32×32px (features)

ICON GRID:  
- Base canvas: 24×24px  
- Live area: 20×20px (2px padding)  
- Align to 2px grid for pixel-perfect rendering

COLOR USAGE:  
- Default: text.secondary (#4B5563)  
- Active: Matches pipeline stage context  
- Disabled: neutral.border (#E5E7EB)  
- Pipeline icons: Always use stage-specific colors

SPECIAL GLYPH:  
Factor X Mark — Stylized X in circle representing exponential content growth. Primary brand mark used in logo, app icon, loading states.

CATEGORIES:  
- Pipeline: One icon per stage (build, capture, transform, publish, measure)  
- Actions: Play, pause, refresh, download, upload, copy, delete  
- Navigation: Dashboard, pipeline, content, settings, logs  
- Status: Success, warning, error, in-progress, queued

Icons prioritize immediate recognition and systematic clarity.', 4),

((SELECT id FROM brands WHERE slug = 'content-factor'), 'illustration-diagrams',    
'Illustration and Diagram Guidelines:

STYLE:  
Clean, diagrammatic, dashboard-focused. Emphasizes flow, progress, and systematic organization. Technical but not sterile — modern and approachable.

VISUAL ELEMENTS:  
- Flow diagrams showing pipeline progression  
- Dashboard panels with metrics and progress bars  
- Modular grid layouts  
- Clean wireframe cards  
- Code snippets with syntax highlighting  
- Progress indicators and stage markers

PALETTE:  
- Neutral backgrounds (neutral.background, neutral.surface)  
- Vibrant pipeline color accents  
- Each stage clearly color-coded  
- Never mix stage colors within single stage representation

COMPOSITION RULES:  
- Use strict grid alignment  
- Color-code by pipeline stage consistently  
- Maintain breathing space (minimum 16px padding)  
- Limit visual complexity — clarity over decoration  
- Show progression left-to-right or top-to-bottom

USE CASES:  
- Pipeline visualization: Flow diagrams showing all five stages  
- Dashboard panels: Modular UI showing active content in each stage  
- Empty states: Clean grid with "start your pipeline" messaging  
- Onboarding: Step-by-step pipeline explanation  
- Documentation: Wireframe diagrams showing content flow

MOOD:  
Modern dev tools, Notion-style clarity, systematic dashboards. Think: Linear, Stripe dashboard, Tailwind docs, GitHub project boards.

Illustrations clarify process and celebrate visible progress.', 5),

((SELECT id FROM brands WHERE slug = 'content-factor'), 'logo-usage',    
'Logo Usage Guidelines:

LOGO VARIANTS:  
- Primary lockup: Factor X mark + "CONTENT FACTOR" wordmark (horizontal)  
- Icon-only: X mark in circle for app icons, favicons, loading states  
- Dark versions: Available for dark backgrounds

MINIMUM SIZES:  
- Lockup: 140px width minimum  
- Icon: 32px minimum

CLEAR SPACE:  
Maintain padding equal to height of X mark on all sides of logo.

APPROVED BACKGROUNDS:  
- neutral.background (#F9FAFB)  
- White  
- Dark surfaces (use light versions)  
- Clean, uncluttered surfaces only

SPECIAL GLYPH:  
Factor X Mark — Stylized X in circle represents:  
- Multiplication factor (exponential growth)  
- Pipeline intersection points  
- Content multiplication through systematic process

Appears on:  
- Logo lockup  
- App icon  
- Loading states  
- Pipeline completion markers  
- Favicon

PROHIBITED USES:  
✗ Don''t stretch or distort the X geometry  
✗ Don''t rotate or tilt  
✗ Don''t apply gradients or effects (logo is already clean and geometric)  
✗ Don''t use colors outside pipeline palette for X mark  
✗ Don''t place on busy backgrounds without sufficient contrast  
✗ Don''t crowd with other elements inside clear space  
✗ Don''t recreate or modify X geometry

The X mark symbolizes systematic multiplication of content value — treat it as functional icon, not decoration.', 6);

-- ============================================  
-- SPACING TOKENS  
-- ============================================

INSERT INTO brand_spacing (brand_id, token_name, value, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'base-unit', '4px', 'Foundation of all spacing — all values are multiples'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'space-xs', '4px', 'Tiny gaps — 0.25rem'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'space-sm', '8px', 'Small spacing — 0.5rem'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'space-md', '16px', 'Standard gaps — 1rem'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'space-lg', '24px', 'Section spacing — 1.5rem'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'space-xl', '32px', 'Major divisions — 2rem'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'space-2xl', '48px', 'Large sections — 3rem'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'space-3xl', '64px', 'Hero spacing — 4rem'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'card-padding-compact', '16px', 'Compact card internal padding'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'card-padding-standard', '24px', 'Standard card internal padding'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'card-padding-spacious', '32px', 'Spacious card internal padding'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'container-mobile', '16px', 'Container padding on mobile devices'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'container-tablet', '24px', 'Container padding on tablets'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'container-desktop', '32px', 'Container padding on desktop'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'radius-sm', '4px', 'Small elements: buttons, badges, tags'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'radius-md', '8px', 'Standard UI: cards, inputs'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'radius-lg', '16px', 'Large containers: modals, panels'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'radius-full', '9999px', 'Circular elements, pills'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'border-thin', '1px', 'Standard borders, dividers'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'border-thick', '2px', 'Emphasis borders, active states');

-- ============================================  
-- SHADOW TOKENS  
-- ============================================

INSERT INTO brand_shadows (brand_id, token_name, css_value, usage_notes)  
VALUES  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'elevation-sm', '0 1px 2px rgba(0, 0, 0, 0.05)', 'Subtle elevation for cards'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'elevation-md', '0 4px 6px rgba(0, 0, 0, 0.1)', 'Standard elevation for hover states, dropdowns'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'elevation-lg', '0 10px 15px rgba(0, 0, 0, 0.15)', 'Prominent elevation for modals, important panels'),  
((SELECT id FROM brands WHERE slug = 'content-factor'), 'elevation-xl', '0 20px 25px rgba(0, 0, 0, 0.2)', 'Extra prominent elevation for major overlays, tooltips');

-- ============================================  
-- VERIFICATION QUERIES  
-- ============================================

-- Verify brand was created  
SELECT 'Brand Created:' as status, name, slug, tagline FROM brands WHERE slug = 'content-factor';

-- Count all elements  
SELECT  
'Element Counts:' as status,  
(SELECT COUNT(*) FROM brand_colors WHERE brand_id = (SELECT id FROM brands WHERE slug = 'content-factor')) as colors,  
(SELECT COUNT(*) FROM brand_typography WHERE brand_id = (SELECT id FROM brands WHERE slug = 'content-factor')) as typography,  
(SELECT COUNT(*) FROM brand_icons WHERE brand_id = (SELECT id FROM brands WHERE slug = 'content-factor')) as icons,  
(SELECT COUNT(*) FROM brand_assets WHERE brand_id = (SELECT id FROM brands WHERE slug = 'content-factor')) as assets,  
(SELECT COUNT(*) FROM brand_guidelines WHERE brand_id = (SELECT id FROM brands WHERE slug = 'content-factor')) as guidelines,  
(SELECT COUNT(*) FROM brand_spacing WHERE brand_id = (SELECT id FROM brands WHERE slug = 'content-factor')) as spacing_tokens,  
(SELECT COUNT(*) FROM brand_shadows WHERE brand_id = (SELECT id FROM brands WHERE slug = 'content-factor')) as shadow_tokens;

-- View pipeline stage colors  
SELECT 'Pipeline Colors:' as section, token_name, hex, usage_notes  
FROM brand_colors  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'content-factor')  
AND token_name LIKE 'pipeline.%'  
ORDER BY  
CASE token_name  
WHEN 'pipeline.build' THEN 1  
WHEN 'pipeline.capture' THEN 2  
WHEN 'pipeline.transform' THEN 3  
WHEN 'pipeline.publish' THEN 4  
WHEN 'pipeline.measure' THEN 5  
END;

-- View icon categories  
SELECT 'Icon Categories:' as section, category, COUNT(*) as count  
FROM brand_icons  
WHERE brand_id = (SELECT id FROM brands WHERE slug = 'content-factor')  
GROUP BY category  
ORDER BY category;
