# 🤖 OpenAI API Setup Guide

## Why You Need This

The AI chat feature in FitTech AI uses OpenAI's GPT model to provide intelligent fitness advice. Without an API key, the chat will display: "AI chat is not configured yet."

## ✅ Quick Setup Steps

### Step 1: Get Your OpenAI API Key

1. Go to: https://platform.openai.com/
2. Sign up or log in to your account
3. Click on your profile (top right) → **API Keys**
4. Click **"Create new secret key"**
5. Give it a name like "FitTech AI"
6. **Copy the key immediately** (you won't see it again!)
   - It starts with `sk-`

### Step 2: Add to Your Environment Variables

**Option A: Edit `.env.local` file (Recommended)**

1. Open your project folder: `C:\Users\pc\Desktop\probody`
2. Find the file `.env.local` (create it if it doesn't exist)
3. Add this line:
   ```
   OPENAI_API_KEY=sk-your-actual-key-here
   ```
4. Replace `sk-your-actual-key-here` with your actual key

**Option B: Create `.env.local` if it doesn't exist**

If you don't have a `.env.local` file, create one in the root of your project with:

```env
# OpenAI
OPENAI_API_KEY=sk-your-actual-key-here

# Your other environment variables...
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_...
CLERK_SECRET_KEY=sk_test_...
CONVEX_DEPLOYMENT=...
NEXT_PUBLIC_CONVEX_URL=...
```

### Step 3: Restart Your Dev Server

**Important!** Environment variables are only loaded when the server starts.

```bash
# Stop your dev server (Ctrl+C)
# Then restart:
npm run dev
```

### Step 4: Test It

1. Go to http://localhost:3000/ai-assistant
2. Try sending a message like: "What's a good workout for beginners?"
3. You should now get AI responses! 🎉

## 💰 OpenAI Pricing (Important!)

OpenAI charges based on usage:
- **GPT-4**: ~$0.03 per 1K tokens (more expensive, better quality)
- **GPT-3.5-turbo**: ~$0.002 per 1K tokens (cheaper, good quality)

### Current Model in Use

Your app is currently using **GPT-4**. You can change this to save costs:

Edit `src/app/api/chat/route.ts` line 36:
```typescript
// For GPT-4 (better, more expensive):
model: "gpt-4",

// For GPT-3.5-turbo (cheaper, still good):
model: "gpt-3.5-turbo",
```

### Set Usage Limits

To avoid unexpected charges:
1. Go to: https://platform.openai.com/account/billing/limits
2. Set a **monthly budget limit** (e.g., $10)
3. You'll get notified when you approach the limit

## 🆓 Free Trial

OpenAI provides:
- **$5 free credit** for new accounts
- Valid for 3 months
- Good for testing!

## 🔒 Security Best Practices

### ✅ DO:
- Keep your `.env.local` file private (it's already in `.gitignore`)
- Use different keys for development and production
- Set usage limits in OpenAI dashboard
- Rotate keys if they're exposed

### ❌ DON'T:
- Never commit `.env.local` to Git
- Don't share your API key publicly
- Don't use the same key in client-side code

## 🐛 Troubleshooting

### Still Getting "Not Configured" Error?

**1. Check your key format:**
   - Must start with `sk-`
   - No spaces before or after
   - No quotes around the key

**2. Check file location:**
   - File must be named `.env.local` (note the dot at the start)
   - Must be in project root: `C:\Users\pc\Desktop\probody\.env.local`

**3. Restart dev server:**
   ```bash
   # Stop with Ctrl+C, then:
   npm run dev
   ```

**4. Check terminal output:**
   Look for any environment variable loading errors

### Getting API Errors?

**Error: "Incorrect API key"**
- Double-check you copied the full key
- Make sure there are no extra characters

**Error: "Rate limit exceeded"**
- You've hit OpenAI's usage limits
- Wait a bit or upgrade your OpenAI plan

**Error: "Insufficient quota"**
- You've used all your free credits
- Add payment method to OpenAI account

## 🎯 Alternative: Use Different AI Model

If you don't want to use OpenAI, you can integrate other AI services:

### Anthropic Claude
```bash
npm install @anthropic-ai/sdk
```

### Google Gemini
```bash
npm install @google/generative-ai
```

### Local Models (Ollama)
- Free, runs on your computer
- No API key needed
- Visit: https://ollama.ai

## 📝 Example `.env.local` File

Here's what a complete `.env.local` might look like:

```env
# Clerk
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_xxxxx
CLERK_SECRET_KEY=sk_test_xxxxx
NEXT_PUBLIC_CLERK_SIGN_IN_URL=/sign-in
NEXT_PUBLIC_CLERK_SIGN_UP_URL=/sign-up
NEXT_PUBLIC_CLERK_AFTER_SIGN_IN_URL=/
NEXT_PUBLIC_CLERK_AFTER_SIGN_UP_URL=/

# Convex
CONVEX_DEPLOYMENT=prod:abcd-1234
NEXT_PUBLIC_CONVEX_URL=https://your-project.convex.cloud

# OpenAI (Add this!)
OPENAI_API_KEY=sk-proj-xxxxxxxxxxxxxxxxxxxxx

# Stripe
STRIPE_SECRET_KEY=sk_test_xxxxx
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_test_xxxxx
STRIPE_WEBHOOK_SECRET=whsec_xxxxx

# Vapi
NEXT_PUBLIC_VAPI_PUBLIC_KEY=xxxxx
```

## ✅ Quick Checklist

- [ ] Created OpenAI account
- [ ] Generated API key
- [ ] Added key to `.env.local`
- [ ] Restarted dev server
- [ ] Tested AI chat
- [ ] Set usage limits (optional but recommended)

---

Need help? Check the OpenAI documentation: https://platform.openai.com/docs

