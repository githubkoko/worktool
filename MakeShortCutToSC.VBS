Dim WSH, FSO, SC, PATH, FILE

'Shell�֘A�̑����񋟂���I�u�W�F�N�g���擾 'set = new���Ă���̂Ɠ���
Set WSH=CreateObject("WScript.Shell")
'�t�@�C���̓ǂݏ����Ɏg�p�ł���textStream�I�u�W�F�N�g���擾
Set FSO=CreateObject("Scripting.FileSystemObject")

'�N���p�X���擾����(���݉E�N���b�N���Ă���t�@�C��)
'PATH = 
PATH = FSO.GetParentFolderName(WScript.Arguments(0))&"\"&FSO.GetFileName(WScript.Arguments(0))
'�V���[�g�J�b�g�̃t�@�C������ݒ�
FILE = FSO.GetFileName(WScript.Arguments(0))&"_SC.lnk"
Set SC = WSH.CreateShortcut("C:\Users\KYOUHEI\Desktop\WS\SC"&"\"&FILE)

'�N���p�X�̐ݒ�(�t���p�X)
SC.TargetPath = PATH
SC.Save

'MsgBox(PATH)