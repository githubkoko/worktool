;;Shift +
;;Ctrl  ^
;;Alt   !
;;Win   #
; 半角/全角 vkF3sc029/vkF4sc029
; 変換      vk1Csc079
; 無変換    vk1Dsc07B
; ひらがなカタカナ    vkF2sc070 
#UseHook on
;;
;; CapsLock⇔無変換は次のレジストリをバイナリ値で設定する。
;;
;; \HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout\Scancode Map
;;
;; 0000  00 00 00 00 00 00 00 00
;; 0008  03 00 00 00 3A 00 7B 00
;; 0010  7B 00 3A 00
;;
;; グローバル変数
;;
;; 選択状態を格納する。(1:選択中)
is_space = 0

;; Ctrl押下状態を格納する。(1:選択中)
is_ctrl = 0

;; 選択状態を格納する。(1:選択中)
is_custom = 0

;;
;; 移動系(標準)
;;
;; 無変換 + F => 1文字右へ移動
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
;; 無変換 + B => 1文字左へ移動
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
;; 無変換 + P => 1文字上へ移動
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
;; 無変換 + N => 1文字下へ移動
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

;; 変換 + F => 1単語右へ移動
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
;; 変換 + B => 1単語左へ移動
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
;; 無変換 + A => 行頭へ移動
vk1Dsc07B & a::
  If is_space
    Send,{Shift Down}{Home}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send, +{Home}
  Else
    Send,{Home}
  Return
;; 無変換 + E => 行末へ移動
vk1Dsc07B & e::
  If is_space
    Send,{Shift Down}{End}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send, +{End}
  Else
    Send,{End}
  Return

;;下に移動
;; 無変換 + V => 次頁へ移動
;;vk1Dsc07B & v::
;;  If is_space
;;    Send,{Shift Down}{PgDn}{Shift Up}
;;  Else if GetKeyState("shift", "P")
;;    Send, +{PgDn}
;;  Else
;;    Send,{PgDn}
;;  Return
;; 変換 + V => 前頁へ移動
;;vk1Csc079 & v::
;;  If is_space
;;    Send,{Shift Down}{PgUp}{Shift Up}
;;  Else if GetKeyState("shift", "P")
;;    Send, +{PgUp}
;;  Else
;;    Send,{PgUp}
;;  Return

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
;; 変換 + L => スクリーン中央へ移動…としたいが15行上下に移動する
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
;;
;; 編集系(標準)
;;
;; 無変換 + Space => 選択開始
vk1Dsc07B & Space::
  is_space = 1
  Return
;; Alt => 選択解除
;~Alt:: is_space = 0
;; 無変換 + G => 選択解除
vk1Dsc07B & g:: is_space = 0
;; 無変換 + M => 改行の入力
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
;; 無変換 + J => 改行の入力
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
;; 無変換 + Tab => 改行の入力
vk1Dsc07B & Tab::
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
vk1Dsc07B & i::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}{Tab}{Shift Up}
  Else
    Send,{Tab}
  Return
;; 無変換 + d => Deleteの入力
vk1Dsc07B & d::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Right}{Shift Up}{Del}
  Else
    Send,{Del}
  Return
;; 無変換 + h => BackSpaceの入力
vk1Dsc07B & h::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Left}{Shift Up}{BackSpace}
  Else
    Send,{BackSpace}
  Return
;; 無変換 + 半角/全角 => BackSpaceの入力
vk1Dsc07B & sc029::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Left}{Shift Up}{BackSpace}
  Else
    Send,{BackSpace}
  Return
;; 無変換 + W => 切り取り
vk1Dsc07B & w::
  is_space = 0
  Send,^x
  Return
;; 変換 + W => コピー
vk1Csc079 & w::
  is_space = 0
  Send,^c
  Return
;; 無変換 + K => 行末までを切り取り
vk1Dsc07B & k::
  is_space = 0
  Send,{Shift Down}{End}{Shift Up}^x
  Return
;; 無変換 + U => 行頭までを切り取り
vk1Dsc07B & u::
  is_space = 0
  Send,{Shift Down}{Home}{Shift Up}^x
  Return
;; 無変換 + Y => 貼り付け
vk1Dsc07B & y::
  is_space = 0
  Send,^v
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
;; 無変換 + O => 半角/全角
vk1Dsc07B & o::
  is_space = 0
  Send,!{vkF3sc029}
  Return
;;
;; その他(Emacsとは無関係)
;;
;; 変換 + N => 次のタブへ移動
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
;; 変換 + P => 前のタブへ移動
vk1Csc079 & p::
  is_space = 0
  Send,^{PgUp}
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
;; 変換 + 1 => F1
vk1Csc079 & 1::
  is_space = 0
  Send,{F1}
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
;;
;; Windows標準のCtrlショートカットキーと同じ動作
;;
;; 無変換 + R => Ctrl + R
vk1Dsc07B & r::
  is_space = 0
  Send,^r
  Return
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
;;-------------------------------------------
;;20161106追加
;; 無変換 + T => Ctrl + T
vk1Dsc07B & t::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Tab}{Shift Up}
  Else
    Send,^{Tab}
  Return
;; 無変換 + C => Esc
vk1Dsc07B & c::
  is_space = 0
  Send,{Esc}
  Return
;; 無変換 + > => Alt + Tab （タスクの切り替え）
vk1Dsc07B & vkBEsc034 :: AltTab
  is_space = 0
  Return
;; 無変換 + < => Alt + Shift + Tab （タスクの切り替え）
vk1Dsc07B & vkBCsc033 :: ShiftAltTab
  is_space = 0
  Return

