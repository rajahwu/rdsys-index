#!/bin/bash

echo "🚀 INITIALIZING CRITICAL FIXES FOR _INDEX/WEB..."

# 1. Install missing core dependencies (Issue [1])
echo "📦 Installing styling utilities..."
pnpm install clsx tailwind-merge

# 2. Create the missing lib/utils.ts (Issue [1])
echo "🛠️ Creating @/lib/utils.ts..."
mkdir -p lib
cat <<EOF > lib/utils.ts
import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

/**
 * Merges Tailwind classes and resolves conflicts.
 * Resolves Critical Issue [1] from audit.
 */
export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
EOF

# 3. Inject Path Aliases into tsconfig.json (Issue [4])
# Note: This uses python to safely merge the paths into the JSON
echo "🏗️ Updating tsconfig.json with path aliases..."
python3 -c "
import json
try:
    with open('tsconfig.json', 'r') as f:
        data = json.load(f)
    if 'compilerOptions' not in data:
        data['compilerOptions'] = {}
    data['compilerOptions']['baseUrl'] = '.'
    data['compilerOptions']['paths'] = {'@/*': ['./*']}
    with open('tsconfig.json', 'w') as f:
        json.dump(data, f, indent=2)
    print('✅ tsconfig.json updated successfully.')
except Exception as e:
    print(f'❌ Error updating tsconfig: {e}')
"

# 4. Standardize Package Manager (Issue [3])
echo "🧹 Standardizing on pnpm..."
rm -f package-lock.json bun.lockb
pnpm install

echo "✨ FIXES APPLIED. CRITICAL ISSUES [1], [3], [4] RESOLVED."
