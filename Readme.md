# 概要
金沢工業大学のWiFiへの接続と切断を行うスクリプト.  
connect_kit_wifi.ps1でWiFiへの接続とプロキシの有効化･設定を行える.  
disconnect_kit_wifi.ps1でWiFiの切断とプロキシの無効化を行える.  

想定している用途は以下の通り  
・学内WiFiに接続してプロキシを設定する.  
・WiFiの調子が悪いときに接続し直す.  
・WiFiを切断してプロキシを無効化する.  

connect_kit_wifi.ps1の動作  
1. WiFiの切断
2. KIT-WLAP2への接続
3. プロキシの有効化
4. プロキシサーバの設定
5. プロキシを使用しないIPアドレスの設定
6. インターネットオプションのリフレッシュ.(ブラウザに設定を反映させるために必要)

disconnect_kit_wifi.ps1の動作  
1. WiFiの切断
2. プロキシの無効化
3. インターネットオプションのリフレッシュ.(ブラウザに設定を反映させるために必要)


# インストール手順
事前にVisual Studio と Git for Windows がインストールされていること.
以下のことを聞かれたから｢A｣を入力してエンターを押すこと.  
```Do you want to run software from this untrusted publisher?```


1. PowerShellを管理者権限で実行する.  
以下のコマンドを実行する.  
```
Set-ExecutionPolicy AllSigned -Scope CurrentUser -Force
# 署名用の証明書を作成
$cert = New-SelfSignedCertificate `
        -Subject "CN=PowerShellスクリプト署名用証明書" `
        -KeyAlgorithm RSA `
        -KeyLength 2048 `
        -Type CodeSigningCert `
        -CertStoreLocation Cert:\CurrentUser\My\ `
        -NotAfter ([datetime]"2099/01/01")
# 信頼済みのルートとして使用
Move-Item "Cert:\CurrentUser\My\$($cert.Thumbprint)" Cert:\CurrentUser\Root

```

2. 管理者権限なしでPowerShellを開き直す. (後で使うので閉じないこと)
以下のコマンドを実行する. 学内にいる場合はgitのプロキシを設定すること.  
```
cd ~
git clone https://github.com/torippy917/kit_wifi.git
start kit_wifi\RefleshInternetOption\RefleshInternetOption.vcxproj

```

3. VisualStudioが開くので, X64, Releaseに設定してプログラムをビルドする.


4. PowerShellスクリプトに署名する.
2.で開いたPowerShellで以下のコマンドを実行する.  
```
cd ~/kit_wifi/
# 証明書への参照を取得
$rootcert = @(Get-ChildItem cert:\CurrentUser\Root -CodeSigningCert)[0]
# スクリプトに署名
Set-AuthenticodeSignature .\connect_kit_wifi.ps1 $rootcert
Set-AuthenticodeSignature .\disconnect_kit_wifi.ps1 $rootcert

```

# 使い方
connect_kit_wifi.ps1 または disconnect_kit_wifi.ps1をPowerShellで実行する.