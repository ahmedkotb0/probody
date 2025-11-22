# 🏋️ FitTech AI - AI Fitness Trainer with Monthly Subscription

A modern, full-stack AI fitness trainer application built with Next.js 15, featuring personalized workout and diet plans powered by AI, voice consultation capabilities, and Stripe-powered subscription management.

![FitTech AI](public/hero-ai3.png)

## ✨ Features

### Core Features
- 🤖 **AI-Powered Program Generation** - Personalized workout and diet plans based on user input
- 💬 **AI Chat Assistant** - Chat with AI fitness trainer via text or voice
- 🎤 **Voice AI Consultation** - Premium users get voice chat with AI (Vapi.ai)
- 💳 **Subscription Management** - Monthly recurring billing ($29/mo) via Stripe
- 🔐 **Secure Authentication** - User authentication with Clerk
- 💾 **Serverless Backend** - Real-time database and backend with Convex
- 🎨 **Beautiful UI** - Cyberpunk-themed responsive design with Tailwind CSS 4

### User Features
- Chat with AI fitness assistant via text (all users)
- Voice consultation with AI (Premium users)
- Create unlimited fitness programs (Premium)
- Save and manage multiple programs
- View detailed workout routines with sets, reps, and descriptions
- Personalized diet plans with calorie tracking
- Subscription management via Stripe Customer Portal
- Track fitness journey and progress

## 🛠️ Tech Stack

- **Frontend**: Next.js 15.4.4, React 19, TypeScript
- **Styling**: Tailwind CSS 4, Shadcn UI components
- **Authentication**: Clerk
- **Backend/Database**: Convex (serverless)
- **Payments**: Stripe
- **AI Chat**: OpenAI GPT-4
- **AI Voice**: Vapi.ai
- **Deployment**: Vercel (recommended)

## 📋 Prerequisites

- Node.js 18+ installed
- npm/yarn package manager
- Accounts on:
  - [Clerk](https://clerk.com) - Authentication
  - [Convex](https://convex.dev) - Backend
  - [Stripe](https://stripe.com) - Payments
  - [Vapi.ai](https://vapi.ai) - Voice AI (optional)

## 🚀 Quick Start

### 1. Installation

```bash
npm install
```

### 2. Environment Setup

Create a `.env.local` file:

```env
# Clerk Authentication
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=your_key
CLERK_SECRET_KEY=your_key
CLERK_WEBHOOK_SECRET=your_secret

# Convex Backend
NEXT_PUBLIC_CONVEX_URL=https://your-project.convex.cloud

# Stripe Payment
STRIPE_SECRET_KEY=your_key
STRIPE_WEBHOOK_SECRET=your_secret
STRIPE_PRICE_ID=your_price_id
NEXT_PUBLIC_APP_URL=http://localhost:3000

# OpenAI API (for text chat)
OPENAI_API_KEY=your_key

# Vapi AI (Optional for voice)
NEXT_PUBLIC_VAPI_API_KEY=your_key
```

### 3. Run Development Servers

```bash
# Terminal 1 - Next.js
npm run dev

# Terminal 2 - Convex
npx convex dev
```

Visit `http://localhost:3000`

## 📖 Detailed Setup

For complete setup instructions including:
- Clerk configuration
- Convex deployment
- Stripe product & webhook setup
- Vapi AI integration

**See [SETUP.md](SETUP.md) for detailed instructions.**

## 🏗️ Project Structure

```
fittech/
├── src/
│   ├── app/
│   │   ├── (auth)/              # Auth pages
│   │   ├── api/                 # API routes (Stripe, Chat)
│   │   ├── ai-assistant/       # AI chat interface
│   │   ├── generate-program/   # Program generation
│   │   ├── profile/            # User profile
│   │   ├── pricing/            # Pricing page
│   │   └── page.tsx            # Homepage
│   ├── components/             # React components
│   ├── lib/                    # Utilities
│   └── providers/              # Context providers
└── convex/                     # Backend
    ├── schema.ts              # Database schema
    ├── plans.ts               # Plans CRUD
    ├── subscriptions.ts       # Subscription logic
    ├── users.ts               # User management
    └── http.ts                # Webhooks
```

## 💎 Key Features Breakdown

### Free Plan
- ✅ AI text chat assistant
- ✅ AI voice assistant (speak with AI!)
- ✅ Create 1 personalized program
- ✅ Basic workout plans
- ✅ Diet recommendations
- ✅ Community access

### Premium Plan ($29/month)
- ✅ Everything in Free, plus:
- ✅ Unlimited AI-generated programs
- ✅ Advanced workout customization
- ✅ Detailed nutrition tracking
- ✅ Progress tracking & analytics
- ✅ Priority support
- ✅ Export & share programs

## 🔧 Development

### Available Scripts

```bash
npm run dev          # Start development server
npm run build        # Build for production
npm run start        # Start production server
npm run lint         # Run ESLint
npx convex dev       # Start Convex backend
npx convex deploy    # Deploy Convex to production
```

### Database Schema

- **users** - User accounts with subscription info
- **plans** - Fitness programs (workout + diet plans)
- **subscriptions** - Stripe subscription records
- **payments** - Payment transaction history

## 🚢 Deployment

### Deploy to Vercel

1. Push code to GitHub
2. Import to Vercel
3. Add environment variables
4. Deploy!

### Deploy Convex

```bash
npx convex deploy
```

### Configure Production Webhooks

Update webhook URLs in:
- Clerk Dashboard → Webhooks
- Stripe Dashboard → Webhooks

## 🧪 Testing

### Test Stripe Payments

Use test cards:
- Success: `4242 4242 4242 4242`
- Decline: `4000 0000 0000 0002`
- Any future date + any CVC

## 📝 Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY` | Clerk public key | ✅ |
| `CLERK_SECRET_KEY` | Clerk secret key | ✅ |
| `CLERK_WEBHOOK_SECRET` | Clerk webhook secret | ✅ |
| `NEXT_PUBLIC_CONVEX_URL` | Convex deployment URL | ✅ |
| `STRIPE_SECRET_KEY` | Stripe secret key | ✅ |
| `STRIPE_WEBHOOK_SECRET` | Stripe webhook secret | ✅ |
| `STRIPE_PRICE_ID` | Stripe price ID | ✅ |
| `NEXT_PUBLIC_APP_URL` | App URL | ✅ |
| `OPENAI_API_KEY` | OpenAI API key | ✅ |
| `NEXT_PUBLIC_VAPI_API_KEY` | Vapi AI key | Optional |

## 🆘 Troubleshooting

Common issues and solutions in [SETUP.md](SETUP.md#-troubleshooting)

## 📚 Learn More

- [Next.js Documentation](https://nextjs.org/docs)
- [Convex Documentation](https://docs.convex.dev)
- [Clerk Documentation](https://clerk.com/docs)
- [Stripe Documentation](https://stripe.com/docs)
- [Vapi Documentation](https://docs.vapi.ai)

## 📄 License

MIT License - Feel free to use this project for your own purposes.

## 🙏 Acknowledgments

- Built with Next.js, Convex, Clerk, Stripe, and Vapi.ai
- UI components from Shadcn UI
- Design inspired by cyberpunk aesthetics

---

**Built with ❤️ by Ahmed Ashraf**
