;;Shift +
;;Ctrl  ^
;;Alt   !
;;Win   #
; 半角/全角 vkF3sc029/vkF4sc029
; 変換      vk1Csc079
; 無変換    vk1Dsc07B
; ひらがなカタカナ    vkF2sc070 
;#If WinActive("ahk_class ConsoleWindowClass")
;#IfWinActive
;WinGetPos [, X, Y, Width, Height, WinTitle, WinText, ExcludeTitle, ExcludeText]
;WinGetPos,X,Y,W,H,A  ;アクティブウィンドウの左上座標(X,Y)とサイズ(W,H)
;MouseClick, left, 312, 482
;; 変換

#UseHook on
#SingleInstance force

;;
;; CapsLock⇔無変換は次のレジストリをバイナリ値で設定する。
;;
;; \HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout\Scancode Map
;;
;; 0000  00 00 00 00 00 00 00 00
;; 0008  03 00 00 00 3A 00 7B 00
;; 0010  7B 00 3A 00
;;
;;######################################
;; AHK
;;######################################
;;###########
;; 無変換 + Z => 
;;###########
vk1Dsc07B & z::
  is_space = 0
  If GetKeyState("shift", "P")
    ;Run, %A_ScriptDir%
     edit %A_ScriptDir%\autohotkey.ahk
  Else if GetKeyState("Alt", "P")
    ExitApp
    ;MsgBox, Hello
  Else
    Run, C:\Windows\Script\AHKRunAs.bat
;Reload
  Return


;;###########
;; 変換 + C =>  /CLCL登録アイテム表示
;;###########
;;上部に移動中
vk1Csc079 & c::
If is_ctrl
{
  Send, ^c
}
If is_custom
{
  Send, {Ctrl Down}!{F2}{Ctrl Up}
}
Return


;;###########
;; 変換 + V => 前頁へ移動 /CLCLビューア表示
;;###########
;上部に移動
vk1Csc079 & v::
If is_custom
{
  Send, {Ctrl Down}!{F1}{Ctrl Up}
  Return
}
  If is_space
  {
    If GetKeyState("alt", "P"){
      Send,{Shift Down}!{PgUp}{Shift Up}
    }Else{
      Send,{Shift Down}{PgUp}{Shift Up}
    }
  }Else if GetKeyState("shift", "P"){
    Send, +{PgUp}
  }Else if GetKeyState("Alt", "P"){
    Send, !{PgUp}
  }Else{
    Send,{PgUp}
  }
  Return


;; 変換 + 1 => F1
;vk1Csc079 & 1::
;  is_space = 0
;  ;Send,{F1}
;  Run,"C:\Programs1\fenrir075c\fenrir.exe"
;  Return


;;######################################
;; グローバル変数
;;######################################
;; 選択状態を格納する。(1:選択中)
is_space = 0

;; Ctrl押下状態を格納する。(1:選択中)
is_ctrl = 0

;; 選択状態を格納する。(1:選択中)
is_custom = 0

;;######################################
;;特定のWindowの動作
;;######################################
;;-------------------------------------------
;;エクスプローラ
;;-------------------------------------------
#If WinActive("ahk_exe explorer.exe")
;; 無変換 + Q => Ctrl + W
vk1Dsc07B & q::
  is_space = 0
  Send,^w
  Return
#IfWinActive

;;-------------------------------------------
;;サクラエディタ
;;-------------------------------------------
#If WinActive("ahk_exe sakura.exe")

#IfWinActive

;;-------------------------------------------
;; SnapTimer
;;-------------------------------------------
#If WinActive("ahk_exe SnapTimer.exe")
;; 変換 + M => 時間にフォーカス
vk1Csc079 & m::
  is_space = 0
  MouseClick, left, 120, 100
  Return
#IfWinActive


;;-------------------------------------------
;; TimerMemo
;;-------------------------------------------
#If WinActive("ahk_exe TimerMemo.exe")
;; 変換 + N => 最小化
vk1Csc079 & n::
  is_space = 0
  WinMinimize
  Return
#IfWinActive


