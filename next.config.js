const fs = require('fs');
const { join } = require('path');
const { promisify } = require('util');
const copyFile = promisify(fs.copyFile);

module.exports = {
  exportPathMap: async function(defaultPathMap, { dev, dir, outDir, distDir, buildId }) {
    if (dev) {
      return defaultPathMap;
    }

    await copyFile(join(dir, 'public/_redirects'), join(outDir, '_redirects'));
    await copyFile(join(dir, 'public/apple-touch-icon-192x192.png'), join(outDir, 'apple-touch-icon-192x192.png'));
    await copyFile(join(dir, 'public/favicon.ico'), join(outDir, 'favicon.ico'));
    await copyFile(join(dir, 'public/favicon.svg'), join(outDir, 'favicon.svg'));
    await copyFile(join(dir, 'public/keybase.txt'), join(outDir, 'keybase.txt'));
    await copyFile(join(dir, 'public/soffes.asc'), join(outDir, 'soffes.asc'));

    return defaultPathMap;
  }
};