;; 無変換 + Q => Ctrl + F4
vk1Dsc07B & q::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^T{Shift Up}
  Else
    Send,^{F4}
  Return
;; 無変換 + @ => Alt + F4 （アプリ終了）
;;vk1Dsc07B & vkC0sc01A :: 
;;  is_space = 0
;;  Send,!{F4}
;;  Return

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

;; 無変換 + S => Alt + PrintScreen
vk1Dsc07B & s:: 
  is_space = 0
  Send,!{PrintScreen}
  Return

;;WinActive
;;※WinActiveが優先される

;;コマンドプロンプト用
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

;;GitBash用
;;ctrl+vで張り付け
#If WinActive("ahk_class mintty")
vk1Dsc07B & y::Send,+{Ins}	;貼り付け
	return
#IfWinActive

;;Chrome用
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
;; 変換 + 4 => 1単語右へ移動
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
;;20170101追加
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

;; 変換 + J => 右クリック(マウス)
vk1Csc079 & J:: 
  is_space = 0
   Send,{Click down right}{Click up right}
  Return

;; 無変換 + V => 次頁へ移動
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
;; 変換 + V => 前頁へ移動
vk1Csc079 & v::
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

;;変更前-------------------------------------------  
;; 無変換 + F => 1文字右へ移動
;vk1Dsc07B & f::
;  If is_space
;    Send,{Shift Down}{Right}{Shift Up}
;  Else if GetKeyState("alt", "P")
;    Send, ^{Right}
;  Else if GetKeyState("shift", "P")
;    Send, +{Right}
;  Else
;    Send,{Right}
;  Return
;;; 無変換 + B => 1文字左へ移動
;vk1Dsc07B & b::
;  If is_space
;    Send,{Shift Down}{Left}{Shift Up}
;  Else if GetKeyState("alt", "P")
;    Send, ^{Left}
;  Else if GetKeyState("shift", "P")
;    Send, +{Left}
;  Else
;    Send,{Left}
;  Return
;;; 無変換 + N => 1行下へ移動
;vk1Dsc07B & n::
;  If is_space
;    Send,{Shift Down}{Down}{Shift Up}
;  Else if GetKeyState("alt", "P")
;    Send, ^{Down}
;  Else if GetKeyState("shift", "P")
;    Send, +{Down}
;  Else
;    Send,{Down}
;  Return
;;; 無変換 + P => 1行上へ移動
;vk1Dsc07B & p::
;  If is_space
;    Send,{Shift Down}{Up}{Shift Up}
;  Else if GetKeyState("alt", "P")
;    Send, ^{Up}
;  Else if GetKeyState("shift", "P")
;    Send, +{Up}
;  Else
;    Send,{Up}
;  Return
;;ここまで-------------------------------------------
;
;;-------------------------------------------
;;20170219追加
;; 
;F1 :: vk1Dsc07B
;  Return
;無変換(caps)で押しっぱなしになる
;もう一度押すか変換を押すと解除
;cursor keys
;CapsLock + pbnf
;sc03a & p::send {Up}
;sc03a & b::send {Left}
;sc03a & n::send {Down}
;sc03a & f::send {Right}
;return

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

;;-------------------------------------------
;変換 + / => ctrl
vk1Csc079 & /::
is_ctrl = 1
Sleep, 1800
is_ctrl = 0
Return

vk1Csc079 & vkE2::
is_custom = 1
Sleep, 1800
is_custom = 0
Return

vk1Csc079 & c::
If is_ctrl
{
  Send, ^c
}
If is_custom
{
  ;Run,"C:\Program Files (x86)\sakura\sakura.exe"
  Run,"C:\Windows\System32\notepad.exe"
}
Return



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

vk1Csc079 & a::
If is_ctrl
  Send, ^a
Return

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

vk1Csc079 & u::
If is_ctrl
  Send, ^u
Return

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

vk1Csc079 & g::
If is_ctrl
  Send, ^g
Return

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

vk1Csc079 & r::
If is_ctrl
  Send, ^r
Return

vk1Csc079 & o::
If is_ctrl
  Send, ^o
Return

vk1Csc079 & m::
If is_ctrl
{
  Send, ^m
}
Else
{
  MouseMove, A_CaretX * 1.47, A_CaretY * 1.29
}
Return

;-------------------------------------------
;; 無変換 + - => ctrl + -
vk1Dsc07B & -::
  is_space = 0
  Send,^-
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

;-------------------------------------------
;2017/03/11 SandS
;-------------------------------------------
;廃止 Boostnoteに移動

;-------------------------------------------
;2017/04/09 セルの書式設定
;-------------------------------------------
;ahk_class bosa_sdm_XL9
;ahk_exe EXCEL.EXE
;;Excel用
#If WinActive("ahk_class bosa_sdm_XL9")
;;p上n下r右b左m横l縦
;; 無変換 + F => 右
vk1Dsc07B & f::
MouseClick, left, 521, 482
  Return
;; 無変換 + B => 左
vk1Dsc07B & b::
MouseClick, left, 312, 482
  Return
;; 無変換 + P => 上
vk1Dsc07B & p::
MouseClick, left, 256, 303
  Return
;; 無変換 + N => 下
vk1Dsc07B & n::
MouseClick, left, 256, 437
  Return
;; 無変換 + M => 横
vk1Dsc07B & m::
MouseClick, left, 256, 369
  Return
;; 無変換 + L => 縦
vk1Dsc07B & l::
MouseClick, left, 417, 482
  Return
;; 無変換 + S => 線
vk1Dsc07B & s::
MouseClick, left, 81, 355
  Return
#IfWinActive