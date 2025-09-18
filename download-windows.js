import { createFolderIfNotExists, downloadFile } from './scripts/functions.js';

createFolderIfNotExists('bin');

// Windows Terminal Background Picture
downloadFile("https://i.redd.it/b6khq2gmbyo51.jpg", "configs/windows-terminal/background_picture.jpg");
