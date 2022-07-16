Attribute VB_Name = "modTGP"
Option Explicit


' -- some types used to hold 3d data --
Public Type TGP_POINT
  X As Single
  Y As Single
  Z As Single
  U As Single
  V As Single
End Type

Public Type TGP_QUAD
  p(0 To 3) As TGP_POINT
End Type

Public Type TGP_TRIANGLE
  p(0 To 2) As TGP_POINT
End Type


' -- the roms --
Public TGP_DATA(0 To &HFFFFFF) As Byte
Public TGP_POLYGON(0 To &HFFFFFF) As Byte
Public TGP_TEXTURE(0 To &H7FFFFF) As Byte


' -- some helpers
Public TGP_PALETTE(&H0& To &H3FFF&) As Byte
Public RGB555to888Table(0 To &H7FFF) As Long


' -- logic starts here --
Public Sub LoadTGP()
TGP_LoadDATA
  TGP_LoadPOLYGON
  TGP_LoadTEXTURE
  TGP_LoadPALETTE
End Sub

  Private Sub TGP_LoadDATA()
  Open App.Path & "\..\..\rom\rom_data.bin" For Binary As #1
  Get #1, , TGP_DATA
  Close #1
End Sub

Private Sub TGP_LoadPOLYGON()
  Open App.Path & "\..\..\rom\rom_pol.bin" For Binary As #1
  Get #1, , TGP_POLYGON
  Close #1
End Sub

Private Sub TGP_LoadTEXTURE()
  Open App.Path & "\..\..\rom\rom_tex.bin" For Binary As #1
  Get #1, , TGP_TEXTURE
  Close #1
End Sub

Private Sub TGP_LoadPALETTE()
  Open App.Path & "\ram_palette.bin" For Binary As #1
  Get #1, , TGP_PALETTE
  Close #1

  Open App.Path & "\RGB555to888Table.bin" For Binary As #1
  Get #1, , RGB555to888Table
  Close #1
End Sub

Private Function TGP_Read32I_DATA(ByVal Offset As Long) As Long
  Dim Index As Long
  Dim Data As Long
  Index = Offset * 4
  
  RtlMoveMemory Data, TGP_DATA(Index), 4
  
  TGP_Read32I_DATA = Data
End Function

Private Function TGP_Read32I_POLYGON(ByVal Offset As Long) As Long
  Dim Index As Long
  Dim Data As Long
  Index = Offset * 4
  
  RtlMoveMemory Data, TGP_POLYGON(Index), 4
  
  TGP_Read32I_POLYGON = Data
End Function
Private Function TGP_Read32F_POLYGON(ByVal Offset As Long) As Single
  Dim Index As Long
  Dim Data As Single
  Index = Offset * 4
  
  RtlMoveMemory Data, TGP_POLYGON(Index), 4
  
  TGP_Read32F_POLYGON = Data
End Function

Private Function TGP_Read16I_TEXTURE(ByVal Offset As Long) As Long
  Dim Index As Long
  Dim Data As Long
  Index = Offset * 2
  
  Index = Index Mod &H800000

  RtlMoveMemory Data, TGP_TEXTURE(Index), 2
  
  TGP_Read16I_TEXTURE = Data
End Function

Function GetPaletteEntry(Index As Long) As Long
  Dim Data As Long, Offset As Long
  Offset = Index * 2&
  
  
  RtlMoveMemory Data, TGP_PALETTE(Offset), 2
  GetPaletteEntry = RGB555to888Table(Data And &H7FFF)
End Function

Public Sub TGP_ExportObjectByAddress(ByVal data_adr As Long)
  data_adr = data_adr And &HFFFFFF
  data_adr = data_adr / 4
  
  Dim poly_adr As Long, tex_adr As Long, head_adr As Long, size As Long
  poly_adr = TGP_Read32I_DATA(data_adr + 0)
  tex_adr = TGP_Read32I_DATA(data_adr + 1)
  head_adr = TGP_Read32I_DATA(data_adr + 2)
  size = &H1388
  
  TGP_ExportObject tex_adr, head_adr, poly_adr, size
End Sub

Public Sub TGP_ExportObject(ByVal tex_adr As Long, ByVal head_adr As Long, ByVal poly_adr As Long, ByVal size As Long)
  ' sanity check for texture ram
  If tex_adr >= &H800000 Or head_adr >= &H800000 Then
    ' texture ram is not available here
    Debug.Print Hex(tex_adr), Hex(head_adr)
    Stop
    Exit Sub
  End If
  
  ' sanity check for polygon ram
  If (poly_adr >= &H1000000) Or (poly_adr < &H800000) Then
    ' polygon ram
    Debug.Print Hex(tex_adr), Hex(head_adr)
    Stop
    Exit Sub
  ElseIf (poly_adr And &H800000) Then
    ' polygon rom
    poly_adr = poly_adr And &H7FFFFF
  End If
  
  If size = 0 Then size = &HFFFFF

  TGP_ExportObject_Internal tex_adr, head_adr, poly_adr, size
End Sub

