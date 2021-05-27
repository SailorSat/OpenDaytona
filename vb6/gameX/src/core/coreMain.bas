Attribute VB_Name = "coreMain"
Option Explicit

Public RAM_00E00000(0 To &H37&) As Byte       ' CPU control (wait-states)

Public Sub Main()
  Game_Main
End Sub

