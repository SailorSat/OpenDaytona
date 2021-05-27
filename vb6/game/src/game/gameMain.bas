Attribute VB_Name = "gameMain"
Option Explicit

Public G0 As Long, G1 As Long, G2 As Long, G3 As Long, G4 As Long, G5 As Long, G6 As Long, G7 As Long, G8 As Long, G9 As Long, G10 As Long, G11 As Long, G12 As Long, G13 As Long, G14 As Long

Public Sub Game_Main()
  Open App.Path & "\..\..\rom\rom_code.bin" For Binary As #1
    Get #1, , ROM_00000000
  Close #1

  Open App.Path & "\..\..\rom\rom_data.bin" For Binary As #1
    Get #1, , ROM_02000000
  Close #1

  x00000860
End Sub

Private Sub x00000860()
  Dim R3 As Long, R4 As Long, R5 As Long, R6 As Long, R7 As Long, R8 As Long, R9 As Long, R10 As Long, R11 As Long, R12 As Long, R13 As Long, R14 As Long, R15 As Long

' 00000860; MAIN: copy 0x38 bytes from 0xc90+ to 0xe00000+ (cpu control / wait states)
  'RtlMoveMemory RAM_00E00000(0), ROM_00000000(&HC90&), &H38&
  G0 = &HE00000
  G1 = &HC90&
  G3 = &HFFFFFFFF ' 0 - 1
  Do
    G2 = Read4(G1)
    If (G2 = G3) Then Exit Do
    Write4 G0, G2
    G0 = G0 + 4
    G1 = G1 + 4
  Loop
  
' 00000890; MAIN: burst copy 0x20000 bytes from 0x0+ to 0x200000+
  'RtlMoveMemory RAM_00200000(0), ROM_00000000(0), &H20000
  G0 = &H20000 ' ShiftL(1, 17)
  G1 = &H0&
  G2 = &H200000
  G4 = &H0&
  x00000910 G0, G1, G2, G4
  
' 000008A8; MAIN: f80000=0x3 (unmapped in MAME)
  Write4 &HF80000, 3
  
' 000008B4; MAIN: burst copy 0x400 bytes from 0x2802040+ to 0x5ff000+ (interupt vector table)
  G0 = &H400&
  G1 = &H2802040
  G2 = &H5FF000
  G4 = &H0&
  x00000910 G0, G1, G2, G4
  
' 000008D0; MAIN: burst copy 0xb0 bytes from 0xc0 to 0x5ff400 (prcb data)
  G0 = &HB0&
  G1 = &HC0&
  G2 = &H5FF400
  G4 = &H0&
  x00000910 G0, G1, G2, G4
  
' 000008EC; MAIN: store pointer to interupt vector table in prcb data
  Write4 G2 + &H14, &H5FF000
  
' 000008F8; MAIN: reset game
  G5 = &HFF000010
  G6 = &HC80&
  ' synmovq g5, g6
  
' 00000924; MAIN: init serial 00,00,00,40,4e
  WriteO2 &H1C80002, &H0&
  x00000BDC
  WriteO2 &H1C80002, &H0&
  x00000BDC
  WriteO2 &H1C80002, &H0&
  x00000BDC
  WriteO2 &H1C80002, &H40&
  x00000BDC
  WriteO2 &H1C80002, &H4E&
  
' 0000095C; init io ports
  x0001E3B8
  
' 00000960; MAIN: config render mode (non-test, 60 Hz)
  WriteO2 &H10000000, &H4&
  
' 00000970; call to ret
  x00001038
  
' 00000974; MAIN: init luma ram
  R4 = &H12800000
  R5 = &H1&
  R6 = &H80& ' ShiftL(1,7)
  Do
    R7 = ShiftR(R5, 1)
    WriteO2 R4, R7
    R4 = R4 + 2
    R5 = R5 + 1
    R6 = R6 - 1
  Loop While (R6 > 0)
  
' 0000099C; MAIN: init video timing
  WriteO2 &H1040000, &HFFAC&  ' hsync register
  WriteO2 &H1060000, &HFFFE&  ' vsync register
  
' 000009C4; MAIN: clear tilemap ram @ 0x1000000 - 0x100A00F
  'RtlZeroMemory RAM_01000000(0&), &HA010&
  R4 = &H1000000
  R5 = &H0&
  R6 = &H5008&
  Do
    WriteO2 R4, R5
    R4 = R4 + 2
    R6 = R6 - 1
  Loop While (R6 > 0)
  
' 000009E0; MAIN: clear tilemap ram @ 0x100c000 - 0x100dfff
  'RtlZeroMemory RAM_01000000(&HC000&), &H2000&
  R4 = &H100C000
  R6 = &H1000 ' ShiftL(1,12)
  Do
    WriteO2 R4, R5
    R4 = R4 + 2
    R6 = R6 - 1
  Loop While (R6 > 0)
  
' 000009FC; MAIN: copy palette from 0x0ccc to 0x1800000 and 0x1802000 (32 bytes)
  'RtlMoveMemory RAM_01800000(0&), ROM_00000000(&HCCC&), &H20&
  'RtlMoveMemory RAM_01800000(&H2000&), ROM_00000000(&HCCC&), &H20&
  R4 = &HCCC&
  R5 = &H0&
  R6 = &H10&
  Do
    R7 = ReadO2(R4)
    WriteO2 &H1800000 + R5, R7
    WriteO2 &H1802000 + R5, R7
    R4 = R4 + 2
    R5 = R5 + 2
    R6 = R6 - 1
  Loop While (R6 > 0)
End Sub

Private Sub x00000910(G0 As Long, G1 As Long, G2 As Long, G4 As Long)
' 00000910; burstcopy(g0 longs from g1 to g2, offset g4)
  Do
    G8 = Read4(G1 + G4 + 0)
    G9 = Read4(G1 + G4 + 4)
    G10 = Read4(G1 + G4 + 8)
    G11 = Read4(G1 + G4 + 12)
    Write4 G2 + G4 + 0, G8
    Write4 G2 + G4 + 4, G9
    Write4 G2 + G4 + 8, G10
    Write4 G2 + G4 + 12, G11
    G4 = G4 + 16
    If (G0 = G4) Then Exit Do
  Loop
End Sub

Private Sub x00000BDC()
' 00000BDC; wait 4 cycles
  Dim R3 As Long
  R3 = 4
  While (1 > R3)
    R3 = R3 - 1
  Wend
End Sub

Private Sub x00001038()
  ' does nothing
End Sub

Private Sub x0001E3B8()
'0001E3B8; init io ports
  WriteO1 &H1C00040, &H0&
  WriteO1 &H1C0001C, &HFF&
  WriteO1 &H1C00014, &HFF&
  WriteO1 &H1C00012, &HFF&
  WriteO1 &H1C00010, &HFF&

'0001E3EC
  WriteO1 &H1C0001E, ReadO1(&H1C0001E) And &HF0&

  WriteO1 &H1C00022, &HFF&
  WriteO1 &H1C00024, &H1&
  
'0001E41C
  WriteO1 &H1C00034, &H53& ' S
  WriteO1 &H1C00036, &H45& ' E
  WriteO1 &H1C00038, &H47& ' G
  WriteO1 &H1C0003A, &H41& ' A

'0001E44C
  WriteO1 &H1C00040, &H1&
End Sub
