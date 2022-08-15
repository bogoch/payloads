cd $env:USERPROFILE
Invoke-WebRequest "https://ih1.redbubble.net/image.2675223293.8921/flat,750x,075,f-pad,750x1000,f8f8f8.jpg" -OutFile test.jpg;
Start-Sleep -Seconds 1


while ($true)
{
  Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value "$env:USERPROFILE\test.jpg";
  $counter = 0;
  While ($counter -eq 15)
  {
    RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True;
    Start-Sleep -Seconds 3
    $counter += 1;
  }
}
