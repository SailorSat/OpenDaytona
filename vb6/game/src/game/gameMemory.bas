Attribute VB_Name = "gameMemory"
Option Explicit

' -= memory access (from i960) =-

Public ROM_00000000(0 To &H3FFFF) As Byte     ' game rom
Public RAM_00E00000(0 To &H37&) As Byte       ' CPU control (wait-states)
Public RAM_00200000(0 To &H1FFFF) As Byte     ' shadow ram
'      ROM_00220000(0 to &H1FFFF) As Byte     ' shadow rom
Public RAM_00500000(0 To &HFFFFF) As Byte     ' game ram
Public RAM_01C00000(0 To &HFFF&) As Byte      ' io shared ram
Public RAM_01D00000(0 To &H3FFF&) As Byte     ' backup ram
Public RAM_01000000(0 To &HFFFF&) As Byte     ' tile ram
Public RAM_01800000(0 To &H3FFF&) As Byte     ' palette ram
Public RAM_01810000(0 To &HCFFF&) As Byte     ' color translation ram
Public ROM_02000000(0 To &H8FFFFF) As Byte    ' main data
Public RAM_12800000(0 To &HFFFF&) As Byte     ' polygon "luma" ram

Private Function ReadOX(Address As Long, Length As Long) As Long
  Select Case Address
    Case 0 To &H3FFFF             ' main rom
      RtlMoveMemory ReadOX, ROM_00000000(Address And &H3FFFF), Length
      
    Case &H200000 To &H21FFFF     ' shadow ram
      RtlMoveMemory ReadOX, RAM_00200000(Address And &H1FFFF), Length
      
    Case &H220000 To &H23FFFF     ' shadow rom
      RtlMoveMemory ReadOX, ROM_00000000(Address And &H3FFFF), Length
    
    Case &H500000 To &H5FFFFF     ' main ram
      RtlMoveMemory ReadOX, RAM_00500000(Address And &HFFFFF), Length
    
    Case &H1C00000 To &H1C00FFF   ' io shared ram
      RtlMoveMemory ReadOX, RAM_01C00000(Address And &HFFF&), Length
    
    Case &H1C80000 To &H1C80003   ' serial (i8251)
      ReadOX = gameSerialRead(Address And &H3, Length)
    
    Case &H1D00000 To &H1D03FFF   ' backup ram
      RtlMoveMemory ReadOX, RAM_01D00000(Address And &H3FFF&), Length

    Case &H2000000 To &H28FFFFF   ' main data
      RtlMoveMemory ReadOX, ROM_02000000(Address And &H8FFFFF), Length
      
    Case &H2900000 To &H3FFFFFF   ' main data (cont.)
      Stop
  
    Case Else
      Select Case Length
        Case 1
          ReadOX = &HFF&
        Case 2
          ReadOX = &HFFFF&
        Case 4
          ReadOX = &HFFFFFFFF
      End Select
      Debug.Print "unhandled ReadOX", LeadZero(Hex(Address), 8), LeadZero(Hex(ReadOX), Length * 2)
      Stop
  End Select
End Function

