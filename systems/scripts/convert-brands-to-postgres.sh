#!/bin/bash

# ============================================
# Brand SQL Converter: SQLite → Postgres
# Converts all identity-marker.sql files in system directories
# ============================================

echo "🔄 Starting brand SQL conversion (SQLite → Postgres)..."
echo ""

# Counter for tracking conversions
converted=0
skipped=0

# Loop through all directories in current location
for dir in */; do
    # Remove trailing slash
    system_id="${dir%/}"
    
    # Check if identity-marker.sql exists in this directory
    if [ -f "$dir/identity-marker.sql" ]; then
        echo "📁 Processing: $system_id"
        
        input_file="$dir/identity-marker.sql"
        output_file="$dir/identity-marker-postgres.sql"
        
        # Perform conversions using sed
        sed -e "s/datetime('now')/NOW()/g" \
            -e "s/, parent_brand_id, created_at, updated_at)/, created_at, updated_at)/g" \
            -e "/(SELECT id FROM brands WHERE slug = 'radiant-systems'),/d" \
            -e "s/, is_primary)/, is_primary)/g" \
            -e "s/, 1)/,  TRUE)/g" \
            -e "s/, 0)/,  FALSE)/g" \
            -e "s/is_primary_glyph)/is_primary_glyph)/g" \
            "$input_file" > "$output_file"
        
        # Verify output file was created
        if [ -f "$output_file" ]; then
            echo "   ✅ Converted: $output_file"
            ((converted++))
        else
            echo "   ❌ Failed to create: $output_file"
        fi
        
        echo ""
    else
        ((skipped++))
    fi
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 Conversion Summary"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "   ✅ Converted: $converted files"
echo "   ⏭️  Skipped:   $skipped directories (no identity-marker.sql)"
echo ""
echo "🔧 Conversions applied:"
echo "   • datetime('now') → NOW()"
echo "   • Removed parent_brand_id references"
echo "   • Removed radiant-systems parent lookup"
echo "   • Changed 0 → FALSE, 1 → TRUE"
echo ""
echo "🎯 Next steps:"
echo "   1. Review converted files (identity-marker-postgres.sql)"
echo "   2. Copy contents to Supabase SQL Editor"
echo "   3. Execute in Supabase"
echo ""
echo "💡 Verify a conversion:"
echo "   diff CF-06/identity-marker.sql CF-06/identity-marker-postgres.sql | head -20"
echo ""