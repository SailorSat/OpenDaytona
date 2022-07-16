Attribute VB_Name = "modOBJ"
Option Explicit

' -- some types used to hold 3d data --
Public Type OBJ_POINT2
  U As Single
  V As Single
End Type

Public Type OBJ_POINT3
  X As Single
  Y As Single
  Z As Single
End Type

Public Type OBJ_FACE
  V1 As Long
  V2 As Long
  V3 As Long
  V4 As Long
  
  VT1 As Long
  VT2 As Long
  VT3 As Long
  VT4 As Long
  
  VN1 As Long
  VN2 As Long
  VN3 As Long
  VN4 As Long
  
  M As Long
End Type

Public Type MTL_M
  T As Long
  R As Single
  G As Single
  B As Single
  A As Single
End Type


' -- some helpers
Private OBJ_V() As OBJ_POINT3
Private OBJ_VT() As OBJ_POINT2
Private OBJ_VN() As OBJ_POINT3
Private OBJ_F() As OBJ_FACE

Private OBJ_Vcnt As Long
Private OBJ_VTcnt As Long
Private OBJ_VNcnt As Long
Private OBJ_Fcnt As Long

Private MTL_M() As MTL_M
Private MTL_Mcnt As Long

Private OBJ_Handle As Long
Private MTL_Handle As Long


' -- logic starts here --
Public Sub OBJ_StartExport(ByVal poly_adr As Long)
  OBJ_Handle = FreeFile
  
  Open App.Path & "\export_" & LeadZero(Hex(poly_adr), 8) & ".obj" For Output As #OBJ_Handle
  Print #OBJ_Handle, "# created with M2_ModelExport v" & App.Major & "." & App.Minor & "r" & App.Revision
  Print #OBJ_Handle, "mtllib export_" & LeadZero(Hex(poly_adr), 8) & ".mtl"
  Print #OBJ_Handle, "o O" & Hex(poly_adr)
  
  ReDim OBJ_V(1024)
  ReDim OBJ_VT(1024)
  ReDim OBJ_VN(1024)
  ReDim OBJ_F(1024)
  
  OBJ_Vcnt = 0
  OBJ_VTcnt = 0
  OBJ_VNcnt = 0
  OBJ_Fcnt = 0

  MTL_Handle = FreeFile
  Open App.Path & "\export_" & LeadZero(Hex(poly_adr), 8) & ".mtl" For Output As #MTL_Handle
  Print #MTL_Handle, "# created with M2_ModelExport v" & App.Major & "." & App.Minor & "r" & App.Revision

  ReDim MTL_M(1024)
  MTL_Mcnt = 0
End Sub

