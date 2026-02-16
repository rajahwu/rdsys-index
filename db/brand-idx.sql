-- 1. Add indexes for performance (joins on brand_id/id will fly)
CREATE INDEX IF NOT EXISTS idx_brand_colors_brand_id ON brand_colors(brand_id);
CREATE INDEX IF NOT EXISTS idx_brand_typography_brand_id ON brand_typography(brand_id);
CREATE INDEX IF NOT EXISTS idx_brand_icons_brand_id ON brand_icons(brand_id);
CREATE INDEX IF NOT EXISTS idx_brand_assets_brand_id ON brand_assets(brand_id);
CREATE INDEX IF NOT EXISTS idx_brand_guidelines_brand_id ON brand_guidelines(brand_id);
CREATE INDEX IF NOT EXISTS idx_brand_spacing_brand_id ON brand_spacing(brand_id);
CREATE INDEX IF NOT EXISTS idx_brand_shadows_brand_id ON brand_shadows(brand_id);

-- 2. Core full-system view (all brands + colors + typo joined, ordered for scan)
CREATE VIEW IF NOT EXISTS full_identity_system_view AS
SELECT 
    b.name AS brand_name,
    b.slug,
    b.tagline,
    b.tone,
    b.keywords,
    c.token_name AS color_token,
    c.hex,
    c.usage_notes AS color_notes,
    c.is_primary AS color_primary,
    t.token_name AS typo_token,
    t.font_family,
    t.size_px,
    t.size_rem,
    t.usage_notes AS typo_notes
FROM brands b
LEFT JOIN brand_colors c ON b.id = c.brand_id
LEFT JOIN brand_typography t ON b.id = t.brand_id
ORDER BY 
    b.slug,
    CASE WHEN c.is_primary = 1 THEN 1 ELSE 2 END,  -- primaries first
    c.token_name,
    t.size_px DESC NULLS LAST;  -- larger typo first

-- 3. Cross-brand shared colors (e.g., common neutrals/whites for consistency decisions)
CREATE VIEW IF NOT EXISTS shared_colors_across_brands AS
SELECT 
    hex,
    GROUP_CONCAT(DISTINCT b.slug) AS brands_using,
    COUNT(DISTINCT b.id) AS brand_count,
    MAX(c.usage_notes) AS common_usage_example,
    SUM(c.is_primary) AS primary_count
FROM brand_colors c
JOIN brands b ON c.brand_id = b.id
WHERE hex IS NOT NULL
GROUP BY hex
HAVING brand_count > 1
ORDER BY brand_count DESC, primary_count DESC;

-- 4. High-impact typography tokens (larger sizes or detailed notes = higher decision weight)
CREATE VIEW IF NOT EXISTS high_impact_typography AS
SELECT 
    b.slug AS brand,
    t.token_name,
    t.font_family,
    t.size_px,
    t.size_rem,
    LENGTH(t.usage_notes) AS notes_depth,  -- richer notes = more intentional
    t.usage_notes
FROM brand_typography t
JOIN brands b ON t.brand_id = b.id
ORDER BY t.size_px DESC, notes_depth DESC
LIMIT 50;

-- 5. Quick count summary (how many tokens per brand — power-law check)
CREATE VIEW IF NOT EXISTS brand_token_counts AS
SELECT 
    b.slug,
    b.name,
    COUNT(DISTINCT c.id) AS color_count,
    COUNT(DISTINCT t.id) AS typo_count,
    COUNT(DISTINCT i.id) AS icon_count,
    (color_count + typo_count + icon_count) AS total_tokens
FROM brands b
LEFT JOIN brand_colors c ON b.id = c.brand_id
LEFT JOIN brand_typography t ON b.id = t.brand_id
LEFT JOIN brand_icons i ON b.id = i.brand_id
GROUP BY b.id
ORDER BY total_tokens DESC;

