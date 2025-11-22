# ⚠️ FIX CLERK AUTHENTICATION ERROR

## Current Issue
```
Clerk: Refreshing the session token resulted in an infinite redirect loop.
This usually means that your Clerk instance keys do not match
```

## ✅ How to Fix

### Step 1: Verify Clerk Keys

1. Go to: https://dashboard.clerk.com
2. Select your "probody" project
3. Go to **API Keys** section
4. Compare these keys with your `.env.local`:

**Publishable Key should start with:** `pk_test_`
**Secret Key should start with:** `sk_test_`

### Step 2: Check JWT Configuration

1. In Clerk Dashboard, go to **JWT Templates**
2. Find or create a template named **"convex"**
3. The Issuer URL should be: `https://aware-panther-90.clerk.accounts.dev`
4. This MUST match the domain in `convex/auth.config.ts`

### Step 3: Update .env.local

Make sure your `.env.local` has ALL these Clerk variables:

```env
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_YOUR_KEY
CLERK_SECRET_KEY=sk_test_YOUR_SECRET
NEXT_PUBLIC_CLERK_SIGN_IN_URL=/sign-in
NEXT_PUBLIC_CLERK_SIGN_UP_URL=/sign-up
NEXT_PUBLIC_CLERK_AFTER_SIGN_IN_URL=/
NEXT_PUBLIC_CLERK_AFTER_SIGN_UP_URL=/
```

### Step 4: Restart Servers

**Stop both servers (Ctrl+C), then restart:**

Terminal 1:
```bash
npm run dev
```

Terminal 2:
```bash
npx convex dev
```

## 🧪 Test the Fix

1. Visit http://localhost:3000
2. Click "Sign Up"
3. Create an account
4. Should redirect to homepage (not error)
5. Click "Get Started" or "Generate Program"
6. Should work without JSON errors

## 🔍 Still Having Issues?

### Check Browser Console (F12)
Look for specific error messages

### Clear Browser Data
1. Open DevTools (F12)
2. Go to Application tab
3. Clear Site Data
4. Reload page

### Try Incognito Mode
Opens a clean session without cached data

