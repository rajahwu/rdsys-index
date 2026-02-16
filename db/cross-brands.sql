-- Step 1: Create normalized tables (if not exist)
CREATE TABLE IF NOT EXISTS brands (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    tagline TEXT
);

CREATE TABLE IF NOT EXISTS color_palettes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand_slug TEXT NOT NULL,
    color_key TEXT,
    hex TEXT,
    description TEXT,
    FOREIGN KEY (brand_slug) REFERENCES brands(slug)
);

CREATE TABLE IF NOT EXISTS typography_scales (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand_slug TEXT NOT NULL,
    type_key TEXT,
    font TEXT,
    size REAL,
    description TEXT,
    FOREIGN KEY (brand_slug) REFERENCES brands(slug)
);

-- Step 2: Insert all brand data (parsed from your outputs)
INSERT OR IGNORE INTO brands (name, slug, tagline) VALUES
    ('Content Factor', 'content-factor', 'Live, Interactive, Always in Sync'),
    ('Dropframe', 'dropframe', 'Build Your Brand in Motion'),
    ('Grindline Studio', 'grindline-studio', 'Where Hustle Meets Flow'),
    ('Style System', 'style-system', 'Live, Interactive, Always in Sync'),
    ('VSM School', 'vsm-school', 'From foundation to mastery, one phase at a time'),
    ('Radiant Systems', 'radiant-systems', NULL);  -- Add tagline if available

-- Content Factor colors (pipeline only, no typo in output)
INSERT INTO color_palettes (brand_slug, color_key, hex, description) VALUES
    ('content-factor', 'pipeline.build', '#F97316', 'Build stage — orange, foundation work, initial creation'),
    ('content-factor', 'pipeline.capture', '#06B6D4', 'Capture stage — cyan, collecting and gathering content'),
    ('content-factor', 'pipeline.transform', '#84CC16', 'Transform stage — lime, processing and refining'),
    ('content-factor', 'pipeline.publish', '#2563EB', 'Publish stage — blue, deployment and distribution'),
    ('content-factor', 'pipeline.measure', '#DB2777', 'Measure stage — pink, analytics and feedback');

-- Dropframe
INSERT INTO color_palettes (brand_slug, color_key, hex, description) VALUES
    ('dropframe', 'dropframe.red', '#C41230', 'Colonial Red — calls to action, focus, urgency'),
    ('dropframe', 'dropframe.teal', '#006E6D', 'Cobbs Creek Teal — primary brand accent, calm energy, digital modernity'),
    ('dropframe', 'neutral.dark', '#212121', 'Primary text, high emphasis'),
    ('dropframe', 'neutral.light', '#F5F5F5', 'Background surfaces, light base'),
    ('dropframe', 'neutral.white', '#FFFFFF', 'Pure white — cards, overlays'),
    ('dropframe', 'tier.gold', '#FFC857', 'Tier 1 accent — Warm Gold, achievement highlights'),
    ('dropframe', 'tier.lavender', '#B497BD', 'Tier 2 accent — West Philly Lavender, trust, polish'),
    ('dropframe', 'tier.slate', '#4B4B4B', 'Tier 3 accent — Slate Gray, secondary depth');

INSERT INTO typography_scales (brand_slug, type_key, font, size, description) VALUES
    ('dropframe', 'type.display', 'Inter', 40.0, 'Hero headlines, major impact'),
    ('dropframe', 'type.h1', 'Inter', 32.0, 'Page titles, section headers'),
    ('dropframe', 'type.h2', 'Inter', 24.0, 'Subsection headers'),
    ('dropframe', 'type.h3', 'Inter', 20.0, 'Card titles, component headers'),
    ('dropframe', 'type.h4', 'Inter', 18.0, 'Minor headings'),
    ('dropframe', 'type.body.large', 'Libre Franklin', 18.0, 'Lead paragraphs, introductions'),
    ('dropframe', 'type.body', 'Libre Franklin', 16.0, 'Standard content, descriptions'),
    ('dropframe', 'type.button.large', 'Inter', 16.0, 'Primary CTAs — uppercase'),
    ('dropframe', 'type.body.small', 'Libre Franklin', 14.0, 'Secondary information, metadata'),
    ('dropframe', 'type.button', 'Inter', 14.0, 'Standard buttons — uppercase'),
    ('dropframe', 'type.caption', 'Libre Franklin', 12.0, 'Tiny labels, timestamps, footnotes');

