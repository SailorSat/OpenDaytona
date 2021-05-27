Attribute VB_Name = "gameMain"
Option Explicit

' -= game logic related stuff =-

Public G0 As Long, G1 As Long, G2 As Long, G3 As Long, G4 As Long, G5 As Long, G6 As Long, G7 As Long, G8 As Long, G9 As Long, G10 As Long, G11 As Long, G12 As Long, G13 As Long, G14 As Long, G15 As Long

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
  Dim R4 As Long, R5 As Long, R6 As Long, R7 As Long
  
' 00000860; MAIN: copy 0x38 bytes from 0xc90+ to 0xe00000+ (cpu control / wait states)
  RtlMoveMemory RAM_00E00000(0), ROM_00000000(&HC90&), &H38&
  
' 00000890; MAIN: burst copy 0x20000 bytes from 0x0+ to 0x200000+
  RtlMoveMemory RAM_00200000(0), ROM_00000000(0), &H20000
  
' 000008A8; MAIN: f80000=0x3 (unmapped in MAME)
  Call WriteO(4&, &HF80000, &H3&)
  
' 000008B4; MAIN: burst copy 0x400 bytes from 0x2802040+ to 0x5ff000+ (interupt vector table)
  RtlMoveMemory RAM_00500000(&HFF000), ROM_02000000(&H802040), &H400&

' 000008D0; MAIN: burst copy 0xb0 bytes from 0xc0 to 0x5ff400 (prcb data)
  RtlMoveMemory RAM_00500000(&HFF400), ROM_00000000(&HC0&), &HB0&
  
' 000008EC; MAIN: store pointer to interupt vector table in prcb data
  Call WriteO(4&, &H5FF414, &H5FF000)

x000008F8:
' 000008F8; MAIN: reset game
  ' lda     0xff000010,g5
  ' lda     0xc80,g6
  ' synmovq g5,g6
  ' b       0000090c

' 00000924; MAIN: init serial 00,00,00,40,4e
'         ; 00 @ MOD = sync mode, 5 bits, no parity, invalid stop bits
'         ; 00 @ CMD = tx off, rx off, ...
'         ; 40 @ CMD = internal reset
'         ; 4e @ MOD = 16x rate, 8 bits, no parity, 1 stop bit (asuming 10 bits on the line and a 5 MHz clock (20/4) we get 31250 baud - midi?)
  'init_serial

  Call x0001E3B8 ' init io ports
  
' 00000960; MAIN: config render mode
  Call WriteO(2&, &H10000000, &H4&)

' 00000974; MAIN: init luma ram
  R4 = &H12800000
  R5 = 1&
  R6 = &H80&
  Do
    R7 = LShiftLong(R5, 1)
    Call WriteO(2&, R4, R7)
    R4 = R4 + 2
    R5 = R5 + 1
    R6 = R6 - 1
  Loop While (1 > R6)

' 0000099C; MAIN: init video timing
  Call WriteO(2&, &H1040000, &HFFAC&)
  Call WriteO(2&, &H1060000, &HFFFE&)

' 000009C4; MAIN: clear tilemap ram @ 0x1000000 - 0x100A00F
  RtlZeroMemory RAM_01000000(0&), &HA010&
  
' 000009E0; MAIN: clear tilemap ram @ 0x100c000 - 0x100dfff
  RtlZeroMemory RAM_01000000(&HC000&), &H2000&

' 000009FC; MAIN: copy palette from 0x0ccc to 0x1800000 and 0x1802000 (32 bytes)
  RtlMoveMemory RAM_01800000(0&), ROM_00000000(&HCCC&), &H20&
  RtlMoveMemory RAM_01800000(&H2000&), ROM_00000000(&HCCC&), &H20&

' 00000A30; MAIN: setup interrupt-control register from 0x850
' lda     0xff000004,r4
' lda     0x850,r5
' synmov  r4,r5

' 00000A44; MAIN: clear and enable irq 0
  Call WriteO(4&, &HE80000, 0)
  Call WriteO(4&, &HE80004, 1)
  
' 00000A5C; MAIN: setup arithmetic controls
' lda     0xff1f917f,r4
' lda     0x3f001000,r5
' modac   r4,r5,r5

' 0000113C; MAIN: init variables & geo engine
  G10 = &H800000
  G11 = &H880000
  G12 = &H4000&
  G14 = &H0&
  
  Call x00001794 '; reset main ram & geo list
  
' 00001158; begin boot
  Call WriteO(4, &H5FE604, 0)
  Call WriteO(1, &H5FE626, &HFF&)
  
  Call x00028F40 ' backup config check
  Call x00029560 ' backup times check
  Call x00029800 ' backup coincounter check
  
  Call x000312a0
  Stop
End Sub

Private Sub x00001794()

'; clear main ram 0x00500000 - 0x005fefff
  RtlZeroMemory RAM_00500000(0&), &HFF000
  
'; clear main ram 0x00501000 - 0x0050104f (again?)
  RtlZeroMemory RAM_00500000(&H1000&), &H50&

'; clear geo lists (store 0x7800000 to 0x900000 - 0x91ffff)
  Dim Value As Long, Address As Long, Counter As Long
  Value = &H7800000
  Address = &H900000
  Counter = &H8000&
  Do
    Call WriteO(4, Address, Value)
    Address = Address + 4
    Counter = Counter - 1
  Loop While (Counter > 0)
End Sub

Private Sub x0001E3B8()
'; init io ports

  Call WriteO(1, &H1C00040, &H0&)
  
  Call WriteO(1, &H1C0001C, &HFF&)
  Call WriteO(1, &H1C00014, &HFF&)
  Call WriteO(1, &H1C00012, &HFF&)
  Call WriteO(1, &H1C00010, &HFF&)
  
  Dim Value As Long
  Value = ReadO(1, &H1C0001E)
  Value = Value And &HF0&
  Call WriteO(1, &H1C0001E, Value)
  
  Call WriteO(1, &H1C00022, &HFF&)
  
  Call WriteO(2, &H1C00024, &H1&)
  Call WriteO(2, &H1C00034, &H53&)  ' S
  Call WriteO(2, &H1C00036, &H45&)  ' E
  Call WriteO(2, &H1C00038, &H47&)  ' G
  Call WriteO(2, &H1C0003A, &H41&)  ' A
  
  Call WriteO(1, &H1C00040, &H1&)
End Sub








