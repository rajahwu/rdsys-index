SELECT b.name, 
       COUNT(bg.id) as section_count, 
       SUM(LENGTH(bg.content)) as total_content_volume
FROM brands b
JOIN brand_guidelines bg ON b.id = bg.brand_id
GROUP BY b.id
ORDER BY total_content_volume DESC;

