Invoke-WebRequest "https://ih1.redbubble.net/image.2675223293.8921/flat,750x,075,f-pad,750x1000,f8f8f8.jpg" -OutFile test.jpg;
Start-Sleep -Seconds 1
Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value "%USERPROFILE%\test.jpg";
While ($true)
{
  rundll32.exe user32.dll, UpdatePerUserSystemParameters;
  Start-Sleep -Seconds 3

}

