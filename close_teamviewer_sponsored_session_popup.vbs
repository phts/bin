Set sh = CreateObject("WScript.Shell")

For counter = 1 To 10
  activated = sh.AppActivate("Спонсируемый сеанс")

  If activated = True Then
    For t = 1 To 2
      sh.SendKeys "{TAB}"
    Next
    sh.SendKeys " "
    WScript.Quit
  End If
  WScript.Sleep 1000
Next
