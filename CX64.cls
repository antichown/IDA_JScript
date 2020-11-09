VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CX64"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Function toHex(X)
    Dim m As New ULong64
    m.use0x = True
    m = X
    toHex = m.toString(mHex)
End Function

Function add(X, Y)
    Dim m As modes
    Dim x2 As ULong64
    Dim x64 As New ULong64
    
    On Error GoTo hell
    
    x64.use0x = True
    x64.useTick = True
    
    If TypeName(X) = "String" Then
        X = Trim(X)
        If LCase(Left(X, 2)) = "0x" Then m = mHex Else m = mUnsigned
        If Left(X, 1) = "-" Then m = mSigned
        If Not x64.fromString(X, m) Then
            frmMain.List1.AddItem "x64.Add Error converting " & X & " to x64 from string"
            Exit Function
        Else
            Set x2 = x64.add(Y)
            add = x2.toString(mHex)
        End If
    Else
        x64 = CLng(X)
        Set x2 = x64.add(Y)
        add = x2.toString(mHex)
    End If
    
    Exit Function
hell:
    frmMain.List1.AddItem "Error in x64.Add " & Err.Description
End Function

Function subtract(X, Y)
    Dim m As modes
    Dim x2 As ULong64
    Dim x64 As New ULong64
    
    On Error GoTo hell
    
    x64.use0x = True
    x64.useTick = True
    
    If TypeName(X) = "String" Then
        X = Trim(X)
        If LCase(Left(X, 2)) = "0x" Then m = mHex Else m = mUnsigned
        If Left(X, 1) = "-" Then m = mSigned
        If Not x64.fromString(X, m) Then
            frmMain.List1.AddItem "x64.Subtract Error converting " & X & " to x64 from string"
            Exit Function
        Else
            Set x2 = x64.subtract(Y)
            subtract = x2.toString(mHex)
        End If
    Else
        x64 = CLng(X)
        Set x2 = x64.subtract(Y)
        subtract = x2.toString(mHex)
    End If
    
    Exit Function
hell:
    frmMain.List1.AddItem "Error in x64.Subtract " & Err.Description
End Function

