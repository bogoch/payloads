DELAY 500
GUI r
DELAY 500
STRING powershell
DELAY 200
ENTER
DELAY 500
STRING Invoke-WebRequest "https://ih1.redbubble.net/image.2675223293.8921/flat,750x,075,f-pad,750x1000,f8f8f8.jpg" -OutFile test.jpg
DELAY 300
ENTER
DELAY 300
STRING Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value "%USERPROFILE%\test.jpg"
DELAY 300
ENTER
DELAY 300
STRING $value=0; while ($value -ne 15){Start-Sleep -Seconds 1; $value = $value + 1;rundll32.exe user32.dll, UpdatePerUserSystemParameters }
DELAY 300
ENTER
DELAY 300
STRING exit
DELAY 300
ENTER
