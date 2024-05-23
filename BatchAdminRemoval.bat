@echo off
setlocal enableextensions enabledelayedexpansion

if not exist "C:\temp" mkdir C:\temp
cd C:\temp

net user /add admin01 Admin01-Pass!
timeout /t 1
net localgroup Administrators /add admin01
timeout /t 1

net user Administrator /active:no
net localgroup Administrators | findstr /B /V ".*itadmin" | findstr /B /V "CompanyAdmin" | findstr /B /V "Calvin" | findstr /B /V "admin01" | findstr /B /V ".*\Domain Admins" > adminusers.txt
more adminusers.txt

set "startLine=-------------------------------------------------------------------------------"
set "endLine=The command completed successfully."
set "inputFile=adminusers.txt"
set "outputFile=outputFile.txt"

:: Extract relevant lines from the list
for /F "tokens=*" %%i in (%inputFile%) do (
    set "line=%%i"
    if "!line!"=="!startLine!" (
        set "start=1"
    ) else if "!line!"=="!endLine!" (
        set "start=0"
    ) else if defined start (
        echo %%i >> %outputFile%
    )
)

del %inputFile%
rename %outputFile% %inputFile%

:: Process each user from the list
for /F "tokens=*" %%i in (%inputFile%) do (
    set "user=%%i"
    :: Remove leading and trailing spaces from the username
    for /f "tokens=* delims= " %%j in ("!user!") do set user=%%j
    for /l %%k in (1,1,31) do if "!user:~-1!"==" " set "user=!user:~0,-1!"
    echo Removing user: "!user!" from Administrators group
    net localgroup Administrators "!user!" /delete
)

del C:\temp\adminusers.txt
