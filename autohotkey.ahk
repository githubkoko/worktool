;;Shift +
;;Ctrl  ^
;;Alt   !
;;Win   #
; ���p/�S�p vkF3sc029/vkF4sc029
; �ϊ�      vk1Csc079
; ���ϊ�    vk1Dsc07B
; �Ђ炪�ȃJ�^�J�i    vkF2sc070 
#UseHook on
;;
;; CapsLock�̖��ϊ��͎��̃��W�X�g�����o�C�i���l�Őݒ肷��B
;;
;; \HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout\Scancode Map
;;
;; 0000  00 00 00 00 00 00 00 00
;; 0008  03 00 00 00 3A 00 7B 00
;; 0010  7B 00 3A 00
;;
;; �O���[�o���ϐ�
;;
;; �I����Ԃ��i�[����B(1:�I��)
is_space = 0

;; Ctrl������Ԃ��i�[����B(1:�I��)
is_ctrl = 0

;; �I����Ԃ��i�[����B(1:�I��)
is_custom = 0

;;
;; �ړ��n(�W��)
;;
;; ���ϊ� + F => 1�����E�ֈړ�
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
;; ���ϊ� + B => 1�������ֈړ�
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
;; ���ϊ� + P => 1������ֈړ�
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
;; ���ϊ� + N => 1�������ֈړ�
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

;; �ϊ� + F => 1�P��E�ֈړ�
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
;; �ϊ� + B => 1�P�ꍶ�ֈړ�
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
;; ���ϊ� + A => �s���ֈړ�
vk1Dsc07B & a::
  If is_space
    Send,{Shift Down}{Home}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send, +{Home}
  Else
    Send,{Home}
  Return
;; ���ϊ� + E => �s���ֈړ�
vk1Dsc07B & e::
  If is_space
    Send,{Shift Down}{End}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send, +{End}
  Else
    Send,{End}
  Return

;;���Ɉړ�
;; ���ϊ� + V => ���łֈړ�
;;vk1Dsc07B & v::
;;  If is_space
;;    Send,{Shift Down}{PgDn}{Shift Up}
;;  Else if GetKeyState("shift", "P")
;;    Send, +{PgDn}
;;  Else
;;    Send,{PgDn}
;;  Return
;; �ϊ� + V => �O�łֈړ�
;;vk1Csc079 & v::
;;  If is_space
;;    Send,{Shift Down}{PgUp}{Shift Up}
;;  Else if GetKeyState("shift", "P")
;;    Send, +{PgUp}
;;  Else
;;    Send,{PgUp}
;;  Return

;; �ϊ� + , => �t�@�C���̐擪�ֈړ�
vk1Csc079 & ,::
  If is_space
    Send,{Shift Down}^{Home}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send,{Shift Down}^{Home}{Shift Up}
  Else
    Send,^{Home}
  Return
;; �ϊ� + . => �t�@�C���̖����ֈړ�
vk1Csc079 & .::
  If is_space
    Send,{Shift Down}^{End}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send,{Shift Down}^{End}{Shift Up}
  Else
    Send,^{End}
  Return
;; �ϊ� + L => �X�N���[�������ֈړ��c�Ƃ�������15�s�㉺�Ɉړ�����
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
;; �ҏW�n(�W��)
;;
;; ���ϊ� + Space => �I���J�n
vk1Dsc07B & Space::
  is_space = 1
  Return
;; Alt => �I������
;~Alt:: is_space = 0
;; ���ϊ� + G => �I������
vk1Dsc07B & g:: is_space = 0
;; ���ϊ� + M => ���s�̓���
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
;; ���ϊ� + J => ���s�̓���
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
;; ���ϊ� + Tab => ���s�̓���
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
;; ���ϊ� + I => �^�u�̓���
vk1Dsc07B & i::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}{Tab}{Shift Up}
  Else
    Send,{Tab}
  Return
;; ���ϊ� + d => Delete�̓���
vk1Dsc07B & d::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Right}{Shift Up}{Del}
  Else
    Send,{Del}
  Return
;; ���ϊ� + h => BackSpace�̓���
vk1Dsc07B & h::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Left}{Shift Up}{BackSpace}
  Else
    Send,{BackSpace}
  Return
;; ���ϊ� + ���p/�S�p => BackSpace�̓���
vk1Dsc07B & sc029::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Left}{Shift Up}{BackSpace}
  Else
    Send,{BackSpace}
  Return
;; ���ϊ� + W => �؂���
vk1Dsc07B & w::
  is_space = 0
  Send,^x
  Return
;; �ϊ� + W => �R�s�[
vk1Csc079 & w::
  is_space = 0
  Send,^c
  Return
;; ���ϊ� + K => �s���܂ł�؂���
vk1Dsc07B & k::
  is_space = 0
  Send,{Shift Down}{End}{Shift Up}^x
  Return
;; ���ϊ� + U => �s���܂ł�؂���
vk1Dsc07B & u::
  is_space = 0
  Send,{Shift Down}{Home}{Shift Up}^x
  Return
;; ���ϊ� + Y => �\��t��
vk1Dsc07B & y::
  is_space = 0
  Send,^v
  Return
;; ���ϊ� + / => ���ɖ߂�
vk1Dsc07B & /::
  is_space = 0
  Send,^z
  Return
;; ���ϊ� + \ => ���ɖ߂�(�t)
vk1Dsc07B & vkE2::
  is_space = 0
  Send,^y
  Return
;; ���ϊ� + O => ���p/�S�p
vk1Dsc07B & o::
  is_space = 0
  Send,!{vkF3sc029}
  Return
;;
;; ���̑�(Emacs�Ƃ͖��֌W)
;;
;; �ϊ� + N => ���̃^�u�ֈړ�
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
;; �ϊ� + P => �O�̃^�u�ֈړ�
vk1Csc079 & p::
  is_space = 0
  Send,^{PgUp}
  Return
;; ���ϊ� + Enter => Alt + Enter
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
;; �ϊ� + 1 => F1
vk1Csc079 & 1::
  is_space = 0
  Send,{F1}
  Return
;; �ϊ� + 2 => F2
vk1Csc079 & 2::
  is_space = 0
  Send,{F2}
  Return
;; �ϊ� + 3 => F3
vk1Csc079 & 3::
  is_space = 0
  Send,{F3}
  Return
;; �ϊ� + 4 => F4
vk1Csc079 & 4::
  is_space = 0
  Send,{F4}
  Return
;; �ϊ� + 5 => F5
vk1Csc079 & 5::
  is_space = 0
  if GetKeyState("shift", "P"){
    Send, +{F5}
  }Else{
  Send,{F5}
  }
  Return
;; �ϊ� + 6 => F6
vk1Csc079 & 6::
  is_space = 0
  if GetKeyState("shift", "P"){
    Send, +{F6}
  }Else{
  Send,{F6}
  }
  Return
;; �ϊ� + 7 => F7
vk1Csc079 & 7::
  is_space = 0
  Send,{F7}
  Return
;; �ϊ� + 8 => F8
vk1Csc079 & 8::
  is_space = 0
  Send,{F8}
  Return
;; �ϊ� + 9 => F9
vk1Csc079 & 9::
  is_space = 0
  Send,{F9}
  Return
;; �ϊ� + 10 => F10
vk1Csc079 & 0::
  is_space = 0
  Send,{F10}
  Return
;; �ϊ� + 11 => F11
vk1Csc079 & -::
  is_space = 0
  Send,{F11}
  Return
;; �ϊ� + 12 => F12
vk1Csc079 & ^::
  is_space = 0
  Send,{F12}
  Return
;;
;; Windows�W����Ctrl�V���[�g�J�b�g�L�[�Ɠ�������
;;
;; ���ϊ� + R => Ctrl + R
vk1Dsc07B & r::
  is_space = 0
  Send,^r
  Return
;; ���ϊ� + ; => Ctrl + ;
vk1Dsc07B & vkBBsc027::
  is_space = 0
  Send,^;
  Return
;; ���ϊ� + : => Ctrl + :
vk1Dsc07B & vkBAsc028::
  is_space = 0
  Send,^:
  Return
;; ���ϊ� + WheelDown => Ctrl + WheelDown
vk1Dsc07B & WheelDown::
  is_space = 0
  Send,^{WheelDown}
  Return
;; ���ϊ� + WheelUp => Ctrl + WheelUp
vk1Dsc07B & WheelUp::
  is_space = 0
  Send,^{WheelUp}
  Return
;;-------------------------------------------
;;20161106�ǉ�
;; ���ϊ� + T => Ctrl + T
vk1Dsc07B & t::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Tab}{Shift Up}
  Else
    Send,^{Tab}
  Return
;; ���ϊ� + C => Esc
vk1Dsc07B & c::
  is_space = 0
  Send,{Esc}
  Return
;; ���ϊ� + > => Alt + Tab �i�^�X�N�̐؂�ւ��j
vk1Dsc07B & vkBEsc034 :: AltTab
  is_space = 0
  Return
;; ���ϊ� + < => Alt + Shift + Tab �i�^�X�N�̐؂�ւ��j
vk1Dsc07B & vkBCsc033 :: ShiftAltTab
  is_space = 0
  Return

;; ���ϊ� + Q => Ctrl + F4
vk1Dsc07B & q::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^T{Shift Up}
  Else
    Send,^{F4}
  Return
;; ���ϊ� + @ => Alt + F4 �i�A�v���I���j
;;vk1Dsc07B & vkC0sc01A :: 
;;  is_space = 0
;;  Send,!{F4}
;;  Return

;; ���ϊ� + 1 => Win1
vk1Dsc07B & 1::
  is_space = 0
  Send,#1
  Return
;; ���ϊ� + 2 => Win2
vk1Dsc07B & 2::
  is_space = 0
  Send,#2
  Return
;; ���ϊ� + 3 => Win3
vk1Dsc07B & 3::
  is_space = 0
  Send,#3
  Return
;; ���ϊ� + 4 => Win4
vk1Dsc07B & 4::
  is_space = 0
  Send,#4
  Return

;; ���ϊ� + S => Alt + PrintScreen
vk1Dsc07B & s:: 
  is_space = 0
  Send,!{PrintScreen}
  Return

;;WinActive
;;��WinActive���D�悳���

;;�R�}���h�v�����v�g�p
#If WinActive("ahk_class ConsoleWindowClass")
;;ctrl+v�Œ���t��
vk1Dsc07B & y::Send,!{Space}ep	;�\��t��
return
;; ���ϊ� + ] => Windows Shift S
vk1Dsc07B & ]::
  is_space = 0
  Send,{Shift Down}!s{Shift Up}
  WinWait,ahk_exe Boostnote.exe
  Send,cmd
  Return
