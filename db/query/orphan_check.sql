-- orphan_check.sql
SELECT 'color' as type, token_name, brand_id FROM brand_colors 
WHERE brand_id NOT IN (SELECT id FROM brands)
UNION ALL
SELECT 'typo' as type, token_name, brand_id FROM brand_typography 
WHERE brand_id NOT IN (SELECT id FROM brands);