;;######################################
;; 起動系
;;######################################
; 無変換キー二連打でランチャーを呼び出す
$vk1Dsc07B::
  if A_TickCount < %MuhenkanDouble%
  {
    ;send, {Shift}{Shift}
    ;Run,"C:\Programs1\fenrir075c\fenrir.exe"
    Run,"C:\Programs1\clcl203\CLCL.exe
    MuhenkanDouble = 0
  }
  else
 {
    MuhenkanDouble = %A_TickCount%
   MuhenkanDouble += 400
  }
  KeyWait, vk1Dsc07B
return


;;######################################
;; 無変換
;;######################################

;; 無変換 + Space => 選択開始
vk1Dsc07B & Space::
  is_space = 1
  Return

;;
;; Ctrlと同等
;;
;; 無変換 + ; => Ctrl + ;
vk1Dsc07B & vkBBsc027::
  is_space = 0
  Send,^;
  Return
;; 無変換 + : => Ctrl + :
vk1Dsc07B & vkBAsc028::
  is_space = 0
  Send,^:
  Return
;; 無変換 + WheelDown => Ctrl + WheelDown
vk1Dsc07B & WheelDown::
  is_space = 0
  Send,^{WheelDown}
  Return
;; 無変換 + WheelUp => Ctrl + WheelUp
vk1Dsc07B & WheelUp::
  is_space = 0
  Send,^{WheelUp}
  Return
;; 無変換 + [ => Windows Shift E
vk1Dsc07B & [::
  is_space = 0
  Send,{Shift Down}!e{Shift Up}
  Return
;; 無変換 + ] => Windows Shift S
vk1Dsc07B & ]::
  is_space = 0
  Send,{Shift Down}!s{Shift Up}
  Return
;; 無変換 + - => ctrl + -
vk1Dsc07B & -::
  is_space = 0
  Send,^-
  Return


;; 無変換 + > => Alt + Tab （タスクの切り替え）
vk1Dsc07B & vkBEsc034 :: AltTab
  is_space = 0
  Return
;; 無変換 + < => Alt + Shift + Tab （タスクの切り替え）
vk1Dsc07B & vkBCsc033 :: ShiftAltTab
  is_space = 0
  Return
;; 無変換 + Enter => Alt + Enter
vk1Dsc07B & Enter::
  is_space = 0
  Send,!{Enter}
  Return
  If is_space
  {
    If GetKeyState("alt", "P"){
      Send,{Shift Down}^{Down}{Shift Up}
    }Else{
      Send,{Shift Down}{Down}{Shift Up}
    }
  }Else if GetKeyState("shift", "P"){
    Send, +{Down}
  }Else if GetKeyState("Alt", "P"){
    Send, ^{Down}
  }Else{
    Send,{Down}
  }
  Return

;;
;;Windows
;;
;; 無変換 + 1 => Win1
vk1Dsc07B & 1::
  is_space = 0
  Send,#1
  Return
;; 無変換 + 2 => Win2
vk1Dsc07B & 2::
  is_space = 0
  Send,#2
  Return
;; 無変換 + 3 => Win3
vk1Dsc07B & 3::
  is_space = 0
  Send,#3
  Return
;; 無変換 + 4 => Win4
vk1Dsc07B & 4::
  is_space = 0
  Send,#4
  Return

;; 無変換 + Tab => Alt + PrintScreen
vk1Dsc07B & Tab:: 
  is_space = 0
  Send,!{PrintScreen}
  Return

;; 無変換 + / => 元に戻す
vk1Dsc07B & /::
  is_space = 0
  Send,^z
  Return
;; 無変換 + \ => 元に戻す(逆)
vk1Dsc07B & vkE2::
  is_space = 0
  Send,^y
  Return


;;###########
;; 無変換 + A => 行頭へ移動
;;###########
vk1Dsc07B & a::
  If is_space
    Send,{Shift Down}{Home}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send, +{Home}
  Else
    Send,{Home}
  Return


;;###########
;; 無変換 + B => 1文字左へ移動
;;###########
vk1Dsc07B & b::
  If is_space
  {
    If GetKeyState("alt", "P"){
      Send,{Shift Down}^{Left}{Shift Up}
    }Else{
      Send,{Shift Down}{Left}{Shift Up}
    }
  }Else if GetKeyState("shift", "P"){
    Send, +{Left}
  }Else if GetKeyState("Alt", "P"){
    Send, ^{Left}
  }Else{
    Send,{Left}
  }
  Return


