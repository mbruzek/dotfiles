# A Powershell script to use the text-to-speech capability.
$TimeString = (Get-Date).ToString("h:mm tt")
try {
    Add-Type -AssemblyName System.Speech
    $SpeechSynthesizer = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
    # Speak the current time.
    $SpeechSynthesizer.Speak("The time is $TimeString")
    $SpeechSynthesizer.Dispose()
catch {
  Write-Output "An error occured using the Speech system: $_"
}
