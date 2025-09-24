; MIT Shadowdara 2025
; Opens MINGW64 shell in the active Explorer folder for compiling

#Requires AutoHotkey v2.0

#+b:: {
    explorer := ComObject("Shell.Application")
    activeHWND := WinActive("A")

    for window in explorer.Windows {
        try {
            if (window.HWND = activeHWND && InStr(window.FullName, "explorer.exe")) {
                path := window.Document.Folder.Self.Path

                ; Use mintty to launch mingw64 bash in the desired directory
                command := Format('-i /msys2.ico -t "MINGW64 Bash" /usr/bin/env MSYSTEM=MINGW64 CHERE_INVOKING=1 /bin/bash --login -c "cd \"{}\"; exec bash"', path)
                Run Format('C:\msys64\usr\bin\mintty.exe {}', command)
                return
            }
        } catch {
            continue
        }
    }

    MsgBox "No active Explorer window found!"
}
