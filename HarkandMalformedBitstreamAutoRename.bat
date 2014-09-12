@echo off
rem FOR /r %%i in (*.mp4) DO ffmpeg -i "%%~fi"  -c:a copy -c:v copy -bsf h264_mp4toannexb -f mpegts -c:a copy -c:v copy "%%~dpni(2)%%~xi"

FOR /f "delims=" %%f in ('dir "*.mp4" /s/b') do @call:runItFun "%%f"
goto:eof

:runItFun
:: Get filename from 1st argument
SET ORIG_NAME="%~f1"
:: New name via expansion of drive, path, name and extension
SET NEW_NAME="%~dpn1_new%~x1"
echo %ORIG_NAME%
echo %NEW_NAME%
:: Execute the FFMPEG command to convert byte-stream to Annex B format
ffmpeg -i %ORIG_NAME% -c:a copy -c:v copy -bsf h264_mp4toannexb -f mpegts %NEW_NAME%
goto:eof
