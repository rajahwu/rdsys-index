import sqlite3
conn = sqlite3.connect('_index/db/brands.db')
cursor = conn.cursor()
cursor.execute("SELECT * FROM full_system_view")
rows = cursor.fetchall()
print(rows)
# Then generate HTML with swatches for hex, tables for typo, grouped by brand
