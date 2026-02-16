-- color_collision_query.sql
SELECT c.hex, 
       GROUP_CONCAT(DISTINCT b.slug) AS brands, 
       COUNT(DISTINCT b.id) AS brand_count
FROM brand_colors c
JOIN brands b ON c.brand_id = b.id
WHERE c.hex IS NOT NULL AND c.hex != ''
GROUP BY c.hex
HAVING brand_count > 1
ORDER BY brand_count DESC;
