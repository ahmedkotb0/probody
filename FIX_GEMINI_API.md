# 🔧 Fix Gemini API Access

## The Problem

Your API key exists but can't access any models. This means the **Generative Language API** isn't enabled for your Google Cloud project.

## ✅ Solution: Enable the API

### Step 1: Go to Google AI Studio

1. Visit: https://aistudio.google.com/app/apikey
2. Sign in with your Google account
3. You should see your API key listed

### Step 2: Enable the Generative Language API

1. Go to: https://console.cloud.google.com/apis/library/generativelanguage.googleapis.com
2. Click **"Enable"**
3. Wait for it to enable (takes a few seconds)

### Step 3: Get a NEW API Key (Important!)

The old key might be associated with a project without the API enabled.

1. Go back to: https://aistudio.google.com/app/apikey
2. Click **"Create API Key"**
3. Select "Create API key in new project" (or select your project)
4. Copy the new key

### Step 4: Update Your .env.local

Open `.env.local` and update the GEMINI_API_KEY:

```env
GEMINI_API_KEY=your-new-api-key-here
```

### Step 5: Test It

Run this in your terminal:

```bash
node test-gemini.js
```

You should see ✅ SUCCESS!

### Step 6: Restart Your Dev Server

```bash
# Stop with Ctrl+C, then:
npm run dev
```

---

## 🎯 Alternative: Use Google AI Studio Directly

Instead of Google Cloud Console, you can create a key directly in AI Studio which automatically has the API enabled:

1. Go to: https://aistudio.google.com/
2. Click "Get API Key" in the top right
3. Click "Create API Key"
4. Copy it and update `.env.local`

---

## ⚠️ Common Issues

### "API not enabled"
- Follow Step 2 above to enable the Generative Language API

### "Project doesn't exist"
- Create a new API key in AI Studio (it will create a project automatically)

### Still not working
- Try creating the API key in a new browser/incognito window
- Make sure you're signed in to the correct Google account
- Check if you have any org policies blocking API access

---

## 📝 After Fixing

Once you have a working API key:
1. Update `.env.local` with the new key
2. Restart your dev server
3. Test at http://localhost:3000/ai-assistant
4. You should see Gemini responses! 🎉

