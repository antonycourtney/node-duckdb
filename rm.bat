@echo off
IF NOT "%1"=="-rf" (
  DEL /f /q %1
  GOTO :EOF
) 

IF EXIST %2 (
    echo %2 %1
    rmdir /q /s %2
)
