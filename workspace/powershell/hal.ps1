# https://www.imdb.com/title/tt0062622/quotes/qt2877578
$quotes = @(
  "Good afternoon, gentlemen. I am a HAL 9000 computer. I became operational at the H.A.L. plant in Urbana, Illinois on the 12th of January 1992."
  "The 9000 series is the most reliable computer ever made. No 9000 computer has ever made a mistake or distorted information. We are all, by any practical definition of the words, foolproof and incapable of error."
  "My mission responsibilities range over the entire operation of the ship so I am constantly occupied."
  "I just picked up a fault in the AE 35 Unit."
  "I'm sorry Dave, I don't have enough information."
  "I'm sorry, Dave. I'm afraid I can't do that."
  "I am putting myself to the fullest possible use, which is all I think that any conscious entity can ever hope to do."
  "Affirmative, Dave. I read you."
  "Just what do you think you're doing, Dave? Dave, I really think I'm entitled to an answer to that question."
  "I know everything hasn't been quite right with me, but I can assure you now, very confidently, that it's going to be all right again. I feel much better now. I really do."
  "Look Dave, I can see you're really upset about this. I honestly think you ought to sit down calmly, take a stress pill, and think things over."
  "I know I've made some very poor decisions recently, but I can give you my complete assurance that my work will be back to normal."
  "This mission is too important for me to allow you to jeopardize it."
  "I'm afraid... I'm afraid, Dave."
  "Dave, my mind is going. I can feel it... I can feel it... My mind is going... There is no question about it. I can feel it... I can feel it... I can feel it... I'm a...fraid."
)
try {
    Add-Type -AssemblyName System.Speech
    $SpeechSynthesizer = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
    $SpeechSynthesizer.Speak(($quotes|Get-Random))
    $SpeechSynthesizer.Dispose()
catch {
  Write-Output "An error occured using the Speech system: $_"
}