Public Sub OBJ_EndExport(ByVal poly_adr As Long)
  Dim Index As Long, LastM As Long
  
  ' sanity check for empty models
  If OBJ_Vcnt = 0 Then
    Close #OBJ_Handle
    Kill App.Path & "\export_" & LeadZero(Hex(poly_adr), 8) & ".obj"
    Close #MTL_Handle
    Kill App.Path & "\export_" & LeadZero(Hex(poly_adr), 8) & ".mtl"
    Exit Sub
  End If
  
  ' vertex
  For Index = 1 To OBJ_Vcnt
    ' "v <float x> <float y> <float z>"
    With OBJ_V(Index)
      Print #OBJ_Handle, Replace("v " & -.X & " " & .Y & " " & .Z, ",", ".")
    End With
  Next

  ' uv mapping
  For Index = 1 To OBJ_VTcnt
    ' "vt <float u> <float v>"
    With OBJ_VT(Index)
      Print #OBJ_Handle, Replace("vt " & .U & " " & .V, ",", ".")
    End With
  Next

  ' normals
  For Index = 1 To OBJ_VNcnt
    ' "vn <float x> <float y> <float z>"
    With OBJ_VN(Index)
      Print #OBJ_Handle, Replace("vn " & .X & " " & .Y & " " & .Z, ",", ".")
    End With
  Next
  
  Print #OBJ_Handle, "g group" & LeadZero(Hex(poly_adr), 8)
  Print #OBJ_Handle, "s off"
  
  ' faces
  Print #OBJ_Handle, "# we should have " & OBJ_Fcnt & " faces"
  For Index = 1 To OBJ_Fcnt
    With OBJ_F(Index)
      'Print #OBJ_Handle, "g group" & LeadZero(CStr(Index), 8)
      If .M <> LastM Then
        LastM = .M
        Print #OBJ_Handle, "usemtl " & Hex(MTL_M(.M).T)
      End If
      
      ' "f <int A_V> / <int A_VT> / <int A_VN> <int B_V> / ..."
      If .V4 = 0 Then
        ' Triangle
        Print #OBJ_Handle, "f " & .V1 & "/" & .VT1 & "/" & .VN1 & " " & .V2 & "/" & .VT2 & "/" & .VN2 & " " & .V3 & "/" & .VT3 & "/" & .VN3
      Else
        ' Quad
        Print #OBJ_Handle, "f " & .V1 & "/" & .VT1 & "/" & .VN1 & " " & .V2 & "/" & .VT2 & "/" & .VN2 & " " & .V3 & "/" & .VT3 & "/" & .VN3 & " " & .V4 & "/" & .VT4 & "/" & .VN4
      End If
    End With
  Next

  Close #OBJ_Handle
  
  ' materials
  For Index = 1 To MTL_Mcnt
    ' see https://people.sc.fsu.edu/~jburkardt/data/mtl/mtl.html
    With MTL_M(Index)
      Print #MTL_Handle, "newmtl " & Hex(.T)
      Print #MTL_Handle, Replace("Ka " & .R * 0.5 & " " & .G * 0.5 & " " & .B * 0.5, ",", ".")
      Print #MTL_Handle, Replace("Kd " & .R & " " & .G & " " & .B, ",", ".")
      Print #MTL_Handle, Replace("Ks " & .R * 2 & " " & .G * 2 & " " & .B * 2, ",", ".")
      Print #MTL_Handle, Replace("d " & .A, ",", ".")
      'Print #MTL_Handle, Replace("Tr " & .A, ",", ".")
      Print #MTL_Handle, "Ns 0"
      Print #MTL_Handle, "illum 2"
    End With
  Next
  
  Close #MTL_Handle
End Sub

Public Sub OBJ_AddQuad(V1 As OBJ_POINT3, V2 As OBJ_POINT3, V3 As OBJ_POINT3, V4 As OBJ_POINT3, VT1 As OBJ_POINT2, VT2 As OBJ_POINT2, VT3 As OBJ_POINT2, VT4 As OBJ_POINT2, VN As OBJ_POINT3, T As Long, R As Single, G As Single, B As Single, A As Single)
  OBJ_Fcnt = OBJ_Fcnt + 1
  If OBJ_Fcnt > UBound(OBJ_F) Then ReDim Preserve OBJ_F(UBound(OBJ_F) + 1024)
  With OBJ_F(OBJ_Fcnt)
    .V1 = OBJ_AddVertex(V1)
    .V2 = OBJ_AddVertex(V2)
    .V3 = OBJ_AddVertex(V3)
    .V4 = OBJ_AddVertex(V4)
    
    .VT1 = OBJ_AddUV(VT1)
    .VT2 = OBJ_AddUV(VT2)
    .VT3 = OBJ_AddUV(VT3)
    .VT4 = OBJ_AddUV(VT4)
    
    .VN1 = OBJ_AddNormal(VN)
    .VN2 = .VN1
    .VN3 = .VN1
    .VN4 = .VN1
  
    .M = MTL_AddMaterial(T, R, G, B, A)
  End With
End Sub

