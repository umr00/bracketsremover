@echo off
setlocal ENABLEDELAYEDEXPANSION

rem �ꎞ�t�@�C����
set tmpoutput="tmpoutput.txt"

rem �h���b�O�h���b�v�����f�B���N�g�����̃t�@�C���i�T�u�f�B���N�g�����܂ށj�����Ԃɏ���
rem �T�u�f�B���N�g�����܂݂����Ȃ��ꍇ/s������
for /f %%a in ('dir /b /s %1\*.txt') do (
	type nul>tmpoutput
	for /f %%b in (%%a) do (
		set line=%%b
		set "tmp1=!line:(=!"
		set "tmp2=!tmp1:)=!"
		echo !tmp2!>>tmpoutput
	)
	rm %%a
	mv tmpoutput %%a
)
endlocal