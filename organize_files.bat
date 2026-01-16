@echo off
chcp 65001 > nul
echo ファイル整理スクリプト
echo.

echo [1/3] 効果音ファイルを移動中...
move /Y "*.wav" "assets\se\" 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✓ 効果音ファイル移動完了
) else (
    echo × 効果音ファイル移動失敗（ファイルが使用中の可能性）
)

echo.
echo [2/3] 背景画像を移動中...
move /Y "*.png" "assets\images\backgrounds\" 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✓ 背景画像移動完了
) else (
    echo × 背景画像移動失敗（ファイルが使用中の可能性）
)

echo.
echo [3/3] Pythonスクリプトを移動中...
move /Y "generate_characters*.py" "tools\" 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✓ Pythonスクリプト移動完了
) else (
    echo × Pythonスクリプト移動失敗（ファイルが使用中の可能性）
)

echo.
echo ==========================================
echo 整理完了！
echo.
echo 残っているファイルを確認:
dir /b *.wav *.png *.py 2>nul
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ⚠ まだ移動できていないファイルがあります
    echo 以下を試してください:
    echo - エクスプローラーを閉じる
    echo - 画像ビューアーを閉じる
    echo - 音楽プレーヤーを閉じる
    echo - PCを再起動する
) else (
    echo.
    echo ✓ 全てのファイルが正しく移動されました！
)

echo.
pause
