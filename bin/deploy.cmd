@echo off

set FILE_PATH=%~dp0

call %FILE_PATH%env.cmd

call %ASADMIN_CMD% deploy --contextroot %CONTEXT_ROOT% --name %APP_NAME% %EAR_FILE%
