REM IJPN System Copy Files Script Version 2
REM MSO300 BIO DEVICE WITH ET CAMERA
REM Last Update: 17/05/2018 BY RASYID INFOMINA

rem /R - overwrite read-only files
rem /S - copy subdirectories
rem /E - copy empty subdirectories
rem /C - continue on error occur
rem /F - show full path filename

SET SERVERNAME=%USERDOMAIN%001
CLS
D:

NET STOP CHECKSYSTEMIDLE

ECHO Penyalinan Fail-fail BIN ...
CD\JPNAPPL\BIN

%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\BIN\*.*    D:\JPNAPPL\BIN  /R/S/E/C/F/y
ECHO .
ECHO.

ECHO Penyalinan Fail-fail BINV6...
CD\JPNAPPL\BINV6
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\BINV6\*.*    D:\JPNAPPL\BINV6  /R/S/E/C/F/y
ECHO .
ECHO.


ECHO Penyalinan Fail-fail PRM ...
CD\JPNAPPL\PRM
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\PRM\*.*    D:\JPNAPPL\PRM   /R/S/E/C/F/y
ECHO .
ECHO.

ECHO Penyalinan Fail-fail FIL ...
CD\JPNAPPL\FIL
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\FIL\*.*    D:\JPNAPPL\FIL   /R/S/E/C/F/y
ECHO .
ECHO.

ECHO Penyalinan Fail-fail INI ...
CD\JPNAPPL\INI
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\INI\*.*    D:\JPNAPPL\INI   /R/S/E/C/F/y
ECHO .
ECHO.

ECHO Penyalinan Fail-fail REF ...
CD\JPNAPPL\REF
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\REF\*.*    D:\JPNAPPL\REF   /R/S/E/C/F/y
ECHO .
ECHO.

NET START CHECKSYSTEMIDLE

ECHO Penyalinan Fail-fail ETMSO300 ...
CD\JPNAPPL\BIN
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MSO300\*.*    D:\JPNAPPL\BINV6  /R/S/E/C/F/y
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MSO300\ODS.INI    D:\JPNAPPL\INI   /R/S/E/C/F/y

ECHO .
ECHO Penyalinan Fail-fail MSO300 dengan Kamera ET ...

ECHO Penyalinan Fail-fail MYKAD ...
CD\JPNAPPL\MYKAD
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MYKADPATCH\MyKadPatch.exe   D:\JPNAPPL\MYKAD  /R/S/E/C/F/y
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MYKADPATCH\Version.ini      D:\JPNAPPL\MYKAD  /R/S/E/C/F/y
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MYKADPATCH\CopyMyKadFiles2K.cmd	D:\JPNAPPL\MYKAD  /R/S/E/C/F/y
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MYKADPATCH\VersionCheck.exe	D:\JPNAPPL\MYKAD  /R/S/E/C/F/y
%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MYKADPATCH\PatchMyKad.msi	D:\JPNAPPL\MYKAD  /R/S/E/C/F/y
ECHO .
ECHO.

ECHO Penyalinan Fail-fail OCX ...

%SystemRoot%\system32\XCOPY  \\%SERVERNAME%\JPNAPPL\MYKADPATCH\vbalProgBar6.ocx    %SystemRoot%\system32  /R/S/E/C/F/y
ECHO .
ECHO.

SET SERVERNAME=
ECHO PENYALINAN SELESAI!!!
ECHO PENYALINAN MSO300 dengan Kamera ET SELESAI!!!
ECHO Sila Tekan Mana-mana Kekunci ...
ECHO.
CALL MYKADPATCH.EXE
CD\JPNAPPL\BIN

REM POPUP TETINGKAP SALIN FAIL BERJAYA DAN LOGOFF SISTEM
START popup.vbs

pause > NUL
