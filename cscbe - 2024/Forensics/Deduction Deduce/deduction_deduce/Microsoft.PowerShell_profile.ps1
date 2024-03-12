function CustomizeConsole {
  Set-PSReadlineOption -Colors @{
  Command            = "Red"
  Number             = "`e[41;30m"
  Member             = 'DarkGray'
  Operator           = 'DarkGray'
  Type               = 'DarkGray'
  Variable           = 'DarkGreen'
  Parameter          = 'Red'
  ContinuationPrompt = 'DarkGray'
  Default            = "`e[32;47m"
  }
  $host.UI.RawUI.BackgroundColor = "Green"
  $host.UI.RawUI.ForegroundColor = "Black"
  Clear-Host
}
CustomizeConsole