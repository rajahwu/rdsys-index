-- typography_scale_query.sql
SELECT b.slug, t.token_name, t.font_family, t.size_px
FROM brand_typography t
JOIN brands b ON t.brand_id = b.id
WHERE t.token_name LIKE '%h1%' OR t.token_name LIKE '%display%'
ORDER BY t.size_px DESC;
