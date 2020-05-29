Attribute VB_Name = "modAPI"
Option Explicit

Public Declare Sub RtlMoveMemory Lib "kernel32" (Destination As Any, Source As Any, ByVal Length As Long)

Public Function RShift(Value As Long, Bits As Long) As Long
  RShift = Value \ (2 ^ Bits)
End Function

Public Function LShift(Value As Long, Bits As Long) As Long
  If Bits = 24 And Value > 127 Then
    LShift = CLng("&H" & Hex(Value) & "000000")
  Else
    LShift = Value * (2 ^ Bits)
  End If
End Function

Public Function LeadZero(Value As String, Length As Long) As String
  LeadZero = String(Length - Len(Value), "0") & Value
End Function
