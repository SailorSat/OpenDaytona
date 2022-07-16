VERSION 5.00
Begin VB.Form frmWindow 
   Caption         =   "M2 Model Export"
   ClientHeight    =   3015
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3015
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExport 
      Caption         =   "&Export"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmWindow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdExport_Click()
  cmdExport.Enabled = False
  
  Dim Offset As Long
  For Offset = &H284A8FC To &H284B98C Step &H14&
    TGP_ExportObjectByAddress Offset
  Next
  
  'TGP_ExportObject &H1EDBA6, &H149A28, &H95E28A, &H1388 ' Daytona Player Car
  'TGP_ExportObject &H168A2E, &H1091E8, &H8D6A24, &H1388 ' Virtua Racing Countdown

  cmdExport.Enabled = True
End Sub

Private Sub Form_Load()
  LoadTGP
End Sub
