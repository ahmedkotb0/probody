# 🔄 How to Restart Your Dev Server

## The Problem

You added the OpenAI API key to `.env.local`, but the server is still running with the old configuration (without the key). Environment variables are only loaded when the server starts.

## ✅ Solution: Restart the Server

### Step 1: Stop the Current Server

Find the terminal where `npm run dev` is running and:

**Press `Ctrl + C`** 

This will stop the server.

### Step 2: Start the Server Again

In the same terminal, run:

```bash
npm run dev
```

Wait for it to say:
```
✓ Ready in X seconds
```

### Step 3: Refresh Your Browser

1. Go back to your browser
2. Press `Ctrl + Shift + R` (hard refresh)
3. Or close and reopen the tab

### Step 4: Test the AI Chat

1. Go to: http://localhost:3000/ai-assistant
2. Type a message: "Give me a workout plan"
3. Click Send

You should now see AI responses! ✅

---

## 🐛 Still Getting Errors?

### Check the terminal output when starting:
- Look for any errors about environment variables
- Make sure there are no syntax errors in `.env.local`

### Verify the key is loaded:
Add this temporary test to check:

```bash
# In a new PowerShell window:
Get-Content .env.local | Select-String "OPENAI"
```

You should see:
```
OPENAI_API_KEY=sk-proj-...
```

### Check the API route:
The error happens at `/api/chat`. The server logs might show more details about what's failing.

---

## 📋 Quick Checklist

- [ ] Added OPENAI_API_KEY to `.env.local`
- [ ] Stopped dev server (Ctrl+C)
- [ ] Restarted dev server (`npm run dev`)
- [ ] Refreshed browser (Ctrl+Shift+R)
- [ ] Tested AI chat

---

After restarting, everything should work! 🚀