#IfWinActive

;;GitBash�p
;;ctrl+v�Œ���t��
#If WinActive("ahk_class mintty")
vk1Dsc07B & y::Send,+{Ins}	;�\��t��
	return
#IfWinActive

;;Chrome�p
#IfWinActive ahk_class Chrome_WidgetWin_1
;; ���ϊ� + 1 => ���s�̓���
vk1Dsc07B & 1::
  is_space = 0
  Send,{Enter}
  Return
;; ���ϊ� + 2 => Ctrl + T(�V�K�^�u)
vk1Dsc07B & 2::
  is_space = 0
  Send,^t
  Return
;; ���ϊ� + 3 => 1�������ֈړ�
vk1Dsc07B & 3::
  is_space = 0
  Send,!{Left}
  Return
;; �ϊ� + 4 => 1�P��E�ֈړ�
vk1Dsc07B & 4::
  is_space = 0
  Send,!{Right}
  Return
;; F4 => F6
  F4::
  Send,{F6}
  return
;; �ϊ� + 4 => F6
vk1Csc079 & 4::
  Send,{F6}
  return
#IfWinActive

;;-------------------------------------------
;;20170101�ǉ�
;; �ϊ� + Space => �E�N���b�N
vk1Csc079 & Space:: 
If is_ctrl
{
  Send, ^{Space}
}
Else
{
  is_space = 0
;App�L�[�ɕύX  Send,+{F10}
   Send,{AppsKey}
}
  Return

;; �ϊ� + J => �E�N���b�N(�}�E�X)
vk1Csc079 & J:: 
  is_space = 0
   Send,{Click down right}{Click up right}
  Return

