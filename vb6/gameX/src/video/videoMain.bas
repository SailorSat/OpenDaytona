Attribute VB_Name = "videoMain"
Option Explicit

' -= video related stuff =-
Public RAM_01000000(0 To &HFFFF&) As Byte
' tile_ram
' 0x01000000 - 0x01001FFF = foreground 1
' 0x01002000 - 0x01003FFF = foreground 2
' 0x01004000 - 0x01005FFF = background 1
' 0x01006000 - 0x01007FFF = background 2
' 0x0100A000              = scroll register (0-3 = h, 4-7 = v)
' 0x0100C000              = mask register
' 0x0100D000              = mask register?

Public RAM_01080000(0 To &H7FFFF) As Byte
' char_ram

Public RAM_01800000(0 To &H3FFF&) As Byte
' palette ram

Public RAM_01810000(0 To &HBFFF&) As Byte
' color xlat ram

Public RAM_12000000(0 To &H1FFFFF) As Byte
' texture ram 0

Public RAM_12400000(0 To &H1FFFFF) As Byte
' texture ram 1

Public RAM_12800000(0 To &H1FFFF) As Byte
' luma_ram


Public Function tile_r(Bytes As Long, Offset As Long) As Long
  RtlMoveMemory tile_r, RAM_01000000(Offset), Bytes
End Function

Public Sub tile_w(Bytes As Long, Offset As Long, Data As Long)
  RtlMoveMemory RAM_01000000(Offset), Data, Bytes
End Sub


Public Function char_r(Bytes As Long, Offset As Long) As Long
  RtlMoveMemory char_r, RAM_01080000(Offset), Bytes
End Function

Public Sub char_w(Bytes As Long, Offset As Long, Data As Long)
  RtlMoveMemory RAM_01080000(Offset), Data, Bytes
End Sub


Public Function palette_r(Bytes As Long, Offset As Long) As Long
  RtlMoveMemory palette_r, RAM_01800000(Offset), Bytes
End Function

Public Sub palette_w(Bytes As Long, Offset As Long, Data As Long)
  RtlMoveMemory RAM_01800000(Offset), Data, Bytes
End Sub


Public Function colorxlat_r(Bytes As Long, Offset As Long) As Long
  RtlMoveMemory colorxlat_r, RAM_01810000(Offset), Bytes
End Function

Public Sub colorxlat_w(Bytes As Long, Offset As Long, Data As Long)
  RtlMoveMemory RAM_01810000(Offset), Data, Bytes
End Sub


Public Sub tex0_w(Bytes As Long, Offset As Long, Data As Long)
  RtlMoveMemory RAM_12000000(Offset), Data, Bytes
End Sub


Public Sub tex1_w(Bytes As Long, Offset As Long, Data As Long)
  RtlMoveMemory RAM_12400000(Offset), Data, Bytes
End Sub


Public Function luma_r(Bytes As Long, Offset As Long) As Long
  RtlMoveMemory luma_r, RAM_12800000(Offset), Bytes
End Function

Public Sub luma_w(Bytes As Long, Offset As Long, Data As Long)
  RtlMoveMemory RAM_12800000(Offset), Data, Bytes
End Sub

Public Sub xhout_w(Bytes As Long, Address As Long, Value As Long)
  ' this does nothing right now.
End Sub

Public Sub xvout_w(Bytes As Long, Address As Long, Value As Long)
  ' this does nothing right now.
End Sub

Public Sub tgp_render_mode_w(Bytes As Long, Address As Long, Value As Long)
  ' this does nothing right now.
End Sub

