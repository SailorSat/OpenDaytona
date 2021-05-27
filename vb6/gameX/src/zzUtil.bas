Attribute VB_Name = "zzUtil"
Option Explicit

Private OnBits(0 To 31) As Long

Public Function LShiftLong(ByVal Value As Long, ByVal Shift As Integer) As Long
  MakeOnBits
  If (Value And (2 ^ (31 - Shift))) Then GoTo OverFlow
  LShiftLong = ((Value And OnBits(31 - Shift)) * (2 ^ Shift))
  Exit Function
OverFlow:
  LShiftLong = ((Value And OnBits(31 - (Shift + 1))) * (2 ^ (Shift))) Or &H80000000
End Function

Public Function RShiftLong(ByVal Value As Long, ByVal Shift As Integer) As Long
  Dim hi As Long
  MakeOnBits
  If (Value And &H80000000) Then hi = &H40000000
  RShiftLong = (Value And &H7FFFFFFE) \ (2 ^ Shift)
  RShiftLong = (RShiftLong Or (hi \ (2 ^ (Shift - 1))))
End Function

Private Sub MakeOnBits()
  Dim j As Integer, v As Long
  For j = 0 To 30
    v = v + (2 ^ j)
    OnBits(j) = v
  Next j
  OnBits(j) = v + &H80000000
End Sub

Public Function LeadZero(Value As String, Length As Long) As String
  While Len(Value) < Length
    Value = "0" & Value
  Wend
  LeadZero = Value
End Function

