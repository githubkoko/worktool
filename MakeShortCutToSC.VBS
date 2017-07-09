Dim WSH, FSO, SC, PATH, FILE

'Shell関連の操作を提供するオブジェクトを取得 'set = newしているのと同じ
Set WSH=CreateObject("WScript.Shell")
'ファイルの読み書きに使用できるtextStreamオブジェクトを取得
Set FSO=CreateObject("Scripting.FileSystemObject")

'起動パスを取得する(現在右クリックしているファイル)
'PATH = 
PATH = FSO.GetParentFolderName(WScript.Arguments(0))&"\"&FSO.GetFileName(WScript.Arguments(0))
'ショートカットのファイル名を設定
FILE = FSO.GetFileName(WScript.Arguments(0))&"_SC.lnk"
Set SC = WSH.CreateShortcut("C:\Users\KYOUHEI\Desktop\WS\SC"&"\"&FILE)

'起動パスの設定(フルパス)
SC.TargetPath = PATH
SC.Save

'MsgBox(PATH)