-- Grindline Studio
INSERT INTO color_palettes (brand_slug, color_key, hex, description) VALUES
    ('grindline-studio', 'grindline.coral', '#FF5A5F', 'Burnt Coral — passion, urgency, call to action'),
    ('grindline-studio', 'grindline.dark', '#2E2E2E', 'Asphalt Gray — base dark, urban grounding, night grind'),
    ('grindline-studio', 'grindline.gold', '#FFC857', 'Warm Gold — achievement, spotlight, success moments'),
    ('grindline-studio', 'grindline.teal', '#00A6A6', 'Electric Teal — energy, modernity, movement, primary accent'),
    ('grindline-studio', 'neutral.light', '#F3F3F3', 'Light backgrounds, clean surfaces'),
    ('grindline-studio', 'neutral.mid', '#6B7280', 'Secondary text, muted content'),
    ('grindline-studio', 'neutral.white', '#FFFFFF', 'Pure white — overlays, high contrast');

INSERT INTO typography_scales (brand_slug, type_key, font, size, description) VALUES
    ('grindline-studio', 'type.display', 'Oswald', 48.0, 'Hero headlines, major impact, street presence'),
    ('grindline-studio', 'type.h1', 'Oswald', 36.0, 'Page titles, section headers'),
    ('grindline-studio', 'type.h2', 'Oswald', 28.0, 'Subsection headers'),
    ('grindline-studio', 'type.h3', 'Oswald', 22.0, 'Card titles, feature headers'),
    ('grindline-studio', 'type.h4', 'Oswald', 18.0, 'Minor headings'),
    ('grindline-studio', 'type.body.large', 'Libre Franklin', 18.0, 'Lead paragraphs, introductions'),
    ('grindline-studio', 'type.body', 'Libre Franklin', 16.0, 'Standard content, descriptions'),
    ('grindline-studio', 'type.button.large', 'Oswald', 16.0, 'Large CTAs — uppercase'),
    ('grindline-studio', 'type.body.small', 'Libre Franklin', 14.0, 'Secondary information, metadata'),
    ('grindline-studio', 'type.button', 'Oswald', 14.0, 'Standard buttons — uppercase'),
    ('grindline-studio', 'type.caption', 'Libre Franklin', 12.0, 'Tiny labels, timestamps');

-- Style System
INSERT INTO color_palettes (brand_slug, color_key, hex, description) VALUES
    ('style-system', 'brand.primary', '#3B82F6', 'Primary actions, highlights, key icons, brand identity'),
    ('style-system', 'brand.primary.light', '#60A5FA', 'Hover states, secondary accents, lighter emphasis'),
    ('style-system', 'neutral.900', '#111827', NULL),
    ('style-system', 'neutral.800', '#1F2937', NULL),
    ('style-system', 'neutral.700', '#374151', NULL),
    ('style-system', 'neutral.600', '#4B5563', NULL),
    ('style-system', 'neutral.500', '#6B7280', NULL),
    ('style-system', 'neutral.400', '#9CA3AF', NULL),
    ('style-system', 'neutral.300', '#D1D5DB', NULL),
    ('style-system', 'neutral.200', '#E5E7EB', NULL),
    ('style-system', 'neutral.100', '#F3F4F6', NULL),
    ('style-system', 'neutral.50', '#F9FAFB', NULL);

-- Typography for Style System (not in output, but assuming similar—add if available; placeholder for now)

