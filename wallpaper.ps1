cd $env:USERPROFILE
Invoke-WebRequest "https://ih1.redbubble.net/image.2675223293.8921/flat,750x,075,f-pad,750x1000,f8f8f8.jpg" -OutFile test.jpg;
Start-Sleep -Seconds 5

While ($true)
{
$imgPath="$env:USERPROFILE\test.jpg"
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@

add-type $code 

#Apply the Change on the system 
[Win32.Wallpaper]::SetWallpaper($imgPath)

  Start-Sleep -Seconds 3
}
