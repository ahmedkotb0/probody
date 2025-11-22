# FitTech AI - Setup Guide

## AI Fitness Trainer with Monthly Subscription

A modern Next.js application featuring AI-powered fitness program generation with voice interaction and Stripe-powered subscriptions.

---

## 🚀 Features

- **AI-Powered Program Generation**: Create personalized workout and diet plans
- **Voice AI Consultation**: Premium users can consult with AI via voice (Vapi.ai)
- **Subscription Management**: Monthly recurring billing via Stripe
- **User Authentication**: Secure auth with Clerk
- **Database & Backend**: Serverless backend with Convex
- **Beautiful UI**: Cyberpunk-themed responsive design with Tailwind CSS

---

## 📋 Prerequisites

Before you begin, ensure you have:

- Node.js 18+ installed
- npm or yarn package manager
- Accounts created on:
  - [Clerk](https://clerk.com) - Authentication
  - [Convex](https://convex.dev) - Backend/Database
  - [Stripe](https://stripe.com) - Payments
  - [Vapi.ai](https://vapi.ai) - Voice AI (Premium feature)

---

## 🛠️ Installation Steps

### 1. Clone and Install Dependencies

```bash
# Install dependencies
npm install
```

### 2. Set Up Clerk Authentication

1. Go to [Clerk Dashboard](https://dashboard.clerk.com)
2. Create a new application
3. Copy your publishable key and secret key
4. Go to JWT Templates → Create "convex" template
5. Copy the Issuer URL (should match `convex/auth.config.ts`)
6. Go to Webhooks → Add endpoint:
   - URL: `https://YOUR-CONVEX-URL.convex.site/clerk-webhook`
   - Subscribe to: `user.created`, `user.updated`
7. Copy the webhook secret

### 3. Set Up Convex Backend

1. Install Convex CLI: `npm install -g convex`
2. Run `npx convex dev` to create a new Convex project
3. Copy your deployment URL
4. The Convex schema and functions are already configured

### 4. Set Up Stripe Payments

1. Go to [Stripe Dashboard](https://dashboard.stripe.com)
2. Get your Secret Key from Developers → API Keys
3. Create a Product:
   - Go to Products → Add Product
   - Name: "FitTech.ai Premium"
   - Pricing: $29/month recurring
   - Copy the Price ID (starts with `price_`)
4. Set up Webhooks:
   - Go to Developers → Webhooks
   - Add endpoint: `https://YOUR-CONVEX-URL.convex.site/stripe-webhook`
   - Select events:
     - `customer.subscription.created`
     - `customer.subscription.updated`
     - `customer.subscription.deleted`
     - `payment_intent.succeeded`
     - `payment_intent.payment_failed`
   - Copy the webhook secret

### 5. Set Up OpenAI API (Required for Chat)

1. Go to [OpenAI Platform](https://platform.openai.com)
2. Create an API key from API Keys section
3. Copy the API key (starts with `sk-`)

### 6. Set Up Vapi AI (Optional - Premium Feature)

1. Go to [Vapi Dashboard](https://dashboard.vapi.ai)
2. Get your API key from Settings
3. Configure voice settings as needed

### 7. Configure Environment Variables

Create a `.env.local` file in the root directory:

```env
# Clerk Authentication
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=your_clerk_publishable_key
CLERK_SECRET_KEY=your_clerk_secret_key
CLERK_WEBHOOK_SECRET=your_clerk_webhook_secret

# Convex Backend
NEXT_PUBLIC_CONVEX_URL=https://your-project.convex.cloud

# Stripe Payment
STRIPE_SECRET_KEY=your_stripe_secret_key
STRIPE_WEBHOOK_SECRET=your_stripe_webhook_secret
STRIPE_PRICE_ID=your_stripe_price_id
NEXT_PUBLIC_APP_URL=http://localhost:3000

# OpenAI API (for text chat)
OPENAI_API_KEY=your_openai_api_key

# Vapi AI Voice Assistant (optional)
NEXT_PUBLIC_VAPI_API_KEY=your_vapi_api_key
```

### 8. Configure Convex Environment Variables

Run these commands to set Convex environment variables:

```bash
npx convex env set CLERK_JWT_ISSUER_DOMAIN your_clerk_issuer_domain
npx convex env set CLERK_WEBHOOK_SECRET your_clerk_webhook_secret
npx convex env set STRIPE_SECRET_KEY your_stripe_secret_key
npx convex env set STRIPE_WEBHOOK_SECRET your_stripe_webhook_secret
```

---

## 🚀 Running the Application

### Development Mode

```bash
# Terminal 1 - Run Next.js dev server
npm run dev

# Terminal 2 - Run Convex backend
npx convex dev
```

Visit `http://localhost:3000` to see your application.

---

## 📦 Project Structure

```
fittech/
├── src/
│   ├── app/                    # Next.js app directory
│   │   ├── (auth)/            # Authentication pages
│   │   ├── api/               # API routes (Stripe)
│   │   ├── generate-program/  # AI program generation
│   │   ├── profile/           # User profile & plans
│   │   ├── pricing/           # Subscription plans
│   │   └── page.tsx           # Homepage
│   ├── components/            # React components
│   │   ├── ui/               # Shadcn UI components
│   │   ├── Navbar.tsx
│   │   ├── Footer.tsx
│   │   └── ...
│   ├── lib/                   # Utility functions
│   │   ├── stripe.ts
│   │   ├── vapi.ts
│   │   └── utils.ts
│   └── providers/            # Context providers
└── convex/                    # Convex backend
    ├── schema.ts             # Database schema
    ├── plans.ts              # Plans CRUD operations
    ├── subscriptions.ts      # Subscription management
    ├── users.ts              # User management
    └── http.ts               # Webhook handlers
```

---

## 🔑 Key Features Explained

### 1. **Subscription System**
- Free Plan: 1 program, basic features
- Premium Plan ($29/mo): Unlimited programs, AI voice assistant
- Managed via Stripe Customer Portal

### 2. **AI Program Generation**
- Manual form input for free users
- Voice consultation with AI for premium users
- Personalized workout and diet plans

### 3. **User Profile**
- View subscription status
- Manage multiple programs
- Track fitness journey
- Access billing portal

### 4. **Database Schema**
- **users**: User accounts with subscription info
- **plans**: Fitness programs (workout + diet)
- **subscriptions**: Stripe subscription records
- **payments**: Payment history

---

## 🧪 Testing Stripe

Use Stripe test cards:
- Success: `4242 4242 4242 4242`
- Decline: `4000 0000 0000 0002`
- Any future expiry date and CVC

---

## 🚢 Deployment

### Deploy to Vercel

1. Push code to GitHub
2. Import project to Vercel
3. Add all environment variables
4. Deploy!
5. Update webhook URLs in Clerk and Stripe with production URLs

### Update Convex Production Environment

```bash
npx convex deploy
npx convex env set CLERK_JWT_ISSUER_DOMAIN your_domain --prod
npx convex env set STRIPE_SECRET_KEY your_key --prod
# ... set other variables
```

---

## 📝 Important Notes

- **Webhooks**: Make sure webhook URLs are correctly configured in both Clerk and Stripe dashboards
- **Stripe Test Mode**: Start with test mode, switch to live mode for production
- **Vapi AI**: Optional for testing, premium feature requires valid API key
- **Security**: Never commit `.env.local` to version control

---

## 🆘 Troubleshooting

### Issue: Clerk authentication not working
- Verify publishable key in `.env.local`
- Check Clerk dashboard for correct domain settings
- Ensure Convex JWT template matches issuer URL

### Issue: Stripe webhooks failing
- Test webhook in Stripe dashboard
- Verify webhook secret matches
- Check Convex logs for errors: `npx convex logs`

### Issue: Convex functions not updating
- Stop and restart `npx convex dev`
- Clear browser cache
- Check for TypeScript errors

---

## 📚 Documentation Links

- [Next.js Documentation](https://nextjs.org/docs)
- [Convex Documentation](https://docs.convex.dev)
- [Clerk Documentation](https://clerk.com/docs)
- [Stripe Documentation](https://stripe.com/docs)
- [Vapi Documentation](https://docs.vapi.ai)

---

## 🤝 Support

For issues or questions:
- Check documentation links above
- Review error logs in browser console
- Check Convex logs: `npx convex logs`
- Verify all environment variables are set correctly

---

## 📄 License

This project is for educational purposes. Feel free to modify and use for your own projects.

---

Built with ❤️ using Next.js, Convex, Clerk, Stripe, and Vapi.ai

