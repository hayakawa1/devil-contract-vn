# ファイル整理スクリプト
Write-Host "ファイル整理スクリプト" -ForegroundColor Cyan
Write-Host ""

# 効果音ファイルの移動
Write-Host "[1/3] 効果音ファイルを移動中..." -ForegroundColor Yellow
try {
    Get-ChildItem -Path "*.wav" -ErrorAction Stop | Move-Item -Destination "assets\se\" -Force
    Write-Host "✓ 効果音ファイル移動完了" -ForegroundColor Green
} catch {
    Write-Host "× 効果音ファイル移動失敗: $_" -ForegroundColor Red
}

Write-Host ""

# 背景画像の移動
Write-Host "[2/3] 背景画像を移動中..." -ForegroundColor Yellow
try {
    Get-ChildItem -Path "*.png" -ErrorAction Stop | Move-Item -Destination "assets\images\backgrounds\" -Force
    Write-Host "✓ 背景画像移動完了" -ForegroundColor Green
} catch {
    Write-Host "× 背景画像移動失敗: $_" -ForegroundColor Red
}

Write-Host ""

# Pythonスクリプトの移動
Write-Host "[3/3] Pythonスクリプトを移動中..." -ForegroundColor Yellow
try {
    Get-ChildItem -Path "generate_characters*.py" -ErrorAction Stop | Move-Item -Destination "tools\" -Force
    Write-Host "✓ Pythonスクリプト移動完了" -ForegroundColor Green
} catch {
    Write-Host "× Pythonスクリプト移動失敗: $_" -ForegroundColor Red
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "整理完了！" -ForegroundColor Green
Write-Host ""

# 残りファイルの確認
$remaining = @()
$remaining += Get-ChildItem -Path "*.wav" -ErrorAction SilentlyContinue
$remaining += Get-ChildItem -Path "*.png" -ErrorAction SilentlyContinue
$remaining += Get-ChildItem -Path "generate_characters*.py" -ErrorAction SilentlyContinue

if ($remaining.Count -gt 0) {
    Write-Host "⚠ まだ移動できていないファイル:" -ForegroundColor Yellow
    $remaining | ForEach-Object { Write-Host "  - $($_.Name)" }
    Write-Host ""
    Write-Host "以下を試してください:" -ForegroundColor Yellow
    Write-Host "  - エクスプローラーを閉じる"
    Write-Host "  - 画像ビューアーを閉じる"
    Write-Host "  - 音楽プレーヤーを閉じる"
    Write-Host "  - タスクマネージャーでexplorer.exeを再起動"
} else {
    Write-Host "✓ 全てのファイルが正しく移動されました！" -ForegroundColor Green
}

Write-Host ""
Read-Host "Enterキーで終了"
