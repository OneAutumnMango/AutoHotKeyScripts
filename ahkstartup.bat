@echo off
@REM for %%v in ("C:\msys64\home\david\scripts\ahk\startup\*.ahk") do start "" "%%v"  
for /r "C:\msys64\home\david\scripts\ahk\startup\" %%v in (*.ahk) do start "" "%%v"  @REM checks subfolders too
