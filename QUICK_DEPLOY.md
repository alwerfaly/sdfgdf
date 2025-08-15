# 🚀 نشر سريع لـ Overleaf

## الطرق السريعة للنشر (بدون CI/CD):

### 1️⃣ **GitHub Codespaces (الأسرع - مجاني)**

1. اذهب إلى مستودع GitHub الخاص بك
2. اضغط زر "Code" ثم "Codespaces" 
3. اضغط "Create codespace on main"
4. انتظر تحميل المساحة (2-3 دقائق)
5. في التيرمينال، شغّل:
```bash
cp env.example .env
# عدّل الملف .env بالنطاق الخاص بك
./scripts/deploy.sh
```
6. ستحصل على رابط للوصول لـ Overleaf!

### 2️⃣ **DigitalOcean App Platform**

1. اذهب إلى [DigitalOcean Apps](https://cloud.digitalocean.com/apps)
2. "Create App" → "GitHub" → اختر مستودعك
3. Branch: `main`
4. Autodeploy: مفعل
5. أضف متغيرات البيئة:
   - `OVERLEAF_SITE_URL=https://your-app-name.ondigitalocean.app`
   - `OVERLEAF_ADMIN_EMAIL=admin@example.com`
6. Deploy!

### 3️⃣ **Heroku Container**

```bash
# ثبت Heroku CLI أولاً
heroku login
heroku create your-overleaf-app
heroku config:set OVERLEAF_SITE_URL=https://your-overleaf-app.herokuapp.com
git push heroku main
```

### 4️⃣ **Railway.app (سهل جداً)**

1. اذهب إلى [Railway.app](https://railway.app)
2. "Deploy from GitHub repo"
3. اختر مستودعك
4. أضف متغيرات البيئة
5. Deploy تلقائياً!

### 5️⃣ **خادم شخصي (VPS)**

```bash
# على الخادم
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
cp env.example .env
# عدّل .env
sudo docker-compose -f docker-compose.production.yml up -d
```

## 🔗 **الروابط بعد النشر:**

- **الصفحة الرئيسية**: `https://your-domain.com`
- **إعداد المدير**: `https://your-domain.com/launchpad`
- **المراقبة**: `https://your-domain.com:3000` (إذا فعلت monitoring)

## ⚡ **نصائح سريعة:**

- **GitHub Codespaces**: الأسرع للتجربة
- **DigitalOcean**: الأفضل للإنتاج
- **Heroku**: سهل لكن محدود
- **Railway**: متوسط وسهل
- **VPS**: كامل التحكم

**اختر الطريقة التي تناسبك وابدأ!** 🎯
