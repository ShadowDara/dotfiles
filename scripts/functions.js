import https from 'https';
import fs from 'fs';

export function downloadFile(url, dest) {
  const file = fs.createWriteStream(dest);
  https.get(url, (response) => {
    response.pipe(file);
    file.on('finish', () => {
      file.close();
      console.log(`Downloaded: ${dest}`);
    });
  }).on('error', (err) => {
    fs.unlink(dest);
    console.error(`Error downloading ${url}: ${err.message}`);
  });
}

export function createFolderIfNotExists(folderPath) {
  if (!fs.existsSync(folderPath)) {
    fs.mkdirSync(folderPath, { recursive: true });
    console.log(`Created folder: ${folderPath}`);
  }
}
