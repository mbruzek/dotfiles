$quotes = @(
  "You will be assimilated.  Resistance is futile."
  "We are the Borg, Lower your shields and surrender your ships. We will add your biological and technical distinctiveness to our own. Your culture will adapt to service us. Resistance is futile."
  "We are the Borg. Existance as you know it, is over. We will add your biological and technological distinctiveness to our own. Resistance is futile."
  "We are the Borg. You will be assimilated. Resistance is futile."
  "By assimilating other races into our collective, we are bringing them closer to perfection."
  "We used to be exactly like them. Flawed. Weak. Organic. But we evolved to include the synthetic. Now we use both to attain perfection. Your goal should be the same as ours."
  "I am the beginning, the end,  the one who is many. I am the Borg."
  "Brave words. I've heard them before, from thousands of species across thousands of worlds, since long before you were created. But, now they are all Borg."
  "You are an imperfect being, created by an imperfect being. Finding your weakness is only a matter of time."
)
try {
    Add-Type -AssemblyName System.Speech
    $SpeechSynthesizer = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
    $SpeechSynthesizer.Speak(($quotes|Get-Random))
    $SpeechSynthesizer.Dispose()
catch {
  Write-Output "An error occured using the Speech system: $_"
}