;;###########
;; 無変換 + C => Esc
;;###########
vk1Dsc07B & c::
  is_space = 0
  Send,{Esc}
  Return


;;###########
;; 無変換 + d => Deleteの入力
;;###########
vk1Dsc07B & d::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Right}{Shift Up}{Del}
  Else
    Send,{Del}
  Return


;;###########
;; 無変換 + E => 行末へ移動
;;###########
vk1Dsc07B & e::
  If is_space
    Send,{Shift Down}{End}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send, +{End}
  Else
    Send,{End}
  Return


;;###########
;; 無変換 + F => 1文字右へ移動
;;###########
vk1Dsc07B & f::
  If is_space
  {
    If GetKeyState("alt", "P"){
      Send,{Shift Down}^{Right}{Shift Up}
    }Else{
      Send,{Shift Down}{Right}{Shift Up}
    }
  }Else if GetKeyState("shift", "P"){
    Send, +{Right}
  }Else if GetKeyState("Alt", "P"){
    Send, ^{Right}
  }Else{
    Send,{Right}
  }
  Return


;;###########
;; 無変換 + G => 選択解除
;;###########
vk1Dsc07B & g:: is_space = 0


;;###########
;; 無変換 + h => BackSpaceの入力
;;###########
vk1Dsc07B & h::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Left}{Shift Up}{BackSpace}
  Else
    Send,{BackSpace}
  Return


;;###########
;; 無変換 + I => タブの入力
;;###########
vk1Dsc07B & i::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}{Tab}{Shift Up}
  Else
    Send,{Tab}
  Return


;;###########
;; 無変換 + J => 改行の入力
;;###########
vk1Dsc07B & j::
  is_space = 0
  If GetKeyState("ctrl", "P")
    Send, ^{Enter}
  Else if GetKeyState("shift", "P")
    Send, +{Enter}
  Else if GetKeyState("alt", "P")
    Send, !{Enter}
  Else
    Send,{Enter}
  Return


;;###########
;; 無変換 + K => 行末までを切り取り
;;###########
vk1Dsc07B & k::
  is_space = 0
  Send,{Shift Down}{End}{Shift Up}^x
  Return


;;###########
;; 無変換 + L => スクリーン中央へ移動…としたいが15行上下に移動する
;;###########
vk1Dsc07B & L::
  is_space = 0
  Loop,15
    Send,{Up}
  Loop,15
    Send,{Down}
  Loop,15
    Send,{Down}
  Loop,15
    Send,{Up}
  Return 


;;###########
;; 無変換 + M => 改行の入力
;;###########
vk1Dsc07B & m::
  is_space = 0
  If GetKeyState("ctrl", "P")
    Send, ^{Enter}
  Else if GetKeyState("shift", "P")
    Send, +{Enter}
  Else if GetKeyState("alt", "P")
    Send, !{Enter}
  Else
    Send,{Enter}
  Return


;;###########
;; 無変換 + N => 1文字下へ移動
;;###########
vk1Dsc07B & n::
  If is_space
  {
    If GetKeyState("alt", "P"){
      Send,{Shift Down}^{Down}{Shift Up}
    }Else{
      Send,{Shift Down}{Down}{Shift Up}
    }
  }Else if GetKeyState("shift", "P"){
    Send, +{Down}
  }Else if GetKeyState("Alt", "P"){
    Send, ^{Down}
  }Else{
    Send,{Down}
  }
  Return


;;###########
;; 無変換 + O => 半角/全角
;;###########
vk1Dsc07B & o::
  is_space = 0
  Send,!{vkF3sc029}
  Return


;;###########
;; 無変換 + P => 1文字上へ移動
;;###########
vk1Dsc07B & p::
  If is_space
  {
    If GetKeyState("alt", "P"){
      Send,{Shift Down}^{Up}{Shift Up}
    }Else{
      Send,{Shift Down}{Up}{Shift Up}
    }
  }Else if GetKeyState("shift", "P"){
    Send, +{Up}
  }Else if GetKeyState("Alt", "P"){
    Send, ^{Up}
  }Else{
    Send,{Up}
  }
  Return