Private Sub TGP_ExportObject_Internal(ByVal tex_adr As Long, ByVal head_adr As Long, ByVal poly_adr As Long, ByVal size As Long)
  Dim Quad1 As TGP_QUAD, Triangle1 As TGP_TRIANGLE
  
  Dim Point0 As TGP_POINT, Point1 As TGP_POINT, Point2 As TGP_POINT, Point3 As TGP_POINT
  Dim VectorNormal As TGP_POINT
 
  Dim Header0 As Long, Header1 As Long, Header2 As Long, Header3 As Long
  Dim HeaderOffset As Long
  
  Dim TextureWidth As Long, TextureHeight As Long
  Dim TextureOffsetX As Long, TextureOffsetY As Long
  Dim TextureSheet As Long
  
  Dim OBJ_poly_adr As Long
  OBJ_poly_adr = poly_adr
  OBJ_StartExport OBJ_poly_adr
  
  Point0.X = TGP_Read32F_POLYGON(poly_adr + 0)
  Point0.Y = TGP_Read32F_POLYGON(poly_adr + 1)
  Point0.Z = TGP_Read32F_POLYGON(poly_adr + 2)
  Point0.V = CSng(TGP_Read16I_TEXTURE(tex_adr + 0) \ 8&)
  Point0.U = CSng(TGP_Read16I_TEXTURE(tex_adr + 1) \ 8&)
  
  Point1.X = TGP_Read32F_POLYGON(poly_adr + 3)
  Point1.Y = TGP_Read32F_POLYGON(poly_adr + 4)
  Point1.Z = TGP_Read32F_POLYGON(poly_adr + 5)
  Point1.V = CSng(TGP_Read16I_TEXTURE(tex_adr + 2) \ 8&)
  Point1.U = CSng(TGP_Read16I_TEXTURE(tex_adr + 3) \ 8&)
  
  poly_adr = poly_adr + 6
  tex_adr = tex_adr + 4
  
  Dim flags As Long, typ As Long, link As Long
  Dim lightmode As Long, color As Long, R As Byte, G As Byte, B As Byte, A As Byte
  
  Dim I As Long
  For I = 0 To size
    flags = TGP_Read32I_POLYGON(poly_adr + 0) And &H3FFFFF
    
    typ = flags And 3&
    If typ = 0 Then
      Exit For
    End If
    
    VectorNormal.X = TGP_Read32F_POLYGON(poly_adr + 1)
    VectorNormal.Y = TGP_Read32F_POLYGON(poly_adr + 2)
    VectorNormal.Z = TGP_Read32F_POLYGON(poly_adr + 3)
    
    Point2.X = TGP_Read32F_POLYGON(poly_adr + 4)
    Point2.Y = TGP_Read32F_POLYGON(poly_adr + 5)
    Point2.Z = TGP_Read32F_POLYGON(poly_adr + 6)
    Point2.V = CSng(TGP_Read16I_TEXTURE(tex_adr + 0) \ 8&)
    Point2.U = CSng(TGP_Read16I_TEXTURE(tex_adr + 1) \ 8&)
    
    Point3.X = TGP_Read32F_POLYGON(poly_adr + 7)
    Point3.Y = TGP_Read32F_POLYGON(poly_adr + 8)
    Point3.Z = TGP_Read32F_POLYGON(poly_adr + 9)
    Point3.V = CSng(TGP_Read16I_TEXTURE(tex_adr + 2) \ 8&)
    Point3.U = CSng(TGP_Read16I_TEXTURE(tex_adr + 3) \ 8&)
    
    Header0 = TGP_Read16I_TEXTURE(head_adr + 0)
    Header1 = TGP_Read16I_TEXTURE(head_adr + 1)
    Header2 = TGP_Read16I_TEXTURE(head_adr + 2)
    Header3 = TGP_Read16I_TEXTURE(head_adr + 3)
    
    If Header0 And &H400& Then
      ' textured?
      Header0 = Header0 Xor &H400&
      
      TextureWidth = LShift(32, Header0 And &H7&)
      TextureHeight = LShift(32, (Header0 \ 8&) And &H7&)
      TextureOffsetX = 32 * (Header2 And &H1F&)
      TextureOffsetY = 32 * (((Header2 \ &H40&) And &H1F&) + (Header2 And &H20&))
      TextureSheet = Header2 And &H1000
    Else
      ' not textured?
      TextureWidth = 0
      TextureHeight = 0
      TextureOffsetX = 0
      TextureOffsetY = 0
      TextureSheet = 0
    End If
    
    'Debug.Print TextureWidth, TextureHeight, TextureOffsetX, TextureOffsetY, Hex(Header0), Hex(Header1), Hex(Header2), Hex(Header3)
    
    HeaderOffset = (flags \ &H1000&) And &H1F&
    If HeaderOffset And &H10& Then
      HeaderOffset = HeaderOffset Or -16
    End If
    head_adr = head_adr + (HeaderOffset * 4)
    
    color = (Header3 \ &H40&) And &H3FF&
    color = GetPaletteEntry(color + &H1000&)
    
    R = (color) And &HFF&
    G = (color \ &H100&) And &HFF&
    B = (color \ &H10000) And &HFF&
    A = &HFF
    
    lightmode = (Header0 \ &H2000&) And &H7&
    If lightmode And &H1& Then
      'transparency (textures)
      A = &H80
    ElseIf lightmode And &H4& Then
      'meshed
      A = &H80
    End If
    
    
    link = (flags \ &H100&) And 3&
    If link = 0 Then GoTo next_
    
    If typ = 1 Then
      ' quad
      Quad1.p(0) = Point1
      Quad1.p(1) = Point0
      Quad1.p(2) = Point2
      Quad1.p(3) = Point3
      
      TGP_ExportQuad Quad1, VectorNormal, R, G, B, A
      tex_adr = tex_adr + 4&
    ElseIf typ = 2 Then
      ' triad
      Triangle1.p(0) = Point1
      Triangle1.p(1) = Point0
      Triangle1.p(2) = Point2
      Point3 = Point2
      
      TGP_ExportTriangle Triangle1, VectorNormal, R, G, B, A
      tex_adr = tex_adr + 3&
    Else
      Stop
    End If
  
