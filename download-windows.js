import { createFolderIfNotExists, downloadFile } from './scripts/functions.js';

createFolderIfNotExists('bin');

// Windows Terminal Background Picture
downloadFile("https://i.redd.it/b6khq2gmbyo51.jpg", "configs/windows-terminal/background_picture.jpg");
downloadFile("https://github.com/PowerShell/PowerShell/releases/download/v7.4.12/PowerShell-7.4.12-win-x64.zip", "bin/PowerShell.zip");
