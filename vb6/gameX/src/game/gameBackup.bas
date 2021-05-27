Attribute VB_Name = "gameBackup"
Option Explicit

Public Sub x00028F40()
'; backup config check
  Dim ValueA As Long, ValueB As Long
  Call x00029228  '; copy io-config to backup-config
  
  If compare_header(&H1D00000, &H3C570) Then
    ' config1 header ok
    ' calculate config1 checksum
    ValueA = x00029798(&H1D0000A, &H1&, &H76&)
    ValueB = ReadO(2, &H1D00008)
    
    If ((ValueA And &HFFFF&) = ValueB) Then
      ' config1 checksum ok
      copy_config1_to_config2
    Else
      ' config1 checksum failed
      ' calculate config2 checksum
      ValueA = x00029798(&H1D0008A, &H1&, &H76&)
      ValueB = ReadO(2, &H1D00088)
      
      If ((ValueA And &HFFFF&) = ValueB) Then
        ' checksum2 ok
        copy_config2_to_config1
      Else
        ' checksum2 failed
        copy_default_to_config1
      End If
    End If
    
  Else
    ' config1 header failed, try config2 header
    ' calculate config1 checksum
    
    If compare_header(&H1D00080, &H3C570) Then
      ' config2 header ok
      ' calculate config2 checksum
      ValueA = x00029798(&H1D0008A, &H1&, &H76&)
      ValueB = ReadO(2, &H1D00088)
    
      If ((ValueA And &HFFFF&) = ValueB) Then
        ' checksum2 ok
        copy_config2_to_config1
      Else
        ' checksum2 failed
        copy_default_to_config1
      End If
    Else
      ' config2 header failed
      copy_default_to_config1
    End If
  End If
  
  ' copy backupram to nvram
  Call x000292e0

  ' copy config1 to ram
  Call WriteO(2, &H5FE5A8, ReadO(1, &H1D0000B))
  Call WriteO(2, &H5FE624, ReadO(1, &H1D0000C))
  
  Call WriteO(2, &H5FE630, ReadO(1, &H1D00019))
  Call WriteO(2, &H5FE602, ReadO(1, &H1D0001A))
  Call WriteO(2, &H5FE5BA, ReadO(1, &H1D0001B))
  Call WriteO(2, &H5FE600, ReadO(1, &H1D0001C))
  Call WriteO(2, &H5FE5BE, ReadO(1, &H1D0001D))
  Call WriteO(2, &H5FE62E, ReadO(1, &H1D0001E))
  Call WriteO(2, &H5FE5BC, ReadO(1, &H1D00020))
  
  ValueA = ReadO(1, &H1D00010)
  If ValueA = 26& Then
    Call WriteO(2, &H5FE130, 0)
  Else
    Call WriteO(2, &H5FE130, ReadO(1, &H1D00015))
  End If
End Sub

Private Sub copy_default_to_config1()
  '; copy 0x80 bytes from 0x23c570+ to 0x1d00000+
  RtlMoveMemory RAM_01D00000(&H0&), ROM_00000000(&H3C570), &H80&
End Sub

Private Sub copy_config1_to_config2()
  '; copy 0x80 bytes from 0x1d00000+ to 0x1d00080+
  RtlMoveMemory RAM_01D00000(&H80&), RAM_01D00000(&H0&), &H80&
End Sub

Private Sub copy_config2_to_config1()
  '; copy 0x80 bytes from 0x1d00080+ to 0x1d00000+
  RtlMoveMemory RAM_01D00000(&H0&), RAM_01D00000(&H80&), &H80&
End Sub

Private Function compare_header(src1 As Long, src2 As Long) As Boolean
  Dim ValueA As Long, ValueB As Long
  
  ValueA = ReadO(4, src1)
  ValueB = ReadO(4, src2)
  If ValueA <> ValueB Then
    compare_header = False
    Exit Function
  End If
  
  ValueA = ReadO(4, src1 + 4)
  ValueB = ReadO(4, src2 + 4)
  If ValueA <> ValueB Then
    compare_header = False
    Exit Function
  End If
  
  compare_header = True
End Function

Private Sub x00029228()
'; copy nvram to backup ram (128 bytes)
  Dim Index As Long, Source As Long, Destination As Long, Value As Long
  
  ' wait for io board ready
  While ReadO(1, &H1C00040) <> 0
    DoEvents
    ioTick
  Wend
  
  ' wait for io board ready
  While ReadO(1, &H1C00042) <> &H40&
    DoEvents
    ioTick
  Wend
  
  Call WriteO(1, &H1C00040, &H3&)
  
  ' wait for io board ready
  While ReadO(1, &H1C00040) <> 0
    DoEvents
    ioTick
  Wend
  
  Source = &H1C00200
  Destination = &H1D00000
  For Index = &H0& To &H7F&
    Call WriteO(1, Destination, ReadO(1, Source))
    Source = Source + 2
    Destination = Destination + 1
  Next
End Sub

Private Function x00029798(G0 As Long, G1 As Long, G2 As Long) As Long
  Dim G4 As Long, G5 As Long, G6 As Long, G7 As Long
