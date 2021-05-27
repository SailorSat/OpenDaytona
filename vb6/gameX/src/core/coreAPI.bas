Attribute VB_Name = "coreAPI"
Option Explicit

Public Declare Sub RtlMoveMemory Lib "kernel32" (Destination As Any, Source As Any, ByVal Length As Long)
Public Declare Sub RtlZeroMemory Lib "kernel32" (Destination As Any, ByVal Length As Long)
Public Declare Sub RtlFillMemory Lib "kernel32" (Destination As Any, ByVal Length As Long, ByVal Fill As Byte)

