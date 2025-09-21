import { createFolderIfNotExists, downloadFile } from './../scripts/functions.js';

createFolderIfNotExists('bin');
createFolderIfNotExists('%USERPROFILE%\\.dara');
createFolderIfNotExists('%USERPROFILE%\\.dara\\PowerShell');

// Windows Terminal Background Picture
downloadFile("https://i.redd.it/b6khq2gmbyo51.jpg", "../windows-terminal/windows_terminal_background_picture.jpg");
