// touch-windows.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <windows.h>
#include <fstream>
#include <filesystem>

// Main function
int main(int argc, char* argv[])
{
	if (argc < 2) {
		std::cerr << "Touch Windows - Please at atleast one argument as a filename!" << std::endl;
        std::cerr << "1: Filename" << std::endl;
        std::cerr << "2: Filecontent" << std::endl;
        std::cerr << "Touch Windows - Infos:\nhttps://github.com/shadowdara/dotfiles" << std::endl;
        return 1;
	}

    // Get the executable Path
    char buffer[MAX_PATH];
    GetModuleFileNameA(NULL, buffer, MAX_PATH);

    std::string fullPath(buffer);

    // Letzter Backslash trennt Pfad vom Dateinamen
    size_t lastSlash = fullPath.find_last_of("\\/");
    if (lastSlash != std::string::npos) {
        std::string directoryPath = fullPath.substr(0, lastSlash);
        //std::cout << "Touch Windows - Directory Path: " << directoryPath << std::endl;
    }
    else {
        std::cerr << "Touch Windows - Path could not be sepperated." << std::endl;
    }

    try {
        // Ordner zur Sicherheit erstellen
        std::filesystem::path dateipfad = argv[1];

        // Verzeichnisse erzeugen, falls nötig
        try {
            if (dateipfad.has_parent_path()) {
                std::filesystem::create_directories(dateipfad.parent_path());
            }
        }
        catch (const std::filesystem::filesystem_error& e) {
            std::cerr << "Error while creating directories: " << e.what() << "\n";
            return 1;
        }

        // Code, der eine Ausnahme werfen könnte
        std::ofstream datei(argv[1]);
        if (datei.is_open()) {

			// Schreibe das zweite Argument in die Datei, wenn vorhanden
            if (argc >= 2) {
                datei << argv[2];
            }
            datei.close();
        }
        else {
            std::cerr << "Touch Windows - Error while creating File: " << argv[1] << std::endl;
            return 1;
        }
        std::cout << "Touch Windows - Created File: " << argv[1] << std::endl;
    }
    catch (const std::exception& e) {
        // Ausnahmebehandlung
        std::cerr << "Touch Windows - Error: " << e.what() << std::endl;
    }

    return 0;
}
