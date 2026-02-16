-- system_density_query.sql
SELECT b.slug, 
       (SELECT COUNT(*) FROM brand_colors WHERE brand_id = b.id) AS colors,
       (SELECT COUNT(*) FROM brand_typography WHERE brand_id = b.id) AS typography,
       (SELECT COUNT(*) FROM brand_icons WHERE brand_id = b.id) AS icons
FROM brands b
ORDER BY (colors + typography + icons) DESC;
