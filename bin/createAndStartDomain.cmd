@echo off

set FILE_PATH=%~dp0

call %FILE_PATH%createDomain.cmd
if not (%ERRORLEVEL%)==(0) goto ERROR

call %FILE_PATH%startDomain.cmd
if not (%ERRORLEVEL%)==(0) goto ERROR

:ERROR
exit /B 1

:EOF
exit /B 0