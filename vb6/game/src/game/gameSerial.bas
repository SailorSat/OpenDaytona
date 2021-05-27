Attribute VB_Name = "gameSerial"
Option Explicit

Public Function gameSerialRead(Address As Long, Length As Long) As Long
  Debug.Assert Length = 2
  Select Case Address
    Case 0
      ' data
      
    Case 2
      ' status
    
    Case Else
      gameSerialRead = &HFFFFFFFF
  End Select
End Function

Public Sub gameSerialWrite(Address As Long, Data As Long, Length As Long)
  Debug.Assert Length = 2
  Select Case Address
    Case 0
      ' data
    
    Case 2
      ' control
    
  End Select
End Sub
