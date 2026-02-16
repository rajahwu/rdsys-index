SELECT b.slug, 
       json_group_object(c.token_name, c.hex) as colors,
       json_group_object(t.token_name, t.font_family || ' ' || t.size_px || 'px') as typography
FROM brands b
LEFT JOIN brand_colors c ON b.id = c.brand_id
LEFT JOIN brand_typography t ON b.id = t.brand_id
GROUP BY b.id;