Private Sub WriteOX(Address As Long, Data As Long, Length As Long)
  Select Case Address
    Case 0 To &H3FFFF             ' main rom
      Stop ' writing to rom?
      
    Case &H200000 To &H21FFFF     ' shadow ram
      RtlMoveMemory RAM_00200000(Address And &H1FFFF), Data, Length

    Case &H220000 To &H23FFFF     ' shadow rom
      Stop ' writing to rom?

    Case &H500000 To &H5FFFFF     ' work ram
      RtlMoveMemory RAM_00500000(Address And &HFFFFF), Data, Length
  
    Case &HE00000 To &HE00037     ' cpu control
      RtlMoveMemory RAM_00E00000(Address And &H37&), Data, Length
      
    Case &HF80000 To &HF80003     ' unknown
      ' unmapped in MAME
    
    Case &H1000000 To &H100FFFF   ' tile ram
      RtlMoveMemory RAM_01000000(Address And &HFFFF&), Data, Length
    
    Case &H1800000 To &H1803FFF   ' palette ram
      RtlMoveMemory RAM_01800000(Address And &H3FFF&), Data, Length
    
    Case &H1810000 To &H181BFFF   ' color translation ram
      RtlMoveMemory RAM_01810000(Address And &HCFFF&), Data, Length
    
    Case &H1040000 To &H1040001   ' hsync register
      videoXHOutWrite Address, Data, Length
    
    Case &H1060000 To &H1060001   ' vsync register
      videoXVOutWrite Address, Data, Length
    
    Case &H1C00000 To &H1C00FFF   ' io shared ram
      RtlMoveMemory RAM_01C00000(Address And &HFFF&), Data, Length
      
    Case &H1C80000 To &H1C80003   ' serial (i8251)
      gameSerialWrite Address And &H3, Data, Length
  
    Case &H1D00000 To &H1D03FFF   ' backup ram
      RtlMoveMemory RAM_01D00000(Address And &H3FFF&), Data, Length
      
    Case &H2000000 To &H3FFFFFF   ' main data
      Stop ' writing to rom?
  
    Case &H10000000 To &H10000001 ' video render mode
      videoRenderModeWrite Address And &H1&, Data, Length
      
    Case &H12800000 To &H1281FFFF ' polygon "luma" ram
      videoLumaWrite Address And &H1FFFF, Data, Length
  
    Case Else
      Debug.Print "unhandled WriteOX", LeadZero(Hex(Address), 8), LeadZero(Hex(Data), Length * 2), Length
      Stop
  End Select
End Sub

Private Function ReadIX(Address As Long, Length As Long) As Long
  Dim Data As Long
  Data = ReadOX(Address, Length)
  
  Select Case Length
    Case 1
      If Data And &H80& Then
        ReadIX = &HFFFFFF80 Or (Data And &H7F)
      Else
        ReadIX = (Data And &H7F&)
      End If
      
    Case 2
      If Data And &H8000& Then
        ReadIX = &HFFFF8000 Or (Data And &H7FFF&)
      Else
        ReadIX = (Data And &H7FFF&)
      End If
    
    Case 4
      ReadIX = Data
  End Select
End Function

Public Function ReadO1(Address As Long) As Long
  ReadO1 = ReadOX(Address, 1)
End Function

Public Function ReadO2(Address As Long) As Long
  ReadO2 = ReadOX(Address, 2)
End Function

Public Function Read4(Address As Long) As Long
  Read4 = ReadOX(Address, 4)
End Function

Public Function ReadI1(Address As Long) As Long
  ReadI1 = ReadIX(Address, 1)
End Function

Public Function ReadI2(Address As Long) As Long
  ReadI2 = ReadIX(Address, 2)
End Function

Private Sub WriteIX(Address As Long, Data As Long, Length As Long)
  Dim DataI As Long
  Select Case Length
    Case 1
      If Data < 0 Then
        DataI = &H80& Or (Data And &H7F&)
      Else
        DataI = (Data And &H7F&)
      End If
      
    Case 2
      If Data < 0 Then
        DataI = &H8000& Or (Data And &H7FFF&)
      Else
        DataI = (Data And &H7FFF&)
      End If
      
    Case 4
      DataI = Data
  End Select
  
  WriteOX Address, DataI, Length
End Sub

Public Sub WriteO1(Address As Long, Data As Long)
  WriteOX Address, Data, 1
End Sub

Public Sub WriteO2(Address As Long, Data As Long)
  WriteOX Address, Data, 2
End Sub

Public Sub Write4(Address As Long, Data As Long)
  WriteOX Address, Data, 4
End Sub

Public Sub WriteI1(Address As Long, Data As Long)
  WriteIX Address, Data, 1
End Sub

Public Sub WriteI2(Address As Long, Data As Long)
  WriteIX Address, Data, 2
End Sub
