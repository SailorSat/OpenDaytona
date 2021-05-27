Attribute VB_Name = "coreIRQ"
Option Explicit

' irq matrix bits
'  0 I960_IRQ0
'  1 I960_IRQ1
'  2 I960_IRQ2
'  3 I960_IRQ2
'  4 I960_IRQ2
'  5 I960_IRQ2
'  6 I960_IRQ2
'  7 I960_IRQ2
'  8 I960_IRQ2
'  9 I960_IRQ2
' 10 I960_IRQ3
' 11 I960_IRQ3

' irq logic
Private m_intreq As Long
Private m_intena As Long

Public Function irq_request_r() As Long
  irq_request_r = m_intreq
End Function

Public Function irq_enable_r() As Long
  irq_enable_r = m_intena
End Function

Public Sub irq_ack_w(Data As Long)
  m_intreq = m_intreq And Data
  
  'check_irqack_state Xor Data
End Sub

Public Sub irq_enable_w(Data As Long)
  m_intena = Data
  'check_irq_state
End Sub
