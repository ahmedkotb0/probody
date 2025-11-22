# 🧪 FitTech AI - Testing Guide

## ⚡ Quick Start

### Step 1: Start Development Servers

**Terminal 1 (This terminal)** - Next.js is already running!
```bash
npm run dev
```

**Terminal 2 (Open a new terminal)** - Start Convex:
```bash
cd c:\Users\pc\Desktop\probody
npx convex dev
```

Wait for both servers to be ready, then visit: **http://localhost:3000**

---

## ⚠️ Before Testing - Required Setup

Make sure you have these environment variables in `.env.local`:

```env
# Clerk Authentication (REQUIRED)
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_...
CLERK_SECRET_KEY=sk_test_...
CLERK_WEBHOOK_SECRET=whsec_...

# Convex Backend (REQUIRED)
NEXT_PUBLIC_CONVEX_URL=https://...convex.cloud

# Stripe Payment (REQUIRED for subscription features)
STRIPE_SECRET_KEY=sk_test_...
STRIPE_WEBHOOK_SECRET=whsec_...
STRIPE_PRICE_ID=price_...
NEXT_PUBLIC_APP_URL=http://localhost:3000

# OpenAI API (REQUIRED for AI chat)
OPENAI_API_KEY=sk-...

# Vapi AI (OPTIONAL - for voice feature)
NEXT_PUBLIC_VAPI_API_KEY=...
```

---

## 📋 Testing Checklist

### ✅ 1. Homepage Testing
- [ ] Visit http://localhost:3000
- [ ] Check if homepage loads correctly
- [ ] Verify cyberpunk theme is applied
- [ ] Test "Build Your Program" button
- [ ] Test "View Pricing" button
- [ ] Scroll down to see user programs gallery

### ✅ 2. Authentication Testing
- [ ] Click "Sign Up" button
- [ ] Create a new account
- [ ] Verify redirect after sign-up
- [ ] Sign out
- [ ] Sign in again
- [ ] Check if UserButton appears in navbar

### ✅ 3. AI Assistant (NEW FEATURE!) 💬
- [ ] Navigate to **AI Assistant** in navbar
- [ ] Verify text chat interface loads
- [ ] Type a message: "What are the best exercises for abs?"
- [ ] Verify AI responds
- [ ] Test multiple messages in a row
- [ ] Check timestamps appear
- [ ] Test auto-scroll to latest message

**Sample questions to test:**
```
1. "How much protein should I eat daily?"
2. "What's a good workout routine for beginners?"
3. "Explain proper squat form"
4. "Create a 3-day workout split"
```

**Voice Chat (Premium only):**
- [ ] Check if voice button shows "Upgrade" for free users
- [ ] (If premium) Click "Start Voice Call"
- [ ] Speak a question
- [ ] Verify AI responds with voice
- [ ] Check transcript appears in text chat

### ✅ 4. Program Generation
- [ ] Navigate to **Generate Program**
- [ ] Fill out the form:
  - Name: "Test User"
  - Fitness Goal: "Muscle Gain"
  - Fitness Level: "Intermediate"
  - Age: 25
  - Workout Days: 4
  - Height: 5'10"
  - Weight: 170 lbs
  - Equipment: "Full gym"
  - Injuries: "None"
  - Dietary Restrictions: "None"
- [ ] Click "Generate Program"
- [ ] Wait for program creation
- [ ] Verify redirect to profile

**Voice AI (Premium only):**
- [ ] Click "Start Voice Consultation"
- [ ] Answer AI's questions
- [ ] Verify call ends properly

### ✅ 5. Profile Page
- [ ] Check if profile page shows user info
- [ ] Verify subscription status (Free or Premium)
- [ ] Check if generated program appears
- [ ] Verify workout plan displays correctly
- [ ] Verify diet plan displays correctly
- [ ] Check program stats (Total Programs, Active Plan)

