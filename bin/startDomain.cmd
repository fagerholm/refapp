@echo off

set FILE_PATH=%~dp0

call %FILE_PATH%env.cmd

call %ASADMIN_CMD% start-database

call %ASADMIN_CMD% start-domain %DOMAIN%