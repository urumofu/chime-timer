@echo off
chcp 65001 > nul
echo 時報タイマーを起動しています...

:: 別プロセスで2秒待機してからブラウザを開く
start /B cmd /c "timeout /t 2 /nobreak > nul & start http://localhost:8765"

:: この画面でサーバーを起動したままにする（閉じると停止）
echo サーバーが起動しました。このウィンドウを閉じるとサーバーも停止します。
python -m http.server 8765 --directory "%~dp0"

pause
