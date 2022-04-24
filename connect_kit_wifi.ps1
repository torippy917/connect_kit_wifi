netsh wlan disconnect
netsh wlan connect name=KIT-WLAP2
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /f /v ProxyEnable /t reg_dword /d 1
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /f /v ProxyServer /t reg_sz /d http://wwwproxy.kanazawa-it.ac.jp:8080
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /f /v ProxyOverride /t reg_sz /d "*.kanazawa-it.ac.jp;*.ict-kanazawa.ac.jp;*.kanazawa-tc.ac.jp;*.kitnet.jp;*.eagle-net.ne.jp;*.eagle-net.jp;10.*;172.16.*;172.17.*;172.18.*;172.20.*;172.24.*;172.26.*;172.27.*;172.30.*;192.168.*;iogate2;<local>"
.\RefleshInternetOption\x64\Release\RefleshInternetOption.exe