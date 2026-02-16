import sqlite3
import csv
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

with open('_index/db/full_grouped.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['Brand', 'Slug', 'Tagline', 'Color Token', 'Hex', 'Color Notes', 'Typo Token', 'Font', 'Size px', 'Typo Notes'])
    for brand, items in grouped.items():
        for item in items:
            writer.writerow(item)

html = '<html><head><title>Full Identity Lattice</title><style> .swatch {width:120px;height:120px;margin:8px;display:inline-block;text-align:center;line-height:120px;color:white;font-weight:bold;border:1px solid #ccc;} </style></head><body>'
for brand, items in grouped.items():
    html += f'<h2>{brand} ({items[0][1]})</h2><p>{items[0][2]}</p>'
    colors = {}
    for item in items:
        if item[3]:  # color_token
            colors[item[3]] = (item[4], item[5])  # hex, notes
    for token, (hex_val, notes) in colors.items():
        if hex_val:
            text_color = '#000' if int(hex_val[1:],16) > 0x888888 else '#fff'
            html += f'<div class="swatch" style="background:#{hex_val[1:]};color:{text_color}">{token}<br>{hex_val}</div>'
    html += '<hr>'
html += '</body></html>'

with open('_index/db/lattice_render.html', 'w') as f:
    f.write(html)
