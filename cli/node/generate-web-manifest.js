const fs = require('fs');
const path = require('path');

const SOURCE_DIR = path.resolve(__dirname, '../../systems');
const TARGET_DIR = path.resolve(__dirname, '../../web/public/systems');
const MANIFEST_PATH = path.resolve(__dirname, '../../web/public/systems-manifest.json');
const ID_PATTERN = /^[A-Z]{2,5}-\d{2}$/;

// Helper to clear old build
const clearDirectory = (directory) => {
  if (fs.existsSync(directory)) {
    fs.rmSync(directory, { recursive: true, force: true });
  }
  fs.mkdirSync(directory, { recursive: true });
};

const publish = () => {
  console.log(`🚀 Starting RDXT Publication: ${SOURCE_DIR} -> ${TARGET_DIR}`);
  clearDirectory(TARGET_DIR);
  
  const manifest = [];

  const walk = (dir) => {
    const files = fs.readdirSync(dir, { withFileTypes: true });

    for (const file of files) {
      const fullPath = path.join(dir, file.name);

      if (file.isDirectory()) {
        if (ID_PATTERN.test(file.name)) {
          const id = file.name;
          const parentSystem = path.basename(path.dirname(fullPath)) === 'apps' 
            ? path.basename(path.dirname(path.dirname(fullPath))) 
            : path.basename(path.dirname(fullPath));

          console.log(`📦 Publishing Node: [${id}] from ${parentSystem}`);

          const destDir = path.join(TARGET_DIR, id);
          fs.mkdirSync(destDir, { recursive: true });

          // Copy all files in the ID folder
          const assets = fs.readdirSync(fullPath);
          assets.forEach(asset => {
            const assetSrc = path.join(fullPath, asset);
            const assetDest = path.join(destDir, asset);
            if (fs.lstatSync(assetSrc).isFile()) {
              fs.copyFileSync(assetSrc, assetDest);
            }
          });

          manifest.push({
            id,
            system: parentSystem,
            assets,
            url_base: `/systems/${id}/`
          });
        } else if (file.name !== 'node_modules' && !file.name.startsWith('.')) {
          walk(fullPath);
        }
      }
    }
  };

  walk(SOURCE_DIR);
  fs.writeFileSync(MANIFEST_PATH, JSON.stringify(manifest, null, 2));
  console.log(`\n✅ Publication Complete. ${manifest.length} Nodes pushed to public.`);
};

publish();

