SELECT b.name,
       (SELECT COUNT(*) FROM brand_colors WHERE brand_id = b.id AND is_primary = 1) as has_primary_color,
       (SELECT COUNT(*) FROM brand_typography WHERE brand_id = b.id AND token_name = 'type.h1') as has_h1,
       (SELECT COUNT(*) FROM brand_typography WHERE brand_id = b.id AND token_name = 'type.body') as has_body
FROM brands b
WHERE has_primary_color = 0 OR has_h1 = 0 OR has_body = 0;
