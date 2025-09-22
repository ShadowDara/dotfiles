; MIT Shadowdara 2025
; Öffnet Windows Terminal im aktiven Explorer-Verzeichnis

#Requires AutoHotkey v2.0
#z:: {
    explorer := ComObject("Shell.Application")
    activeHWND := WinActive("A")

    for window in explorer.Windows {
        try {
            if (window.HWND = activeHWND && InStr(window.FullName, "explorer.exe")) {
                path := window.Document.Folder.Self.Path
                Run Format('wt -d "{}"', path)
                return
            }
        }
    }

    MsgBox "No Explorer Window found!."
}