### ✅ 6. Pricing Page
- [ ] Navigate to **Pricing**
- [ ] Verify Free and Premium plans display
- [ ] Check feature lists
- [ ] Click "Subscribe Now" (don't complete payment yet)

### ✅ 7. Stripe Subscription Flow
**Use Stripe test card: 4242 4242 4242 4242**

- [ ] Click "Subscribe Now" on Premium plan
- [ ] Verify redirect to Stripe Checkout
- [ ] Enter test card information:
  - Card: `4242 4242 4242 4242`
  - Expiry: Any future date (e.g., 12/25)
  - CVC: Any 3 digits (e.g., 123)
  - Name: Test User
- [ ] Complete checkout
- [ ] Verify redirect to profile with success message
- [ ] Check if status shows "Premium Plan"
- [ ] Test "Manage Subscription" button
- [ ] Verify Stripe Customer Portal opens

### ✅ 8. Premium Features After Subscription
- [ ] Go to **Generate Program**
- [ ] Verify voice assistant card appears
- [ ] Test voice consultation (if Vapi key is set)
- [ ] Generate multiple programs
- [ ] Go to **AI Assistant**
- [ ] Verify voice chat button is enabled
- [ ] Test voice chat feature

### ✅ 9. Navigation Testing
- [ ] Test all navbar links:
  - Home
  - Generate
  - AI Assistant
  - Profile
  - Pricing
  - Get Started button
- [ ] Test UserButton dropdown
- [ ] Test sign out

### ✅ 10. Responsive Design
- [ ] Open DevTools (F12)
- [ ] Toggle device toolbar (Ctrl+Shift+M)
- [ ] Test mobile view (375px)
- [ ] Test tablet view (768px)
- [ ] Test desktop view (1920px)
- [ ] Verify all pages are responsive

---

## 🐛 Common Issues & Solutions

### Issue: "Unauthorized" errors
**Solution:** 
- Make sure you're signed in
- Check Clerk environment variables
- Clear browser cookies and sign in again

### Issue: AI chat not responding
**Solution:**
- Verify `OPENAI_API_KEY` is set in `.env.local`
- Check OpenAI API credits at https://platform.openai.com
- Check browser console for errors (F12)

### Issue: Convex connection error
**Solution:**
- Ensure `npx convex dev` is running
- Check `NEXT_PUBLIC_CONVEX_URL` is correct
- Restart both servers

### Issue: Stripe checkout not loading
**Solution:**
- Verify `STRIPE_SECRET_KEY` and `STRIPE_PRICE_ID` are set
- Check Stripe dashboard for product/price configuration
- Ensure you're using test mode keys

### Issue: Voice chat not working
**Solution:**
- Check if `NEXT_PUBLIC_VAPI_API_KEY` is set
- Verify microphone permissions in browser
- Try in Chrome or Edge (best support)
- Check Vapi.ai dashboard for credits

---

## 📊 What to Look For

### ✅ Good Signs
- Fast page loads
- Smooth animations
- Clear error messages
- Responsive design works
- AI responds quickly
- Subscriptions process correctly
- Data persists across page reloads

### ⚠️ Warning Signs
- Slow API responses (>5 seconds)
- Console errors in browser
- Broken layouts on mobile
- 500 errors
- Missing environment variables warnings
- Convex connection errors

---

## 🔍 Developer Testing

### Check Browser Console
Press F12 and check for:
- No error messages (red)
- Minimal warnings (yellow)
- Successful API calls in Network tab

### Check Convex Logs
In the Convex terminal:
```bash
# Logs appear automatically in the Convex dev terminal
# Look for successful mutations and queries
```

### Check Next.js Terminal
- Look for successful page renders
- Check for compilation errors
- Monitor API route calls

---

## 🎯 Manual Test Scenarios

### Scenario 1: New User Journey
1. Open incognito browser
2. Visit homepage
3. Click "Sign Up"
4. Create account
5. Generate first program
6. View profile
7. Browse pricing
8. Subscribe to Premium
9. Test voice features

### Scenario 2: Existing Premium User
1. Sign in
2. Go to AI Assistant
3. Chat with AI via text
4. Try voice consultation
5. Generate new program
6. Manage subscription
7. View all programs in profile

### Scenario 3: Free User Exploration
1. Sign in
2. Generate 1 program
3. Try to access voice features (should see upgrade prompt)
4. Chat with AI via text (should work)
5. View pricing page
6. See subscription benefits

---

## 📈 Performance Testing

### Test These Metrics:
- **Homepage Load**: Should be < 2 seconds
- **API Response**: Should be < 3 seconds
- **AI Chat Response**: Should be < 5 seconds
- **Page Navigation**: Should be instant (Next.js)
- **Program Generation**: Should be < 3 seconds

---

## ✅ Final Checklist

Before considering testing complete:

- [ ] All core features work
- [ ] No console errors
- [ ] Authentication works
- [ ] Subscriptions process successfully
- [ ] AI chat responds correctly
- [ ] Programs generate and save
- [ ] Profile displays correctly
- [ ] Mobile responsive
- [ ] All links work
- [ ] Error handling is graceful

---

## 🚀 Next Steps After Testing

1. **Fix any issues found**
2. **Deploy to production** (See SETUP.md)
3. **Configure production webhooks**
4. **Switch to live Stripe keys**
5. **Monitor error logs**
6. **Gather user feedback**

---

## 📞 Need Help?

If you encounter issues:
1. Check browser console (F12)
2. Check Convex logs (`npx convex logs`)
3. Verify all environment variables
4. Review SETUP.md for configuration
5. Check service status pages:
   - OpenAI: https://status.openai.com
   - Clerk: https://status.clerk.com
   - Stripe: https://status.stripe.com

---

**Happy Testing! 🎉**

Remember: Use test cards and test mode for all payment testing!

