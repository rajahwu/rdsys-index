import sqlite3
from collections import defaultdict

conn = sqlite3.connect('_index/db/brands.db')
cursor = conn.cursor()

query = """
SELECT 
    b.name, b.slug, b.tagline,
    c.token_name AS color_token, c.hex, c.usage_notes AS color_notes,
    t.token_name AS typo_token, t.font_family, t.size_px, t.usage_notes AS typo_notes
FROM brands b
LEFT JOIN brand_colors c ON b.id = c.brand_id
LEFT JOIN brand_typography t ON b.id = t.brand_id
ORDER BY b.slug, c.is_primary DESC, c.token_name, t.size_px DESC
"""

cursor.execute(query)
rows = cursor.fetchall()

# Group by brand for clean output
grouped = defaultdict(list)
for row in rows:
    brand = row[0]
    grouped[brand].append(row)

for brand, items in grouped.items():
    print(f"\n=== {brand} ({items[0][1]}) ===")
    print(f"Tagline: {items[0][2]}")
    
    colors_seen = set()
    typos_seen = set()
    
    for item in items:
        _, _, _, c_token, hex_val, c_notes, t_token, font, size, t_notes = item
        
        if c_token and c_token not in colors_seen:
            colors_seen.add(c_token)
            print(f"  Color: {c_token:20} | {hex_val:8} | {c_notes or ''}")
        
        if t_token and (t_token, size) not in typos_seen:
            typos_seen.add((t_token, size))
            print(f"  Typo : {t_token:20} | {font:15} {size:5.1f}px | {t_notes or ''}")