;;###########
;; 無変換 + Q => Ctrl + F4
;;###########
vk1Dsc07B & q::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^T{Shift Up}
  Else
    Send,^{F4}
  Return


;;###########
;; 無変換 + R => Ctrl + R
;;###########
vk1Dsc07B & r::
  is_space = 0
  Send,^r
  Return


;;###########
;; 無変換 + S => 改行の入力
;;###########
vk1Dsc07B & s::
  is_space = 0
  If GetKeyState("ctrl", "P")
    Send, ^{Enter}
  Else if GetKeyState("shift", "P")
    Send, +{Enter}
  Else if GetKeyState("alt", "P")
    Send, !{Enter}
  Else
    Send,{Enter}
  Return


;;###########
;; 無変換 + T => Ctrl + T
;;###########
vk1Dsc07B & t::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Tab}{Shift Up}
  Else
    Send,^{Tab}
  Return


;;###########
;; 無変換 + U => 行頭までを切り取り
;;###########
vk1Dsc07B & u::
  is_space = 0
  Send,{Shift Down}{Home}{Shift Up}^x
  Return


;;###########
;; 無変換 + V => 次頁へ移動
;;###########
vk1Dsc07B & v::
  If is_space
  {
    If GetKeyState("alt", "P"){
      Send,{Shift Down}!{PgDn}{Shift Up}
    }Else{
      Send,{Shift Down}{PgDn}{Shift Up}
    }
  }Else if GetKeyState("shift", "P"){
    Send, +{PgDn}
  }Else if GetKeyState("Alt", "P"){
    Send, !{PgDn}
  }Else{
    Send,{PgDn}
  }
  Return


;;###########
;; 無変換 + W => 切り取り
;;###########
vk1Dsc07B & w::
  is_space = 0
  Send,^x
  Return


;;###########
;; 無変換 + X
;;###########


;;###########
;; 無変換 + Y => 貼り付け
;;###########
vk1Dsc07B & y::
  is_space = 0
  Send,^v
  Return


;;###########
;; 無変換 + Z
;;###########


;;######################################
;; 変換
;;######################################
;; 変換 + Space => 右クリック
vk1Csc079 & Space:: 
If is_ctrl
{
  Send, ^{Space}
}
Else
{
  is_space = 0
;Appキーに変更  Send,+{F10}
   Send,{AppsKey}
}
  Return

;; 変換 + , => ファイルの先頭へ移動
vk1Csc079 & ,::
  If is_space
    Send,{Shift Down}^{Home}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send,{Shift Down}^{Home}{Shift Up}
  Else
    Send,^{Home}
  Return
;; 変換 + . => ファイルの末尾へ移動
vk1Csc079 & .::
  If is_space
    Send,{Shift Down}^{End}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send,{Shift Down}^{End}{Shift Up}
  Else
    Send,^{End}
  Return

;; 変換 + 1 => F1
vk1Csc079 & 1::
  is_space = 0
  ;Send,{F1}
  Run,"C:\Programs1\fenrir075c\fenrir.exe"
  Return
;; 変換 + 2 => F2
vk1Csc079 & 2::
  is_space = 0
  Send,{F2}
  Return
;; 変換 + 3 => F3
vk1Csc079 & 3::
  is_space = 0
  Send,{F3}
  Return
;; 変換 + 4 => F4
vk1Csc079 & 4::
  is_space = 0
  Send,{F4}
  Return
;; 変換 + 5 => F5
vk1Csc079 & 5::
  is_space = 0
  if GetKeyState("shift", "P"){
    Send, +{F5}
  }Else{
  Send,{F5}
  }
  Return
;; 変換 + 6 => F6
vk1Csc079 & 6::
  is_space = 0
  if GetKeyState("shift", "P"){
    Send, +{F6}
  }Else{
  Send,{F6}
  }
  Return
;; 変換 + 7 => F7
vk1Csc079 & 7::
  is_space = 0
  Send,{F7}
  Return
;; 変換 + 8 => F8
vk1Csc079 & 8::
  is_space = 0
  Send,{F8}
  Return
;; 変換 + 9 => F9
vk1Csc079 & 9::
  is_space = 0
  Send,{F9}
  Return
