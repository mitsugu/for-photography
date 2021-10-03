echo off
setlocal enabledelayedexpansion

set filename=%1

for /f "usebackq delims=" %%a in (`echo %3`) do set tmp=%%a
set copyright=!tmp:~1,-1!
set font=C:\Windows\Fonts\UdDigiKyokashoN-B.ttc
for /f "usebackq delims=" %%a in (`exiftool -s -DateTimeOriginal -T %filename%`) do set date=%%a
for /f "usebackq delims=" %%a in (`exiftool -s -Make -T %filename%`) do set make=%%a
for /f "usebackq delims=" %%a in (`exiftool -s -Model -T %filename%`) do set camera=%%a
for /f "usebackq delims=" %%a in (`exiftool -s -LensModel -T %filename%`) do set lens=%%a
for /f "usebackq delims=" %%a in (`exiftool -s -ISO -T %filename%`) do set iso=%%a
for /f "usebackq delims=" %%a in (`exiftool -s -FNumber -T %filename%`) do set fnumber=%%a
for /f "usebackq delims=" %%a in (`exiftool -s -ShutterSpeed -T %filename%`) do set ss=%%a
for /f "usebackq delims=" %%a in (`exiftool -s -Software -T %filename%`) do set soft=%%a

rem CAMEDIA
rem size="512x96"
rem fontsize=40

rem KYOCERA URBANO
rem size="1024x256"
rem fontsize=80

rem Huawei
rem size="872x192"
rem fontsize=80

rem PENTAX *ist DL2
rem size="1024x192"
rem fontsize=64

rem PENTAX KP
set size=1344x786
set fontsize=64

magick convert ^
  -font %font% ^
  -size %size% ^
  -splice 32x64 ^
  -fill #FFFFFF ^
  -background none ^
  -pointsize %fontsize% ^
  label:"\nCopyright : %copyright%\nDate and Time : %date%\nMaker : %make%\nCamera : %camera%\nLens : %lens%\nISO : %iso%\nF Number : %fnumber%\nShutter Speed : %ss%\nSoftware : %soft%" ^
  hoge.png

magick convert %filename% hoge.png -gravity %2 -compose over -composite %filename%.jpg
del hoge.png
endlocal
echo on