-- VSM School
INSERT INTO color_palettes (brand_slug, color_key, hex, description) VALUES
    ('vsm-school', 'brand.primary', '#1C2C4B', 'Deep Indigo — primary brand identity, headings, key emphasis, trust and depth'),
    ('vsm-school', 'brand.secondary', '#A78A55', 'Warm Gold — achievement, value, highlights, progress indicators'),
    ('vsm-school', 'accent.error', '#C5544D', 'Terra Cotta — errors, critical alerts, needs correction'),
    ('vsm-school', 'accent.success', '#88A57B', 'Sage Green — success states, completion, mastery achieved'),
    ('vsm-school', 'accent.warning', '#E2B13C', 'Amber — warnings, attention needed, caution'),
    ('vsm-school', 'brand.neutralDark', '#4A4A4A', 'Stone Grey — body text, secondary headings, grounded elements'),
    ('vsm-school', 'brand.neutralLight', '#F5F5F5', 'Soft Background — page base, card surfaces, breathing space'),
    ('vsm-school', 'neutral.mid', '#9E9E9E', 'Mid grey — borders, dividers, inactive states'),
    ('vsm-school', 'neutral.white', '#FFFFFF', 'Pure white — overlays, highest contrast');

INSERT INTO typography_scales (brand_slug, type_key, font, size, description) VALUES
    ('vsm-school', 'type.display', 'Noto Sans Display', 40.0, 'Hero text, landing pages, major impact'),
    ('vsm-school', 'type.h1', 'Noto Sans Display', 32.0, 'Page titles, phase headers'),
    ('vsm-school', 'type.h2', 'Noto Sans Display', 28.0, 'Section headers, major divisions'),
    ('vsm-school', 'type.h3', 'Noto Sans Display', 22.0, 'Subsection headers, lesson titles'),
    ('vsm-school', 'type.h4', 'Noto Sans Display', 18.0, 'Card titles, minor headings'),
    ('vsm-school', 'type.body.large', 'Inter', 18.0, 'Lead paragraphs, introductions'),
    ('vsm-school', 'type.body', 'Inter', 16.0, 'Standard content, instructions, descriptions'),
    ('vsm-school', 'type.emphasis', 'Inter', 16.0, 'Emphasized body text, key concepts'),
    ('vsm-school', 'type.button', 'Inter', 16.0, 'Button labels, CTAs'),
    ('vsm-school', 'type.body.small', 'Inter', 14.0, 'Secondary information, metadata'),
    ('vsm-school', 'type.label', 'Inter', 14.0, 'Form labels, card categories, phase labels'),
    ('vsm-school', 'type.caption', 'Inter', 12.0, 'Tiny labels, timestamps, footnotes');

-- Radiant Systems (placeholder—no colors/typo in output; add as needed)

-- Step 3: Whole-system views for perception/decision
CREATE VIEW IF NOT EXISTS full_system_view AS
SELECT 
    b.name AS brand_name,
    b.slug,
    b.tagline,
    cp.color_key,
    cp.hex,
    cp.description AS color_desc,
    ts.type_key,
    ts.font,
    ts.size,
    ts.description AS typo_desc
FROM brands b
LEFT JOIN color_palettes cp ON b.slug = cp.brand_slug
LEFT JOIN typography_scales ts ON b.slug = ts.brand_slug
ORDER BY b.name, 
    CASE WHEN cp.color_key LIKE 'brand.primary%' OR cp.color_key LIKE 'pipeline%' THEN 1
         WHEN cp.color_key LIKE 'neutral%' THEN 2
         ELSE 3 END,
    ts.size DESC;

CREATE VIEW IF NOT EXISTS cross_brand_shared_colors AS
SELECT 
    hex,
    GROUP_CONCAT(DISTINCT brand_slug) AS shared_brands,
    GROUP_CONCAT(DISTINCT color_key) AS shared_keys,
    COUNT(DISTINCT brand_slug) AS shared_count,
    MAX(description) AS example_desc
FROM color_palettes
GROUP BY hex
HAVING shared_count > 1
ORDER BY shared_count DESC;

CREATE VIEW IF NOT EXISTS high_impact_tokens AS
SELECT 
    brand_slug,
    'color' AS token_type,
    color_key,
    hex,
    LENGTH(description) AS impact_score,
    description
FROM color_palettes
UNION ALL
SELECT 
    brand_slug,
    'typography' AS token_type,
    type_key,
    font,
    size AS impact_score,  -- Proxy: larger size = higher impact
    description
FROM typography_scales
ORDER BY impact_score DESC
LIMIT 50;