;; 変換 + 10 => F10
vk1Csc079 & 0::
  is_space = 0
  Send,{F10}
  Return
;; 変換 + 11 => F11
vk1Csc079 & -::
  is_space = 0
  Send,{F11}
  Return
;; 変換 + 12 => F12
vk1Csc079 & ^::
  is_space = 0
  Send,{F12}
  Return

;変換 + / => ctrl
vk1Csc079 & /::
is_ctrl = 1
Sleep, 1800
is_ctrl = 0
Return

;変換 + \ => custom
vk1Csc079 & vkE2::
is_custom = 1
Sleep, 1800
is_custom = 0
Return


;;###########
;; 変換 + A => 
;;###########
vk1Csc079 & a::
If is_ctrl
  Send, ^a
Return


;;###########
;; 変換 + B => 1単語左へ移動
;;###########
vk1Csc079 & b::
If is_ctrl
{
  Send, ^b
}
Else
{
  If is_space
    Send,{Shift Down}^{Left}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send,{Shift Down}^{Left}{Shift Up}
  Else
    Send,^{Left}
}
  Return


;;###########
;; 変換 + C => テスト1(メモ帳起動)
;;###########
;;上部に移動中


;;###########
;; 変換 + D => 文字列(前)削除
;;###########
vk1Csc079 & d::
If is_ctrl
{
  Send, ^d
}
Else
{
  is_space = 0
  Send,{Shift Down}^{Right}{Shift Up}{Del}
}
Return


;;###########
;; E
;;###########


;;###########
;; 変換 + F => 1単語右へ移動
;;###########
vk1Csc079 & f::
If is_ctrl
{
  Send, ^f
}
Else
{
  If is_space
    Send,{Shift Down}^{Right}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send,{Shift Down}^{Right}{Shift Up}
  Else
    Send,^{Right}
}
  Return


;;###########
;; 変換 + G =>
;;###########
vk1Csc079 & g::
If is_ctrl
  Send, ^g
Return


;;###########
;; 変換 + H => 文字列(後ろ)削除
;;###########
vk1Csc079 & h::
If is_ctrl
{
  Send, ^h
}
Else
{
  is_space = 0
  Send,{Shift Down}^{Left}{Shift Up}{BackSpace}
}
Return


;;###########
;; 変換 + I => 
;;###########
vk1Csc079 & i::
If is_ctrl
{
  Send, ^i
}
;Else
Return


;;###########
;; 変換 + J => 右クリック(マウス)
;;###########
vk1Csc079 & j:: 
If is_ctrl
{
  Send, ^j
}
Else
{
  is_space = 0
   Send,{Click down right}{Click up right}
}
Return


;;###########
;; 変換 + K => 
;;###########
vk1Csc079 & k::
If is_ctrl
{
  Send, ^k
}
else
{
  Send,{Click}{Click}
}
Return


;;###########
;; 変換 + L => 
;;###########
vk1Csc079 & l::
If is_ctrl
{
  Send, ^l
}
else
{
  Send,{Ctrl Down}{Click}{Ctrl Up}
}
Return


;;###########
;; 変換 + M => 
;;###########
vk1Csc079 & m::
If is_ctrl
{
  Send, ^m
}
Else
{
 WinGetPos,X,Y,W,H,A  ;アクティブウィンドウの左上座標(X,Y)とサイズ(W,H)
 MouseMove, W / 2, 10
}
Return


;;###########
;; 変換 + N => 次のタブへ移動
;;###########
vk1Csc079 & n::
If is_ctrl
{
  Send, ^n
}
Else
{
  is_space = 0
  Send,^{PgDn}
}
  Return


;;###########
;; 変換 + O => 
;;###########
vk1Csc079 & o::
If is_ctrl
  Send, ^o
Return


;;###########
;; 変換 + P => 前のタブへ移動
;;###########
vk1Csc079 & p::
  is_space = 0
  Send,^{PgUp}
  Return


;;###########
;; 変換 + Q => 
;;###########
vk1Csc079 & q::
If is_ctrl
{
  Send, ^q
}
;Else
Return


;;###########
;; 変換 + R => 
;;###########
vk1Csc079 & r::
If is_ctrl
  Send, ^r
Return


