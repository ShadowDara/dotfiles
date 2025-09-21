@echo off

@rem Run without Admin Rights
@rem
@rem A Batch Script which allows to run a programm with
@rem bypassing administrator rights

set __COMPAT_LAYER=RunAsInvoker

@rem IMPORTANT: Change the path to your binary here
start steamsetup.exes

echo Binary executed without admin rights.
@pause
