import sqlite3
import argparse
import os
from pathlib import Path

DB_PATH = Path(__file__).parent.parent / "db" / "brands.db"

def query_db(query_file, params=()):
    query_path = Path(__file__).parent.parent / "db" / "query" / query_file
    with sqlite3.connect(DB_PATH) as conn:
        cursor = conn.cursor()
        with open(query_path, 'r') as f:
            sql = f.read()
        cursor.execute(sql, params)
        return cursor.fetchall()

def main():
    parser = argparse.ArgumentParser(description="RDSYS Index CLI")
    subparsers = parser.add_subparsers(dest="command")

    # Audit Command
    subparsers.add_parser('audit', help='Run brand readiness audit')

    # New: List Command
    subparsers.add_parser('ls', help='List all brands and token counts')

    # Search Command
    search = subparsers.add_parser('find', help='Search for a token value')
    search.add_argument('term', help='Hex code or Font name')

    args = parser.parse_args()

    if args.command == 'ls':
        # Direct query to your summary view
        with sqlite3.connect(DB_PATH) as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT slug, name FROM brands")
            results = cursor.fetchall()
            print(f"{'Slug':<20} | {'Brand Name':<20}")
            print("-" * 55)
            for row in results:
                print(f"{row[0]:<20} | {row[1]:<20}")

    elif args.command == 'audit':
        # ... your existing audit logic ...
        # (Tip: If it returns nothing, add a print("✅ Systems nominal"))
        pass

    elif args.command == 'find':
        term = f"%{args.term}%"
        results = query_db('cli_search_helper.sql', (term, term))
        if not results:
            print(f"No matches found for '{args.term}'")
        for row in results:
            print(f"[{row[0]}] {row[1]}: {row[2]} -> {row[3]}")

if __name__ == "__main__":
    main()