;;###########
;; 変換 + S => 
;;###########
vk1Csc079 & s::
If is_ctrl
{
  Send, ^s
}
Else
{
  Send, ^{Space}
}
Return


;;###########
;; 変換 + T => 
;;###########
vk1Csc079 & t::
If is_ctrl
{
  Send, ^t
}
;Else
Return


;;###########
;; 変換 + U => 
;;###########
vk1Csc079 & u::
If is_ctrl
  Send, ^u
Return


;;###########
;; 変換 + V => 前頁へ移動
;;###########
;上部に移動


;;###########
;; 変換 + W => コピー
;;###########
vk1Csc079 & w::
  is_space = 0
  Send,^c
  Return


;;###########
;; 変換 + X => 
;;###########


;;###########
;; 変換 + Y => 
;;###########


;;###########
;; 変換 + Z => 
;;###########


;;WinActive
;;※WinActiveが優先される
;;-------------------------------------------
;;コマンドプロンプト
;;-------------------------------------------
#If WinActive("ahk_class ConsoleWindowClass")
;;ctrl+vで張り付け
vk1Dsc07B & y::Send,!{Space}ep	;貼り付け
return
;; 無変換 + ] => Windows Shift S
vk1Dsc07B & ]::
  is_space = 0
  Send,{Shift Down}!s{Shift Up}
  WinWait,ahk_exe Boostnote.exe
  Send,cmd
  Return
#IfWinActive
;;-------------------------------------------


;;-------------------------------------------
;;GitBash用
;;-------------------------------------------
;;ctrl+vで張り付け
#If WinActive("ahk_class mintty")
vk1Dsc07B & y::Send,+{Ins}	;貼り付け
	return
#IfWinActive
;;-------------------------------------------


;;-------------------------------------------
;;Chrome用
;;-------------------------------------------
#IfWinActive ahk_class Chrome_WidgetWin_1
;; 無変換 + 1 => 改行の入力
vk1Dsc07B & 1::
  is_space = 0
  Send,{Enter}
  Return
;; 無変換 + 2 => Ctrl + T(新規タブ)
vk1Dsc07B & 2::
  is_space = 0
  Send,^t
  Return
;; 無変換 + 3 => 1文字左へ移動
vk1Dsc07B & 3::
  is_space = 0
  Send,!{Left}
  Return
;; 無変換 + 4 => 1単語右へ移動
vk1Dsc07B & 4::
  is_space = 0
  Send,!{Right}
  Return
;; F4 => F6
  F4::
  Send,{F6}
  return
;; 変換 + 4 => F6
vk1Csc079 & 4::
  Send,{F6}
  return
#IfWinActive
;;-------------------------------------------


;;-------------------------------------------
;;20170219追加
;;######################################
;;無変換(押しっぱなし)
;;######################################
;; 無変換 + J => 改行の入力
sc03a & j::
  is_space = 0
  If GetKeyState("ctrl", "P")
    Send, ^{Enter}
  Else if GetKeyState("shift", "P")
    Send, +{Enter}
  Else if GetKeyState("alt", "P")
    Send, !{Enter}
  Else
    Send,{Enter}
  Return
;; 無変換 + I => タブの入力
sc03a & i::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}{Tab}{Shift Up}
  Else
    Send,{Tab}
  Return
;; 無変換 + d => Deleteの入力
sc03a & d::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Right}{Shift Up}{Del}
  Else
    Send,{Del}
  Return
;; 無変換 + h => BackSpaceの入力
sc03a & h::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Left}{Shift Up}{BackSpace}
  Else
    Send,{BackSpace}
  Return
;; 無変換 + W => 切り取り
sc03a & w::
  is_space = 0
  Send,^x
  Return
;; 無変換 + Y => 貼り付け
sc03a & y::
  is_space = 0
  Send,^v
  Return
;; 無変換 + K => 行末までを切り取り
sc03a & k::
  is_space = 0
  Send,{Shift Down}{End}{Shift Up}^x
  Return
;; 無変換 + U => 行頭までを切り取り
sc03a & u::
  is_space = 0
  Send,{Shift Down}{Home}{Shift Up}^x
  Return

