import sqlite3
from pathlib import Path

# Adjusting to reach ../db/brands.db
DB_PATH = Path(__file__).parent.parent / "db" / "brands.db"

def get_brand_summary(slug=None):
    """Fetches a high-level summary of one or all brands."""
    query = "SELECT * FROM brand_token_counts" # Using your existing view
    params = ()
    if slug:
        query += " WHERE slug = ?"
        params = (slug,)
    
    with sqlite3.connect(DB_PATH) as conn:
        conn.row_factory = sqlite3.Row
        return [dict(row) for row in conn.execute(query, params).fetchall()]

def get_tokens(brand_slug, category='colors'):
    """Quickly pull tokens for scripting or export."""
    table = "brand_colors" if category == 'colors' else "brand_typography"
    query = f"""
        SELECT t.* FROM {table} t
        JOIN brands b ON t.brand_id = b.id
        WHERE b.slug = ?
    """
    with sqlite3.connect(DB_PATH) as conn:
        conn.row_factory = sqlite3.Row
        return [dict(row) for row in conn.execute(query, (brand_slug,)).fetchall()]
