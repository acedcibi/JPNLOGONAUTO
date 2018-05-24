Dim obj,boxmsg
Set obj = WScript.CreateObject ("WScript.shell")

'POPUP MESSAGE BOX
boxmsg=msgbox("SALIN FAIL TELAH BERJAYA.. SILA LOGOFF DAN LOGIN SEMULA SISTEM. KLIK BUTANG [OK] UNTUK LOGOFF SISTEM.",64,"PERHATIAN") 

'LOGOFF USER AFTER CLICKED OK BUTTON
obj.run "cmd /c prgLogOffSystem", 2
Set obj = Nothing