;; ���ϊ� + V => ���łֈړ�
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
;; �ϊ� + V => �O�łֈړ�
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

;;�ύX�O-------------------------------------------  
;; ���ϊ� + F => 1�����E�ֈړ�
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
;;; ���ϊ� + B => 1�������ֈړ�
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
;;; ���ϊ� + N => 1�s���ֈړ�
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
;;; ���ϊ� + P => 1�s��ֈړ�
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
;;�����܂�-------------------------------------------
;
;;-------------------------------------------
;;20170219�ǉ�
;; 
;F1 :: vk1Dsc07B
;  Return
;���ϊ�(caps)�ŉ������ςȂ��ɂȂ�
;������x�������ϊ��������Ɖ���
;cursor keys
;CapsLock + pbnf
;sc03a & p::send {Up}
;sc03a & b::send {Left}
;sc03a & n::send {Down}
;sc03a & f::send {Right}
;return

;; ���ϊ� + J => ���s�̓���
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
;; ���ϊ� + I => �^�u�̓���
sc03a & i::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}{Tab}{Shift Up}
  Else
    Send,{Tab}
  Return
;; ���ϊ� + d => Delete�̓���
sc03a & d::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Right}{Shift Up}{Del}
  Else
    Send,{Del}
  Return
;; ���ϊ� + h => BackSpace�̓���
sc03a & h::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^{Left}{Shift Up}{BackSpace}
  Else
    Send,{BackSpace}
  Return
;; ���ϊ� + W => �؂���
sc03a & w::
  is_space = 0
  Send,^x
  Return
