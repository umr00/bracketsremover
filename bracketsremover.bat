@echo off

call :SEARCHFILE %1
goto :END

:SEARCHFILE
	set objectdir=%1
	for /f  "delims="   %%a in ('dir /a-d /b /s %objectdir%') do (
		echo %%a
		call :RENAMEFILE "%%a"
	)
	exit /B 


:RENAMEFILE
	set originalfilename=%1
	set tmp1=%originalfilename:(=%
	set convertedfilename=%tmp1:)=%
	if not %originalfilename% == %convertedfilename% move %originalfilename% %convertedfilename%
	exit /B 

:END

