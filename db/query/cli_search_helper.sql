-- Useful for: 'rdsys-cli find-color #F97316'
SELECT 'Color' as source, b.name, c.token_name, c.hex as value
FROM brand_colors c JOIN brands b ON c.brand_id = b.id
WHERE c.hex LIKE ?
UNION ALL
SELECT 'Typo' as source, b.name, t.token_name, t.font_family as value
FROM brand_typography t JOIN brands b ON t.brand_id = b.id
WHERE t.font_family LIKE ?;