;; ���ϊ� + Y => �\��t��
sc03a & y::
  is_space = 0
  Send,^v
  Return
;; ���ϊ� + K => �s���܂ł�؂���
sc03a & k::
  is_space = 0
  Send,{Shift Down}{End}{Shift Up}^x
  Return
;; ���ϊ� + U => �s���܂ł�؂���
sc03a & u::
  is_space = 0
  Send,{Shift Down}{Home}{Shift Up}^x
  Return

;; ���ϊ� + F => 1�����E�ֈړ�
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
;; ���ϊ� + B => 1�������ֈړ�
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
;; ���ϊ� + P => 1������ֈړ�
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
;; ���ϊ� + N => 1�������ֈړ�
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

;; ���ϊ� + V => ���łֈړ�
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

;; ���ϊ� + A => �s���ֈړ�
sc03a & a::
  If is_space
    Send,{Shift Down}{Home}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send, +{Home}
  Else
    Send,{Home}
  Return
;; ���ϊ� + E => �s���ֈړ�
sc03a & e::
  If is_space
    Send,{Shift Down}{End}{Shift Up}
  Else if GetKeyState("shift", "P")
    Send, +{End}
  Else
    Send,{End}
  Return

;; ���ϊ� + T => Ctrl + T
sc03a & t::
  is_space = 0
  If GetKeyState("shift", "P")  
    Send,{Shift Down}^{Tab}{Shift Up}
  Else
    Send,^{Tab}
  Return
;; ���ϊ� + C => Esc
sc03a & c::
  is_space = 0
  Send,{Esc}
  Return
;; ���ϊ� + > => Alt + Tab �i�^�X�N�̐؂�ւ��j
sc03a & vkBEsc034 :: AltTab
  is_space = 0
  Return
;; ���ϊ� + < => Alt + Shift + Tab �i�^�X�N�̐؂�ւ��j
sc03a & vkBCsc033 :: ShiftAltTab
  is_space = 0
  Return

;; ���ϊ� + Q => Ctrl + F4
sc03a & q::
  is_space = 0
  If GetKeyState("shift", "P")
    Send,{Shift Down}^T{Shift Up}
  Else
    Send,^{F4}
  Return

;; ���ϊ� + S => �I���J�n
sc03a & s:: is_space = 1
;; Alt => �I������
;~Alt:: is_space = 0
;; ���ϊ� + G => �I������
sc03a & g:: is_space = 0

;; ���ϊ� + / => ���ɖ߂�
sc03a & /::
  is_space = 0
  Send,^z
  Return
;; ���ϊ� + \ => ���ɖ߂�(�t)
sc03a & vkE2::
  is_space = 0
  Send,^y
  Return
;; ���ϊ� + O => ���p/�S�p
sc03a & o::
  is_space = 0
  Send,!{vkF3sc029}
  Return

;;-------------------------------------------
;�ϊ� + / => ctrl
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
;; ���ϊ� + - => ctrl + -
vk1Dsc07B & -::
  is_space = 0
  Send,^-
  Return
;; ���ϊ� + [ => Windows Shift E
vk1Dsc07B & [::
  is_space = 0
  Send,{Shift Down}!e{Shift Up}
  Return
;; ���ϊ� + ] => Windows Shift S
vk1Dsc07B & ]::
  is_space = 0
  Send,{Shift Down}!s{Shift Up}
  Return

;-------------------------------------------
;2017/03/11 SandS
;-------------------------------------------
;�p�~ Boostnote�Ɉړ�

;-------------------------------------------
;2017/04/09 �Z���̏����ݒ�
;-------------------------------------------
;ahk_class bosa_sdm_XL9
;ahk_exe EXCEL.EXE
;;Excel�p
#If WinActive("ahk_class bosa_sdm_XL9")
;;p��n��r�Eb��m��l�c
;; ���ϊ� + F => �E
vk1Dsc07B & f::
MouseClick, left, 521, 482
  Return
;; ���ϊ� + B => ��
vk1Dsc07B & b::
MouseClick, left, 312, 482
  Return
;; ���ϊ� + P => ��
vk1Dsc07B & p::
MouseClick, left, 256, 303
  Return
;; ���ϊ� + N => ��
vk1Dsc07B & n::
MouseClick, left, 256, 437
  Return
;; ���ϊ� + M => ��
vk1Dsc07B & m::
MouseClick, left, 256, 369
  Return
;; ���ϊ� + L => �c
vk1Dsc07B & l::
MouseClick, left, 417, 482
  Return
;; ���ϊ� + S => ��
vk1Dsc07B & s::
MouseClick, left, 81, 355
  Return
#IfWinActive