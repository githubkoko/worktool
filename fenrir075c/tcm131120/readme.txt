Tablacus Context Menu

Run the context menu from the command line.
Usage:
tcm64 [options] Item [Item 2]...

Run the context menu of 64-bit
tcm32 [options] Item [Item 2]...

Run the context menu of 32-bit

Options:
-x X-coordinate to display the context menu.
   The default is the x coordinate of mouse cursor
-y Y-coordinate to display the context menu.
   The default is the y coordinate of mouse cursor
-Directory Working directory. The default is NULL
-Parameter Parameter. The default is NULL
-Show SW_ values. The default is SW_SHOWNORMAL
-fMask CMIC_MASK_ values
-Flags Optional flags. The default is 0 (CMF_NORMAL)
-Timer Tablacus ContextMenu timer ends after command execution. The default is 1
-Invoke Run the command with the name.
-Drop Right-button Drag-and-drop Menu
-grfKeyState Drag-and-drop Button state

e.g.:
tcm64 -x 500 -y 200 C:\hoge\fuga c:\hoge\piyo
tcm32 -x 500 -y 200 C:\hoge\fuga c:\hoge\piyo
tcm64 -Invoke "*Microsoft Security Essentials*" C:\hoge\fuga
tcm32 -Invoke "*Microsoft Security Essentials*" C:\hoge\fuga
tcm64 -Drop C:\hoge\fuga C:\fuga.txt
tcm32 -Drop C:\hoge\fuga C:\fuga.txt

Notes
Please specify the item in the same folder.
If no valid entry window is displayed.
And if you drag and drop, perform a context menu.

License
Copyright (c) 2011- Gaku
Licensed under the MIT License:
http://www.opensource.org/licenses/mit-license.php

Build
Visual C++ 2008 Express Edition SP1
Windows SDK v7.0

http://www.eonet.ne.jp/~gakana/tablacus/