Public Sub OBJ_AddTriangle(V1 As OBJ_POINT3, V2 As OBJ_POINT3, V3 As OBJ_POINT3, VT1 As OBJ_POINT2, VT2 As OBJ_POINT2, VT3 As OBJ_POINT2, VN As OBJ_POINT3, T As Long, R As Single, G As Single, B As Single, A As Single)
  OBJ_Fcnt = OBJ_Fcnt + 1
  If OBJ_Fcnt > UBound(OBJ_F) Then ReDim Preserve OBJ_F(UBound(OBJ_F) + 1024)
  With OBJ_F(OBJ_Fcnt)
    .V1 = OBJ_AddVertex(V1)
    .V2 = OBJ_AddVertex(V2)
    .V3 = OBJ_AddVertex(V3)
    .V4 = 0
  
    .VT1 = OBJ_AddUV(VT1)
    .VT2 = OBJ_AddUV(VT2)
    .VT3 = OBJ_AddUV(VT3)
    .VT4 = 0
    
    .VN1 = OBJ_AddNormal(VN)
    .VN2 = .VN1
    .VN3 = .VN1
    .VN4 = 0
    
    .M = MTL_AddMaterial(T, R, G, B, A)
  End With
End Sub

Private Function OBJ_AddVertex(V As OBJ_POINT3) As Long
  Dim Index As Long
  
  ' check for existing vertex
  For Index = 1 To OBJ_Vcnt
    With OBJ_V(Index)
      If .X = V.X Then
        If .Y = V.Y Then
          If .Z = V.Z Then
            OBJ_AddVertex = Index
            Exit Function
          End If
        End If
      End If
    End With
  Next
  
  ' none found - add one
  OBJ_Vcnt = OBJ_Vcnt + 1
  If OBJ_Vcnt > UBound(OBJ_V) Then ReDim Preserve OBJ_V(UBound(OBJ_V) + 1024)
  With OBJ_V(OBJ_Vcnt)
    .X = V.X
    .Y = V.Y
    .Z = V.Z
  End With
  OBJ_AddVertex = OBJ_Vcnt
End Function

Private Function OBJ_AddUV(VT As OBJ_POINT2) As Long
  Dim Index As Long
  
  ' check for existing uv mapping
  For Index = 1 To OBJ_VTcnt
    With OBJ_VT(Index)
      If .U = VT.U Then
        If .V = VT.V Then
          OBJ_AddUV = Index
          Exit Function
        End If
      End If
    End With
  Next
  
  ' none found - add one
  OBJ_VTcnt = OBJ_VTcnt + 1
  If OBJ_VTcnt > UBound(OBJ_VT) Then ReDim Preserve OBJ_VT(UBound(OBJ_VT) + 1024)
  With OBJ_VT(OBJ_VTcnt)
    .U = VT.U
    .V = VT.V
  End With
  OBJ_AddUV = OBJ_VTcnt
End Function

Private Function OBJ_AddNormal(VN As OBJ_POINT3) As Long
  Dim Index As Long
  
  ' check for existing normal
  For Index = 1 To OBJ_VNcnt
    With OBJ_VN(Index)
      If .X = VN.X Then
        If .Y = VN.Y Then
          If .Z = VN.Z Then
            OBJ_AddNormal = Index
            Exit Function
          End If
        End If
      End If
    End With
  Next
  
  ' none found - add one
  OBJ_VNcnt = OBJ_VNcnt + 1
  If OBJ_VNcnt > UBound(OBJ_VN) Then ReDim Preserve OBJ_VN(UBound(OBJ_VN) + 1024)
  With OBJ_VN(OBJ_VNcnt)
    .X = VN.X
    .Y = VN.Y
    .Z = VN.Z
  End With
  OBJ_AddNormal = OBJ_VNcnt
End Function

Private Function MTL_AddMaterial(T As Long, R As Single, G As Single, B As Single, A As Single) As Long
  Dim Index As Long
  
  ' check for existing uv mapping
  For Index = 1 To MTL_Mcnt
    With MTL_M(Index)
      If .T = T Then
        If .R = R Then
          If .G = G Then
            If .B = B Then
              If .A = A Then
                MTL_AddMaterial = Index
                Exit Function
              End If
            End If
          End If
        End If
      End If
    End With
  Next
  
  ' none found - add one
  MTL_Mcnt = MTL_Mcnt + 1
  If MTL_Mcnt > UBound(MTL_M) Then ReDim Preserve MTL_M(UBound(OBJ_VT) + 1024)
  With MTL_M(MTL_Mcnt)
    .T = T
    .R = R
    .G = G
    .B = B
    .A = A
  End With
  MTL_AddMaterial = MTL_Mcnt
End Function
