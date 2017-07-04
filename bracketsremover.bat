@echo off
setlocal ENABLEDELAYEDEXPANSION

rem 一時ファイル名
set tmpoutput="tmpoutput.txt"

rem ドラッグドロップしたディレクトリ内のファイル（サブディレクトリも含む）を順番に処理
rem サブディレクトリを含みたくない場合/sを消す
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