'; calculate checksum (offset g0, step g1, len g2 -- returns g0
  G6 = G0
  G0 = 0
  G7 = &HFF&
  If G2 > 0 Then
    Do
      G5 = ReadO(1, G6)
      G4 = RShiftLong(G0, 8&)
      G4 = G4 Xor G5
      G4 = G4 And G7
      G5 = ReadO(2, &H3C5F0 + (G4 * 2&))
      G4 = LShiftLong(G0, 8&)
      G2 = G2 - 1
      G6 = G6 + G1
      G0 = G5 Xor G4
  Loop While G2 > 0
  End If
  x00029798 = G0
End Function

Private Function x000292e0()
  Dim Index As Long, Source As Long, Destination As Long, Value As Long
  
  Call WriteO(4, &H1D0007C, ReadO(4, &H1D0007C) + 1&) ' increase counter
  
  Value = x00029798(&H1D0000A, 1&, &H76)
  Call WriteO(2, &H1D00008, Value)
  
  ' wait for io board ready
  While (ReadO(1, &H1C00040) <> 0)
    DoEvents
    ioTick
  Wend
  
  Call WriteO(1, &H1C00040, 1&)
  ' wait for io board ready
  While (ReadO(1, &H1C00040) <> 0)
    DoEvents
    ioTick
  Wend
  
  Destination = &H1C00200
  Source = &H1D00000
  For Index = &H0& To &H7F&
    Call WriteO(1, Destination, ReadO(1, Source))
    Source = Source + 2
    Destination = Destination + 1
  Next

  ' wait for io board ready
  While (ReadO(1, &H1C00040) <> 0)
    DoEvents
    ioTick
  Wend

  Call WriteO(1, &H1C00040, 2&)
  ' wait for io board ready
  While (ReadO(1, &H1C00040) <> 0)
    DoEvents
    ioTick
  Wend

  ' wait for io board ready
  While ReadO(1, &H1C00042) <> &H40&
    DoEvents
    ioTick
  Wend
  
  RtlMoveMemory RAM_01D00000(&H80&), RAM_01D00000(&H0&), &H80&
End Function

Public Sub x00029560()
' 00029560 - backup times check
  Dim ValueA As Long, ValueB As Long
  ValueA = x00029798(&H1D00106, &H1&, &H7A&)
  ValueB = ReadO(2, &H1D00104)
  If ((ValueA And &HFFFF&) = ValueB) Then
    ' 0002963C - checksum1 ok
    copy_times1_to_times2
  Else
    ' 0002958C - checksum1 failed
    ValueA = x00029798(&H1D00186, &H1&, &H7A&)
    ValueB = ReadO(2, &H1D00184)
    If ((ValueA And &HFFFF&) = ValueB) Then
      ' 000295B8 - checksum2 ok
      copy_times2_to_times1
    Else
      ' 000295B0 - checksum2 failed
      x000296d0
    End If
  End If
  
  ' 000296BC
  Call WriteO(4, &H5FE620, ReadO(4, &H1D00108))
End Sub

Private Sub copy_times1_to_times2()
  '; copy 0x80 bytes from 0x1d00100+ to 0x1d00180+
  RtlMoveMemory RAM_01D00000(&H180&), RAM_01D00000(&H100&), &H80&
End Sub

Private Sub copy_times2_to_times1()
  '; copy 0x80 bytes from 0x1d00180+ to 0x1d00100+
  RtlMoveMemory RAM_01D00000(&H100&), RAM_01D00000(&H180&), &H80&
End Sub

Public Sub x000296d0()
' zero backup times
  RtlZeroMemory RAM_01D00000(&H100&), &H80&
  Call x000296F0
End Sub

Public Sub x000296F0()
  Dim ValueA As Long
  ValueA = x00029798(&H1D00106, &H1&, &H7A&)
  Call WriteO(2, &H1D00104, ValueA)
  copy_times2_to_times1
End Sub

Public Sub x00029800()
  Dim Value4 As Long, Value5 As Long, Value6 As Long, Value7 As Long, Value8 As Long
  Value4 = ReadO(1, &H1D00014)
  Value7 = ReadO(1, &H1D00013)
  Value6 = ReadO(1, &H1D00012)
  
  If (1 <> Value4) Then
    ' 0002983C - not freeplay
    Call WriteO(1, &H5FE040, 0&)
    If (Value6 <> Value7) Then
      ' 00029858 unequal chutes
      Call WriteO(1, &H5FE041, 0&)
    Else
      ' 00029848 equal chutes
      Call WriteO(1, &H5FE041, 1&)
    End If
  Else
    ' 0002982C - freeplay
    Call WriteO(1, &H5FE040, 1&)
  End If
  
  Call WriteO(4, &H5FE030, 0&)
  Call WriteO(4, &H5FE038, 0&)
  
  Call WriteO(1, &H5FE033, Value6)
  Call WriteO(1, &H5FE03B, Value7)
  
  Value4 = ReadO(1, &H5FE034)
  Value5 = ReadO(1, &H5FE03C)
  
  Value4 = Value4 Or 1
  Value5 = Value5 Or 2
  
  Call WriteO(1, &H5FE034, Value4)
  Call WriteO(1, &H5FE03C, Value5)
  
  Call WriteO(1, &H5FE043, 0)
  Call WriteO(1, &H5FE044, 0)
  
  Call WriteO(4, &H5FE020, ReadO(2, &H1D00128))
  Call WriteO(4, &H5FE024, ReadO(2, &H1D0012A))
  Call WriteO(4, &H5FE028, ReadO(2, &H1D0012C))
  Call WriteO(4, &H5FE02C, ReadO(2, &H1D0012E))
End Sub
