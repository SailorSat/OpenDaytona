Attribute VB_Name = "videoMain"
Option Explicit

Private mRenderMode As Long

Public Sub videoRenderModeWrite(Address As Long, Data As Long, Length As Long)
  mRenderMode = Data And &H4&
End Sub

Public Function videoLumaRead(Address As Long, Length As Long) As Long
  Debug.Assert Length = 2
  If Address Mod 4 = 0 Then
    RtlMoveMemory videoLumaRead, RAM_12800000(Address \ 2&), 2
  Else
    videoLumaRead = 0
  End If
End Function

Public Sub videoLumaWrite(Address As Long, Data As Long, Length As Long)
  Debug.Assert Length = 2
  If Address Mod 4 = 0 Then
    Data = Data And &HFFFF&
    RtlMoveMemory RAM_12800000(Address \ 2&), Data, 2
  Else
    '
  End If
End Sub

Public Sub videoXHOutWrite(Address As Long, Data As Long, Length As Long)
  Data = CInt("&H" & Hex(Data))
  'todo later
End Sub

Public Sub videoXVOutWrite(Address As Long, Data As Long, Length As Long)
  Data = CInt("&H" & Hex(Data))
  'todo later
End Sub

