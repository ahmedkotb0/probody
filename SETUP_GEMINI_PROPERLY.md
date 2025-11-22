# 🚀 Setup Gemini API - Step by Step

## Why Gemini?

✅ **Completely FREE**  
✅ 60 requests per minute  
✅ 1,500 requests per day  
✅ No credit card needed  
✅ Great quality responses  

## The Problem with Your Current Key

Your Gemini key `AIzaSyDF0n7Rmj-2o9tIrnYCEAynR4CTf21-qRc` doesn't have access to models because the **Generative Language API** isn't enabled.

## ✅ Solution: Get a NEW API Key

Follow these exact steps:

### Step 1: Go to Google AI Studio

Open this link in your browser:
**https://aistudio.google.com/app/apikey**

### Step 2: Sign In

- Use your Google account
- Accept any terms if prompted

### Step 3: Create API Key

1. Click **"Create API key"** button
2. Choose one of these options:
   - **"Create API key in new project"** (RECOMMENDED - This auto-enables everything!)
   - OR select an existing project

3. Wait 5 seconds for it to create

4. **COPY THE NEW KEY** - it will look like: `AIzaSy...`

### Step 4: Test the New Key Immediately

Before doing anything else, test it works:

1. Go to: https://aistudio.google.com/
2. Click "Try it" or "Chat" 
3. Type "Hello" and see if you get a response
4. If it works there, the API key will work in your app!

### Step 5: Update .env.local

Open your `.env.local` file and update the line:

```env
GEMINI_API_KEY=paste-your-new-key-here
```

### Step 6: Update the Code

The code needs to use the correct model name.

---

## 🎯 Quick Check

After getting the new key, test it:

```bash
# Create a test file
echo 'const { GoogleGenerativeAI } = require("@google/generative-ai");
const genAI = new GoogleGenerativeAI("YOUR_NEW_KEY_HERE");
async function test() {
  const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash-latest" });
  const result = await model.generateContent("Say hi!");
  console.log(await result.response.text());
}
test();' > quick-test.js

# Run it
node quick-test.js
```

If you see a response, it works!

---

## 🔧 Common Issues

### "API not enabled"
- Use "Create API key in NEW project" option
- This automatically enables everything

### "Models not found"
- Your key is from an old project
- Delete it and create a NEW key in a NEW project

### Still not working?
- Try in incognito/private browser window
- Make sure you're signed in to correct Google account
- Clear browser cache

---

## ✅ After You Get Working Key

1. Copy the new key
2. Tell me and I'll update the code
3. Restart your dev server
4. Test the chat - it will work! 🎉

