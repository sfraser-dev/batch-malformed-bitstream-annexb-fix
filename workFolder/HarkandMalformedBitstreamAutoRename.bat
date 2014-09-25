@echo off

for /f "delims=" %%f in ('dir "*.mp4" /s/b') do @call:runItFun "%%f"
goto:eof

:runItFun
:: Get filename from 1st argument
SET ORIG_NAME="%~f1"
:: New name via expansion of drive, path, name and extension
:: SET NEW_NAME="%~dpn1_new%~x1"
SET TS_NAME="%~dpn1_new%.ts"
echo %ORIG_NAME%
echo %TS_NAME%
:: Execute the FFMPEG command to convert byte-stream to Annex B format
::ffmpeg -y -i %ORIG_NAME% -c:a copy -c:v copy -bsf h264_mp4toannexb -f mpegts %TS_NAME%
ffmpeg -y -i %ORIG_NAME% -c:a copy -c:v copy -f mpegts %TS_NAME%
goto:eof
