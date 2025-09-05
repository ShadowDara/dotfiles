import os
import shutil
from datetime import datetime

def convert_world(base_path="minecraft-data"):
    """
    Konvertiert eine Paper/Spigot-Welt-Struktur (world, world_nether, world_the_end)
    in die Vanilla-Struktur (world/DIM-1, world/DIM1).
    """

    world_dir = os.path.join(base_path, "world")
    nether_dir = os.path.join(base_path, "world_nether")
    end_dir = os.path.join(base_path, "world_the_end")

    # Backup erstellen
    backup_name = f"{base_path}_backup_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
    print(f"[INFO] Erstelle Backup nach: {backup_name}")
    shutil.copytree(base_path, backup_name)

    # Nether verschieben
    if os.path.exists(nether_dir):
        dim_minus1 = os.path.join(world_dir, "DIM-1")
        os.makedirs(dim_minus1, exist_ok=True)
        print(f"[INFO] Verschiebe Nether von {nether_dir} → {dim_minus1}")
        for item in os.listdir(nether_dir):
            shutil.move(os.path.join(nether_dir, item), dim_minus1)
        shutil.rmtree(nether_dir)

    # End verschieben
    if os.path.exists(end_dir):
        dim1 = os.path.join(world_dir, "DIM1")
        os.makedirs(dim1, exist_ok=True)
        print(f"[INFO] Verschiebe End von {end_dir} → {dim1}")
        for item in os.listdir(end_dir):
            shutil.move(os.path.join(end_dir, item), dim1)
        shutil.rmtree(end_dir)

    print("[INFO] Fertig! Deine Welt ist nun Vanilla-kompatibel.")


if __name__ == "__main__":
    # Standardordner "minecraft-data", kann aber auch als Argument angegeben werden
    import sys
    base = sys.argv[1] if len(sys.argv) > 1 else "minecraft-data"
    convert_world(base)