;; 無変換 + F => 1文字右へ移動
sc03a & f::
  If is_space
  {
    If GetKeyState("alt", "P"){
      Send,{Shift Down}^{Right}{Shift Up}
    }Else{
      Send,{Shift Down}{Right}{Shift Up}
    }
  }Else if GetKeyState("shift", "P"){
    Send, +{Right}
  }Else if GetKeyState("Alt", "P"){
    Send, ^{Right}
  }Else{
    Send,{Right}
  }
  Return
;; 無変換 + B => 1文字左へ移動
sc03a & b::
  If is_space
  {
    If GetKeyState("alt", "P"){
      Send,{Shift Down}^{Left}{Shift Up}
    }Else{
      Send,{Shift Down}{Left}{Shift Up}
    }
  }Else if GetKeyState("shift", "P"){
    Send, +{Left}
  }Else if GetKeyState("Alt", "P"){
    Send, ^{Left}
  }Else{
    Send,{Left}
  }
  Return
;; 無変換 + P => 1文字上へ移動
sc03a & p::
  If is_space
  {
    If GetKeyState("alt", "P"){
      Send,{Shift Down}^{Up}{Shift Up}
    }Else{
      Send,{Shift Down}{Up}{Shift Up}
    }
  }Else if GetKeyState("shift", "P"){
    Send, +{Up}
  }Else if GetKeyState("Alt", "P"){
    Send, ^{Up}
  }Else{
    Send,{Up}
  }
  Return
;; 無変換 + N => 1文字下へ移動
sc03a & n::
  If is_space
  {
    If GetKeyState("alt", "P"){
      Send,{Shift Down}^{Down}{Shift Up}
    }Else{
      Send,{Shift Down}{Down}{Shift Up}
    }
  }Else if GetKeyState("shift", "P"){
    Send, +{Down}
  }Else if GetKeyState("Alt", "P"){
    Send, ^{Down}
  }Else{
    Send,{Down}
  }
  Return

;; 無変換 + V => 次頁へ移動
sc03a & v::
  If is_space
  {
    If GetKeyState("alt", "P"){
      Send,{Shift Down}!{PgDn}{Shift Up}
    }Else{
      Send,{Shift Down}{PgDn}{Shift Up}
    }
  }Else if GetKeyState("shift", "P"){
    Send, +{PgDn}
  }Else if GetKeyState("Alt", "P"){
    Send, !{PgDn}
  }Else{
    Send,{PgDn}
  }

;; 無変換 + A => 行頭へ移動
sc03a & a::
  If is_space
    Send,{Shift Down}{Home}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send, +{Home}
  Else
    Send,{Home}
  Return
;; 無変換 + E => 行末へ移動
sc03a & e::
  If is_space
    Send,{Shift Down}{End}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send, +{End}
  Else
    Send,{End}
  Return

;; 無変換 + T => Ctrl + T
sc03a & t::
  is_space = 0
  If GetKeyState("shift", "P")  
    Send,{Shift Down}^{Tab}{Shift Up}
  Else
    Send,^{Tab}
  Return
;; 無変換 + C => Esc
sc03a & c::
  is_space = 0
  Send,{Esc}
  Return
;; 無変換 + > => Alt + Tab （タスクの切り替え）
sc03a & vkBEsc034 :: AltTab
  is_space = 0
  Return
;; 無変換 + < => Alt + Shift + Tab （タスクの切り替え）
sc03a & vkBCsc033 :: ShiftAltTab
  is_space = 0
  Return

;; 無変換 + Q => Ctrl + F4
sc03a & q::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^T{Shift Up}
  Else
    Send,^{F4}
  Return

;; 無変換 + S => 選択開始
sc03a & s:: is_space = 1
;; Alt => 選択解除
;~Alt:: is_space = 0
;; 無変換 + G => 選択解除
sc03a & g:: is_space = 0

;; 無変換 + / => 元に戻す
sc03a & /::
  is_space = 0
  Send,^z
  Return
;; 無変換 + \ => 元に戻す(逆)
sc03a & vkE2::
  is_space = 0
  Send,^y
  Return

;; 無変換 + O => 半角/全角
sc03a & o::
  is_space = 0
  Send,!{vkF3sc029}
  Return

;; 無変換 + Space => 選択開始
sc03a & Space::
  is_space = 1
  Return
