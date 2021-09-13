# Use text-to-speech to speak a greeting, the time and date.
$Now = Get-Date
if ($Now -lt (Get-Date -Hour 12 -Minute 00)) {
    $TimeOfDay = "morning"
} elseif ($Now -lt (Get-Date -Hour 18 -Minute 00)) {
    $TimeOfDay = "afternoon"
} else {
    $TimeOfDay = "evening"
}
# https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings
$TimeDateString = (Get-Date).ToString("h:mm tt, on dddd MMMM d yyyy")
try {
    Add-Type -AssemblyName System.Speech
    $SpeechSynthesizer = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
    $SpeechSynthesizer.Speak("Good $TimeOfDay , it is $TimeDateString")
    $SpeechSynthesizer.Dispose()
} catch {
    Write-Output "An error occured using the Speech system: $_"
}
