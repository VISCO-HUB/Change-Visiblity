SET WINRAR="%PROGRAMFILES%\WinRAR\WinRAR.exe"
SET NAME=02-Change-Visiblity
DEL /F /Q %NAME%.mzp 
%WINRAR% a %NAME%.zip *.* -x*.bat -x*.mzp
RENAME %NAME%.zip %NAME%.mzp

PAUSE