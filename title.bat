rem echo off
rem
rem Usage :
rem   wm filename location
rem
rem     filename : file Name
rem     location : Location to display Exif data
rem                Specify the argument of ImageMagick's gravity option.
rem                NorthWest,North,NorthEast,East,SouthEast,South,SouthWest
rem
for /f "usebackq delims=" %%a in (`echo %3`) do set tmp=%%a
set copyright= %tmp:~1,-1%
for /f "usebackq delims=" %%a in (`echo %4`) do set tmp=%%a
set title=%tmp:~1,-1%
rem set font=C:\Windows\Fonts\Meiryo.ttc
set font=C:\Windows\Fonts\UdDigiKyokashoN-B.ttc

rem CAMEDIA
rem size="512x96"
rem fontsize=40

rem KYOCERA URBANO
rem size="1024x224"
rem fontsize=80

rem Huawei
rem size="872x192"
rem fontsize=80

rem PENTAX *ist DL2
rem size="1024x192"
rem fontsize=64

rem PENTAX KP
set size=1640x384
set fontsize=112

magick convert ^
  -font %font% ^
  -size %size% ^
  -splice 32x64 ^
  -fill #FFFFFF ^
  -background none ^
  -pointsize %fontsize% ^
  label:"Copyright : %copyright%\nTitle : %title%" ^
  hoge.png

magick convert %1 hoge.png -gravity %2 -compose over -composite %1.jpg
del hoge.png
