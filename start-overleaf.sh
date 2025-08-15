#!/bin/bash

# سكريبت بسيط لتشغيل Overleaf على Linux/Mac
echo "🚀 بدء تشغيل Overleaf Community Edition..."

# التحقق من Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker غير مثبت. يرجى تثبيت Docker أولاً."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose غير مثبت. يرجى تثبيت Docker Compose أولاً."
    exit 1
fi

# إنشاء ملف البيئة إذا لم يكن موجوداً
if [ ! -f ".env" ]; then
    echo "📝 إنشاء ملف الإعدادات..."
    cp env.example .env
    echo "⚠️  يرجى تعديل ملف .env بإعداداتك قبل المتابعة"
    echo "اضغط Enter للمتابعة بعد التعديل..."
    read
fi

# تشغيل الخدمات
echo "🐳 تشغيل خدمات Docker..."
docker-compose -f docker-compose.simple.yml up -d

# انتظار بدء التشغيل
echo "⏳ انتظار بدء الخدمات..."
sleep 30

# عرض الحالة
echo "📊 حالة الخدمات:"
docker-compose -f docker-compose.simple.yml ps

echo ""
echo "✅ Overleaf جاهز!"
echo "🌐 افتح المتصفح واذهب إلى: http://localhost"
echo "👤 لإنشاء أول مستخدم مدير: http://localhost/launchpad"
echo ""
echo "📋 أوامر مفيدة:"
echo "  - إيقاف: docker-compose -f docker-compose.simple.yml stop"
echo "  - إعادة تشغيل: docker-compose -f docker-compose.simple.yml restart"
echo "  - عرض اللوجز: docker-compose -f docker-compose.simple.yml logs -f"
