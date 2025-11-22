# 🚀 Starting FitTech AI Project

## ✅ Status:

### Terminal 1 (This Terminal): Next.js ✅ STARTED
```bash
npm run dev
```
**Running at:** http://localhost:3000

---

## 📋 Next Step: Start Convex

### **Open a NEW Terminal Window and run:**

#### Windows PowerShell / Command Prompt:
```bash
cd C:\Users\pc\Desktop\probody
npx convex dev
```

#### Or in VS Code:
1. Click **Terminal** → **New Terminal**
2. Run:
```bash
npx convex dev
```

---

## ⏳ Wait for Convex to Deploy

You should see:
```
✔ Deploying schema...
✔ Deployed functions:
  - subscriptions.ts
  - plans.ts
  - users.ts
  - http.ts
✔ Convex functions ready!
```

---

## 🎉 Once Both Are Running:

### 1. Visit Your App:
**http://localhost:3000**

### 2. Test These Features:

#### ✅ Homepage
- Should load without errors
- See cyberpunk theme

#### ✅ Sign Up / Sign In
- Click "Sign Up"
- Create account
- Should work without JSON errors

#### ✅ AI Assistant (NEW!)
- Navigate to "AI Assistant" in navbar
- Try text chat (requires OpenAI key)
- Premium users: Try voice chat

#### ✅ Generate Program
- Click "Generate Program"
- Fill out form
- Create your fitness plan

#### ✅ Profile
- View your programs
- Check subscription status

#### ✅ Pricing
- See Free vs Premium plans
- Test subscription flow (use test card: 4242 4242 4242 4242)

---

## 📊 Both Terminals Should Show:

### Terminal 1: Next.js
```
▲ Next.js 15.4.4 (Turbopack)
- Local:        http://localhost:3000
✓ Ready in 1776ms
```

### Terminal 2: Convex
```
✔ Convex functions ready!
✔ Watching for file changes...
```

---

## ⚠️ Important Notes:

### Required Environment Variables:
Your `.env.local` has:
- ✅ Clerk keys
- ✅ Convex URL
- ✅ Vapi keys

### Optional (for full features):
- ⚠️ `OPENAI_API_KEY` - Required for AI chat
- ⚠️ `STRIPE_SECRET_KEY` - Required for subscriptions
- ⚠️ `STRIPE_PRICE_ID` - Required for subscriptions

**You can test basic features without these, but some functionality will be limited.**

---

## 🧪 Quick Test Checklist:

- [ ] Both servers running
- [ ] Homepage loads at http://localhost:3000
- [ ] Can sign up/sign in
- [ ] No Clerk redirect errors
- [ ] No "function not found" errors
- [ ] Navigation works

---

## 🐛 If You See Errors:

### "Clerk infinite redirect"
- Check Clerk keys in `.env.local`
- Clear browser cookies
- Try incognito mode

### "Could not find public function"
- Make sure Convex is running (`npx convex dev`)
- Wait for functions to deploy

### "Unauthorized" errors
- Sign in first
- Protected routes require authentication

### JSON parsing errors
- Usually means Clerk auth issue
- Check environment variables

---

## 🎯 Ready to Test!

Once you see **both servers running**, visit:

👉 **http://localhost:3000**

And start exploring your AI Fitness Trainer! 💪

---

## 💡 Pro Tips:

1. **Keep both terminals open** while developing
2. **Check browser console** (F12) for errors
3. **Use test card** for Stripe: `4242 4242 4242 4242`
4. **Test in incognito** for clean session

---

**Need help? Check TESTING_GUIDE.md for detailed testing instructions!**