next_:
    DoEvents
    poly_adr = poly_adr + 10&
    Select Case link
      Case 0, 2
        '/* reuse Point2(n) and Point3(n) */
        Point0 = Point2
        Point1 = Point3
      Case 1
        '/* reuse Point2(n-1) and Point2(n) */
        Point1 = Point2
      Case 3
        '/* reuse Point3(n-1) and Point3(n) */
        Point0 = Point3
    End Select
    
  Next
  
  OBJ_EndExport OBJ_poly_adr
End Sub

Private Sub TGP_ExportQuad(Q As TGP_QUAD, VEC As TGP_POINT, R As Byte, G As Byte, B As Byte, A As Byte)
  Dim V1 As OBJ_POINT3, V2 As OBJ_POINT3, V3 As OBJ_POINT3, V4 As OBJ_POINT3
  Dim VT1 As OBJ_POINT2, VT2 As OBJ_POINT2, VT3 As OBJ_POINT2, VT4 As OBJ_POINT2
  Dim VN As OBJ_POINT3
  
  With V1
    .X = Q.p(0).X
    .Y = Q.p(0).Y
    .Z = Q.p(0).Z
  End With
  With V2
    .X = Q.p(1).X
    .Y = Q.p(1).Y
    .Z = Q.p(1).Z
  End With
  With V3
    .X = Q.p(2).X
    .Y = Q.p(2).Y
    .Z = Q.p(2).Z
  End With
  With V4
    .X = Q.p(3).X
    .Y = Q.p(3).Y
    .Z = Q.p(3).Z
  End With
  
  With VT1
    .U = Q.p(0).U
    .V = Q.p(0).V
  End With
  With VT2
    .U = Q.p(1).U
    .V = Q.p(1).V
  End With
  With VT3
    .U = Q.p(2).U
    .V = Q.p(2).V
  End With
  With VT4
    .U = Q.p(3).U
    .V = Q.p(3).V
  End With
  
  With VN
    .X = VEC.X
    .Y = VEC.Y
    .Z = VEC.Z
  End With
  
  ' we dont handle textures yet
  OBJ_AddQuad V1, V2, V3, V4, VT1, VT2, VT3, VT4, VN, LShift(CLng(A), 24) Or LShift(CLng(B), 16) Or LShift(CLng(G), 8) Or CLng(R), CSng(R) / 255, G / 255, B / 255, A / 255
End Sub

Private Sub TGP_ExportTriangle(T As TGP_TRIANGLE, VEC As TGP_POINT, R As Byte, G As Byte, B As Byte, A As Byte)
  Dim V1 As OBJ_POINT3, V2 As OBJ_POINT3, V3 As OBJ_POINT3
  Dim VT1 As OBJ_POINT2, VT2 As OBJ_POINT2, VT3 As OBJ_POINT2
  Dim VN As OBJ_POINT3
  
  With V1
    .X = T.p(0).X
    .Y = T.p(0).Y
    .Z = T.p(0).Z
  End With
  With V2
    .X = T.p(1).X
    .Y = T.p(1).Y
    .Z = T.p(1).Z
  End With
  With V3
    .X = T.p(2).X
    .Y = T.p(2).Y
    .Z = T.p(2).Z
  End With
  
  With VT1
    .U = T.p(0).U
    .V = T.p(0).V
  End With
  With VT2
    .U = T.p(1).U
    .V = T.p(1).V
  End With
  With VT3
    .U = T.p(2).U
    .V = T.p(2).V
  End With
  
  With VN
    .X = VEC.X
    .Y = VEC.Y
    .Z = VEC.Z
  End With
  
  ' we dont handle materials yet
  OBJ_AddTriangle V1, V2, V3, VT1, VT2, VT3, VN, LShift(CLng(A), 24) Or LShift(CLng(B), 16) Or LShift(CLng(G), 8) Or CLng(R), R / 255, G / 255, B / 255, A / 255
End Sub

