const fs = require('fs');
const path = require('path');

// CONFIGURATION
const SOURCE_DIR = path.resolve(__dirname, '../../systems');
const MANIFEST_OUTPUT = path.resolve(__dirname, '../../systems-manifest.json');

// The pattern: 2-4 uppercase letters, hyphen, 2 digits (e.g., CF-06, GLS-15)
const ID_PATTERN = /^[A-Z]{2,4}-\d{2}$/;

// Recursively walk directory to find ID folders
const findSystemNodes = (dir, list = []) => {
    const files = fs.readdirSync(dir, { withFileTypes: true });

    for (const file of files) {
        const fullPath = path.join(dir, file.name);

        if (file.isDirectory()) {
            // CHECK: Is this folder a Registry ID?
            if (ID_PATTERN.test(file.name)) {
                console.log(`🎯 Found Node: ${file.name} in ${dir}`);
                
                // Get the parent system name (e.g., "content-factor" or "dropframe")
                const parentDir = path.basename(dir);
                
                list.push({
                    id: file.name,          // CF-06
                    name: parentDir,        // content-factor
                    path: fullPath,         // Absolute path for copying later
                    relative_url: `/systems/${parentDir}/${file.name}` // Web URL
                });
            } else if (file.name !== 'node_modules' && !file.name.startsWith('.')) {
                // Keep digging
                findSystemNodes(fullPath, list);
            }
        }
    }
    return list;
};

const generate = () => {
    console.log(`📡 Scanning for Corelink IDs in ${SOURCE_DIR}...`);
    const nodes = findSystemNodes(SOURCE_DIR);

    const manifest = nodes.map(node => {
        // Here we would actually read the files inside the node
        // For now, we list what we found
        const contents = fs.readdirSync(node.path);
        return {
            ...node,
            assets: contents
        };
    });

    fs.writeFileSync(MANIFEST_OUTPUT, JSON.stringify(manifest, null, 2));
    console.log(`✅ Manifest generated with ${manifest.length} systems.`);
};

generate();