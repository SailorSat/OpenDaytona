Attribute VB_Name = "gameMemory"
Option Explicit

Public ROM_00000000(0 To &H3FFFF) As Byte     ' main rom

Public RAM_00200000(0 To &H1FFFF) As Byte     ' shadow ram
'      ROM_00220000(0 to &H1FFFF) As Byte     ' shadow rom

Public RAM_00500000(0 To &HFFFFF) As Byte     ' main ram

Public RAM_01D00000(0 To &H3FFF&) As Byte     ' backup ram

Public ROM_02000000(0 To &H8FFFFF) As Byte    ' main data

Public Function ReadO(Bytes As Long, Address As Long) As Long
  ReadO = 0
  Select Case Address
    Case 0 To &H3FFFF
      ' main rom
      RtlMoveMemory ReadO, ROM_00000000(Address And &H3FFFF), Bytes
      
    Case &H200000 To &H21FFFF
      ' shadow ram
      RtlMoveMemory ReadO, RAM_00200000(Address And &H1FFFF), Bytes
      
    Case &H220000 To &H23FFFF
      ' shadow rom (mirror of main rom)
      RtlMoveMemory ReadO, ROM_00000000(Address And &H3FFFF), Bytes
    
    Case &H500000 To &H5FFFFF
      ' main ram
      RtlMoveMemory ReadO, RAM_00500000(Address And &H3FFFF), Bytes

    Case &H900000 To &H91FFFF
      RtlMoveMemory ReadO, RAM_00900000(Address And &H1FFFF), Bytes
      
    Case &HE00000 To &HE00037
      RtlMoveMemory ReadO, RAM_00E00000(Address And &H37&), Bytes
      Stop
    
    Case &H1C00000 To &H1C00FFF
      RtlMoveMemory ReadO, RAM_01C00000(Address And &HFFF&), Bytes
      ' io_share_r / io_share_w
    
    Case &H1D00000 To &H1D03FFF
      ' backup_share_r / backup_share_w
      RtlMoveMemory ReadO, RAM_01D00000(Address And &H3FFF&), Bytes

'    Case &H2000000 To &H3FFFFFF
'      ' main_data_r
  
    Case Else
      Select Case Bytes
        Case 1
          ReadO = &HFF&
        Case 2
          ReadO = &HFFFF&
        Case 4
          ReadO = &HFFFFFFFF
      End Select
      Debug.Print "unhandled read", LeadZero(Hex(Address), 8), LeadZero(Hex(ReadO), Bytes * 2)
      Stop
  End Select
End Function


Public Sub WriteO(Bytes As Long, Address As Long, Value As Long)
  Select Case Address
    Case 0 To &H3FFFF
      Stop  ' writing to rom?
      
    Case &H200000 To &H21FFFF
      ' shadow ram
      RtlMoveMemory RAM_00200000(Address And &H1FFFF), Value, Bytes

    Case &H220000 To &H23FFFF
      Stop  ' writing to rom?
    
    Case &H500000 To &H5FFFFF
      ' work ram
      RtlMoveMemory RAM_00500000(Address And &H3FFFF), Value, Bytes
    
    Case &H900000 To &H91FFFF
      ' buffer ram
      RtlMoveMemory RAM_00900000(Address And &H1FFFF), Value, Bytes
    
    Case &HE80000
      ' irq stuff
      irq_ack_w Value
    
    Case &HE80004
      ' irq stuff
      irq_enable_w Value
      
    Case &HF80000
      ' this is unhandled in MAME too
    
    Case &H1040000
      xhout_w Bytes, 0&, Value
    
    Case &H1060000
      xvout_w Bytes, 0&, Value
    
    Case &H1C00000 To &H1C00FFF
      ' io shared ram
      RtlMoveMemory RAM_01C00000(Address And &HFFF&), Value, Bytes
      
    Case &H1D00000 To &H1D03FFF
      ' backup ram
      RtlMoveMemory RAM_01D00000(Address And &H3FFF&), Value, Bytes
      
    Case &H10000000 To &H101FFFFF
      ' tgp_render_mode_r / tgp_render_mode_w
      tgp_render_mode_w Bytes, Address And &H1FFFFF, Value
      
    Case &H12800000 To &H1281FFFF
      ' luma ram
      luma_w Bytes, Address And &H1FFFF, Value
      
    Case Else
      Debug.Print "unhandled write", LeadZero(Hex(Address), 8), LeadZero(Hex(Value), Bytes * 2)
      Stop
  End Select
End Sub


Public Function ReadI(Bytes As Long, Address As Long) As Long
  Dim Value As Long
  Value = ReadO(Bytes, Address)
  
  Select Case Bytes
    Case 1
      If Value And &H80& Then
        ReadI = &HFFFFFF80 Or (Value And &H7F)
      Else
        ReadI = (Value And &H7F&)
      End If
      
    Case 2
      If Value And &H8000& Then
        ReadI = &HFFFF8000 Or (Value And &H7FFF&)
      Else
        ReadI = (Value And &H7FFF&)
      End If
    
    Case 4
      ReadI = Value
  End Select
End Function


Public Sub WriteI(Bytes As Long, Address As Long, Value As Long)
  Dim ValueI As Long
  Select Case Bytes
    Case 1
      If Value < 0 Then
        ValueI = &H80& Or (Value And &H7F&)
      Else
        ValueI = (Value And &H7F&)
      End If
      
    Case 2
      If Value < 0 Then
        ValueI = &H8000& Or (Value And &H7FFF&)
      Else
        ValueI = (Value And &H7FFF&)
      End If
      
    Case 4
      ValueI = Value
  End Select
  
  WriteO Bytes, Address, ValueI
End Sub
