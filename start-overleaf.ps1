# سكريبت بسيط لتشغيل Overleaf على Windows
Write-Host "🚀 بدء تشغيل Overleaf Community Edition..." -ForegroundColor Green

# التحقق من Docker
if (-not (Get-Command "docker" -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Docker غير مثبت. يرجى تثبيت Docker Desktop أولاً." -ForegroundColor Red
    exit 1
}

# إنشاء ملف البيئة إذا لم يكن موجوداً
if (-not (Test-Path ".env")) {
    Write-Host "📝 إنشاء ملف الإعدادات..." -ForegroundColor Yellow
    Copy-Item "env.example" ".env"
    Write-Host "⚠️  يرجى تعديل ملف .env بإعداداتك قبل المتابعة" -ForegroundColor Yellow
    Write-Host "اضغط Enter للمتابعة بعد التعديل..."
    Read-Host
}

# تشغيل الخدمات
Write-Host "🐳 تشغيل خدمات Docker..." -ForegroundColor Blue
docker-compose -f docker-compose.simple.yml up -d

# انتظار بدء التشغيل
Write-Host "⏳ انتظار بدء الخدمات..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

# عرض الحالة
Write-Host "📊 حالة الخدمات:" -ForegroundColor Cyan
docker-compose -f docker-compose.simple.yml ps

Write-Host ""
Write-Host "✅ Overleaf جاهز!" -ForegroundColor Green
Write-Host "🌐 افتح المتصفح واذهب إلى: http://localhost" -ForegroundColor Cyan
Write-Host "👤 لإنشاء أول مستخدم مدير: http://localhost/launchpad" -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 أوامر مفيدة:" -ForegroundColor White
Write-Host "  - إيقاف: docker-compose -f docker-compose.simple.yml stop" -ForegroundColor Gray
Write-Host "  - إعادة تشغيل: docker-compose -f docker-compose.simple.yml restart" -ForegroundColor Gray
Write-Host "  - عرض اللوجز: docker-compose -f docker-compose.simple.yml logs -f" -ForegroundColor Gray
