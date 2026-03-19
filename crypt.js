#!/usr/bin/env bun

// enrypt
// bun crypt.js encrypt Secret2 Secret
//
// decrypt
// bun crypt.js decrypt Secret Secret2

import { readdir, readFile, writeFile, mkdir } from "fs/promises";
import { join } from "path";
import {
  randomBytes,
  pbkdf2Sync,
  createCipheriv,
  createDecipheriv,
} from "crypto";

const ALGO = "aes-256-gcm";
const SALT_LENGTH = 16;
const IV_LENGTH = 12;
const KEY_LENGTH = 32;
const ITERATIONS = 100000;

// Key aus Passwort ableiten
function deriveKey(password, salt) {
  return pbkdf2Sync(password, salt, ITERATIONS, KEY_LENGTH, "sha256");
}

// Datei verschlüsseln
async function encryptFile(inputPath, outputPath, password) {
  const data = await readFile(inputPath);

  const salt = randomBytes(SALT_LENGTH);
  const iv = randomBytes(IV_LENGTH);
  const key = deriveKey(password, salt);

  const cipher = createCipheriv(ALGO, key, iv);

  const encrypted = Buffer.concat([cipher.update(data), cipher.final()]);
  const tag = cipher.getAuthTag();

  // Format: [salt][iv][tag][data]
  const result = Buffer.concat([salt, iv, tag, encrypted]);

  await writeFile(outputPath, result);
}

// Datei entschlüsseln
async function decryptFile(inputPath, outputPath, password) {
  const file = await readFile(inputPath);

  const salt = file.subarray(0, SALT_LENGTH);
  const iv = file.subarray(SALT_LENGTH, SALT_LENGTH + IV_LENGTH);
  const tag = file.subarray(
    SALT_LENGTH + IV_LENGTH,
    SALT_LENGTH + IV_LENGTH + 16,
  );
  const encrypted = file.subarray(SALT_LENGTH + IV_LENGTH + 16);

  const key = deriveKey(password, salt);

  const decipher = createDecipheriv(ALGO, key, iv);
  decipher.setAuthTag(tag);

  const decrypted = Buffer.concat([
    decipher.update(encrypted),
    decipher.final(),
  ]);

  await writeFile(outputPath, decrypted);
}

// Ordner verarbeiten
async function processDir(mode, srcDir, destDir, password) {
  await mkdir(destDir, { recursive: true });

  const files = await readdir(srcDir, { withFileTypes: true });

  for (const file of files) {
    const srcPath = join(srcDir, file.name);
    const destPath = join(
      destDir,
      file.name + (mode === "encrypt" ? ".enc" : ""),
    );

    if (file.isDirectory()) {
      await processDir(mode, srcPath, destPath, password);
    } else {
      try {
        if (mode === "encrypt") {
          await encryptFile(srcPath, destPath, password);
          console.log(`🔒 Encrypted: ${srcPath}`);
        } else {
          const cleanName = destPath.replace(/\.enc$/, "");
          await decryptFile(srcPath, cleanName, password);
          console.log(`🔓 Decrypted: ${srcPath}`);
        }
      } catch (err) {
        console.error(`❌ Fehler bei ${srcPath}:`, err.message);
      }
    }
  }
}

// CLI
const [, , mode, srcDir, destDir, password] = process.argv;

if (!["encrypt", "decrypt"].includes(mode)) {
  console.log("Usage:");
  console.log("bun secure-copy.js encrypt <srcDir> <destDir> <password>");
  console.log("bun secure-copy.js decrypt <srcDir> <destDir> <password>");
  process.exit(1);
}

await processDir(mode, srcDir, destDir, password);
