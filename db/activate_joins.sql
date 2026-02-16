-- 1. Speed up joins (indexes on FKs)
CREATE INDEX IF NOT EXISTS idx_colors_brand ON brand_colors(brand_id);
CREATE INDEX IF NOT EXISTS idx_typo_brand   ON brand_typography(brand_id);
CREATE INDEX IF NOT EXISTS idx_icons_brand   ON brand_icons(brand_id);
CREATE INDEX IF NOT EXISTS idx_assets_brand   ON brand_assets(brand_id);
CREATE INDEX IF NOT EXISTS idx_guidelines_brand ON brand_guidelines(brand_id);
CREATE INDEX IF NOT EXISTS idx_spacing_brand   ON brand_spacing(brand_id);
CREATE INDEX IF NOT EXISTS idx_shadows_brand   ON brand_shadows(brand_id);

-- 2. Core full-system view (all brands + colors + typo + icons joined, ordered)
CREATE VIEW IF NOT EXISTS full_lattice_view AS
SELECT 
    b.name          AS brand_name,
    b.slug,
    b.tagline,
    b.tone,
    b.keywords,
    c.token_name    AS color_token,
    c.hex,
    c.usage_notes   AS color_usage,
    c.is_primary    AS color_primary,
    t.token_name    AS typo_token,
    t.font_family,
    t.size_px,
    t.usage_notes   AS typo_usage,
    i.category      AS icon_category,
    i.name          AS icon_name,
    i.description   AS icon_desc
FROM brands b
LEFT JOIN brand_colors      c ON b.id = c.brand_id
LEFT JOIN brand_typography  t ON b.id = t.brand_id
LEFT JOIN brand_icons       i ON b.id = i.brand_id
ORDER BY 
    b.slug,
    CASE WHEN c.is_primary = 1 THEN 1 ELSE 2 END,  -- primaries first
    c.token_name,
    t.size_px DESC NULLS LAST,
    i.category;

-- 3. Shared colors view (decisions: standardize these?)
CREATE VIEW IF NOT EXISTS shared_colors AS
SELECT 
    hex,
    GROUP_CONCAT(DISTINCT b.slug) AS brands,
    COUNT(DISTINCT b.id)          AS brand_count,
    MAX(c.usage_notes)            AS common_usage,
    SUM(c.is_primary)             AS primary_uses
FROM brand_colors c
JOIN brands b ON c.brand_id = b.id
WHERE hex IS NOT NULL AND hex != ''
GROUP BY hex
HAVING brand_count > 1
ORDER BY brand_count DESC, primary_uses DESC;

-- 4. High-impact typography (larger size / richer notes = decision priority)
CREATE VIEW IF NOT EXISTS high_impact_typo AS
SELECT 
    b.slug          AS brand,
    t.token_name,
    t.font_family,
    t.size_px,
    LENGTH(t.usage_notes) AS notes_depth,
    t.usage_notes
FROM brand_typography t
JOIN brands b ON t.brand_id = b.id
ORDER BY t.size_px DESC, notes_depth DESC
LIMIT 50;

-- 5. Token counts per brand (power-law check: few brands dominate tokens?)
CREATE VIEW IF NOT EXISTS brand_token_summary AS
SELECT 
    b.slug,
    b.name,
    COUNT(DISTINCT c.id) AS colors,
    COUNT(DISTINCT t.id) AS typography,
    COUNT(DISTINCT i.id) AS icons,
    (colors + typography + icons) AS total_tokens
FROM brands b
LEFT JOIN brand_colors     c ON b.id = c.brand_id
LEFT JOIN brand_typography t ON b.id = t.brand_id
LEFT JOIN brand_icons      i ON b.id = i.brand_id
GROUP BY b.id
ORDER BY total_tokens DESC;
