Attribute VB_Name = "ioMain"
Option Explicit

Public RAM_01C00000(0 To &HFFF&) As Byte

' 0x1C00040 - command flag? 1 = write to eeprom?, 3 = read from eeprom?
Public Sub ioTick()
  Call WriteO(1, &H1C00040, &H0&)
  Call WriteO(1, &H1C00042, &H40&)
End Sub
