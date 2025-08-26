# Converter for Minecraft Replay Mod videos
# By Shadowdara 2025 MIT License

import tkinter as tk
from tkinter import filedialog
import subprocess
import os
import sys

def choose_files():
    filepaths = filedialog.askopenfilenames(
        title="Choose Files",
        filetypes=[("Video Files", "*.mp4 *.mov *.avi *.mkv"), ("All Files", "*.*")]
    )
    return filepaths if filepaths else []

def main():
    print("Video Converter for Minecraft Replay Mod videos")

    # Tkinter setup
    root = tk.Tk()
    root.withdraw()

    files = choose_files()
    if not files:
        print("No files chosen. Exiting.")
        return

    print("Chosen:")
    for f in files:
        print(" -", f)

    if input("Continue with conversion? (Press Enter to continue, [N] to cancel) ").strip().upper() == "N":
        print("Conversion canceled.")
        input()
        return

    # Create output folder
    os.makedirs("output", exist_ok=True)

    # Check ffmpeg availability
    try:
        subprocess.run(["ffmpeg", "-version"], capture_output=True, check=True)

    except Exception:
        print("⚠️ ffmpeg not found! Please install it and make sure it's in PATH.")
        input()
        sys.exit(1)

    for f in files:
        filename = os.path.basename(f)
        output_path = os.path.join("output", filename)

        # ffmpeg -i input.mp4 -c:v libx264 -preset slow -crf 18 -pix_fmt yuv420p -r 60 -c:a aac -b:a 192k output.mp4

        try:
            print(f"Converting {filename} ...")
            subprocess.run([
            "ffmpeg", "-y", "-i", f,
            "-c:v", "libx264", "-preset", "fast", "-crf", "18", "-pix_fmt", "yuv420p", "-r", "60",
            "-c:a", "aac", "-b:a", "192k",
            output_path
            ], check=True)
            print(f"Saved: {output_path}")

        except subprocess.CalledProcessError as e:
            print(f"Error converting {filename}: {e}")
    
    input("Conversion complete. Press Enter to exit.")

if __name__ == "__main__":
    main()
