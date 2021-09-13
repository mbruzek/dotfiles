# A Powershell script to use the text-to-speech capability.
try {
    Add-Type -AssemblyName System.Speech
    $SpeechSynthesizer = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
    # Speak all the agruments passed to this script.
    $SpeechSynthesizer.Speak($args)
    $SpeechSynthesizer.Dispose()
catch {
    Write-Output "An error occurred with the Speech system: $_"
}
