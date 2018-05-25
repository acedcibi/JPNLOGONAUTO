REM IJPN System Copy Files Script Version 2
REM Last Update: 25/05/2018 BY RASYID INFOMINA

rem /R - overwrite read-only files
rem /S - copy subdirectories
rem /E - copy empty subdirectories
rem /C - continue on error occur
rem /F - show full path filename

REM TO CHECK IF WORKSATATION IS WINDOWS 2000 VERSION

REM GET OS VERSION AND SAVE TO FILE
VER > OSVERSION.TXT

REM CHECK INSIDE FILE FOR ANY WORD OF 2000
FINDSTR "2000" OSVERSION.TXT > NUL: 2>&1

REM IF ERRORLEVEL 0 THEN GOTO STATUS0 = SEARCH SUCCESSFULL
REM IF ERRORLEVEL 1 THEN GOTO STATUS1 = SEARCH UNSUCCESSFULL

GOTO STATUS%ERRORLEVEL%

:STATUS0
REM WINDOWS 2000 - POPUP TETINGKAP PEMBERITAHUAN SALIN FAIL SECARA MANUAL DAN MULAKAN PROGRAM SALINFAIL.EXE

D:
CD \JPNAPPL\BIN

START CMD /C "MODE 60,15 &TITLE PEMBERITAHUAN WINDOWS 2000 &COLOR 1E &ECHO.&ECHO.&ECHO.&ECHO.  Salin fail secara MANUAL perlu dilakukan &ECHO.  bagi workstation WINDOWS 2000. &ECHO.&ECHO.  Sila tekan [ENTER] untuk Salin Fail atau hubungi &ECHO.  pihak HelpDesk untuk bantuan... &ECHO.&ECHO.&pause>NUL &START SALINFAIL.EXE"
GOTO END

:STATUS1
REM SALIN FAIL STARTED FOR WINDOWS 7 WORKSATATION

SET SERVERNAME=%USERDOMAIN%001
CLS
D:

taskkill /IM locksystem.exe

ECHO Penyalinan Fail-fail BIN ...
CD\JPNAPPL\BIN
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\BIN\*.*    D:\JPNAPPL\BIN  /R/S/E/C/F/Y
ECHO.
ECHO.

ECHO Penyalinan Fail-fail BINV6...
CD\JPNAPPL\BINV6
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\BINV6\*.*    D:\JPNAPPL\BINV6  /R/S/E/C/F/Y
ECHO.
ECHO.

ECHO Penyalinan Fail-fail FIL ...
CD\JPNAPPL\FIL
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\FIL\*.*    D:\JPNAPPL\FIL   /R/S/E/C/F/Y
ECHO.
ECHO.

ECHO Penyalinan Fail-fail INI ...
CD\JPNAPPL\INI
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\INI\*.*    D:\JPNAPPL\INI   /R/S/E/C/F/Y
ECHO.
ECHO.

ECHO Penyalinan Fail-fail PRM ...
CD\JPNAPPL\PRM
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\PRM\*.*    D:\JPNAPPL\PRM   /R/S/E/C/F/Y
ECHO.
ECHO.

ECHO Penyalinan Fail-fail REF ...
CD\JPNAPPL\REF
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\REF\*.*    D:\JPNAPPL\REF   /R/S/E/C/F/Y
ECHO.
ECHO.

CALL CPYCADTYPE.CMD

ECHO Penyalinan Fail-fail MYKAD ...
CD\JPNAPPL\MYKAD
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MYKADPATCH\MyKadPatch.exe   D:\JPNAPPL\MYKAD  /R/S/E/C/F/Y
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MYKADPATCH\Version.ini      D:\JPNAPPL\MYKAD  /R/S/E/C/F/Y
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MYKADPATCH\PatchMyKad.msi   D:\JPNAPPL\MYKAD  /R/S/E/C/F/Y
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MYKADPATCH\VersionCheck.exe   D:\JPNAPPL\MYKAD  /R/S/E/C/F/Y
ECHO.
ECHO.

ECHO Penyalinan Fail-fail OCX ...

%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MYKADPATCH\vbalProgBar6.ocx    %SystemRoot%\system32  /R/S/E/C/F/Y
ECHO.
ECHO.

CALL MYKADPATCH.EXE

SET SERVERNAME=

CD \JPNAPPL\BIN

ECHO PENYALINAN SELESAI! SILA LOGOFF DAN LOGIN SEMULA SISTEM.
ECHO.
ECHO Sila Tekan Mana-mana Kekunci untuk teruskan...
ECHO.

REM POPUP TETINGKAP SALIN FAIL BERJAYA DAN LOGOFF SISTEM
START popup.vbs

GOTO END

:END
EXIT
