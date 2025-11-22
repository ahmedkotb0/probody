# Admin Dashboard Setup Guide

## Overview

The admin dashboard has been successfully integrated into your FitTech AI application! This powerful dashboard allows you to:

- 📊 View all users and their subscription details
- 💰 Monitor financial statistics and revenue
- 📄 Download comprehensive PDF reports
- 📊 Export financial data to Excel
- ⚠️ Track expiring subscriptions
- 📧 Send reminder emails to users

## Features

### 1. **Dashboard Overview**
- Total Users count
- Total Revenue tracking
- Active Subscriptions monitoring
- Monthly Recurring Revenue (MRR)

### 2. **User Management**
- View all registered users
- See subscription status for each user
- Check subscription expiration dates
- Monitor total revenue per user
- Track payment count per user

### 3. **Financial Reports**
- **PDF Reports**: Comprehensive overview of all users and financial data
- **Excel Reports**: Detailed financial breakdown with multiple sheets:
  - Financial Summary
  - Users list with all details
  - Payment history

### 4. **Subscription Monitoring**
- Automatic detection of subscriptions expiring within 7 days
- Visual alerts for expiring subscriptions
- One-click reminder emails

## Setup Instructions

### Step 1: Make Your Account an Admin

To access the admin dashboard, you need to set your user account as an admin. You have two options:

#### Option A: Using Convex Dashboard (Recommended)

1. Open your Convex dashboard at https://dashboard.convex.dev
2. Select your project
3. Go to "Functions" tab
4. Find and run the `admin:setUserAsAdmin` mutation
5. Pass your email address as the parameter:
   ```json
   {
     "email": "your-email@example.com"
   }
   ```

#### Option B: Using Convex CLI

Run this command in your terminal:

```bash
npx convex run admin:setUserAsAdmin '{"email":"your-email@example.com"}'
```

### Step 2: Verify Admin Access

1. Sign in to your account at http://localhost:3000
2. Look for the "Admin" link in the navigation bar (with a shield icon)
3. Click on it to access the admin dashboard

## Using the Admin Dashboard

### Viewing Statistics

The dashboard displays four key metrics at the top:
- **Total Users**: Total number of registered users
- **Total Revenue**: All-time revenue from subscriptions
- **Active Subscriptions**: Currently active paid subscriptions
- **MRR**: Estimated Monthly Recurring Revenue

### Generating Reports

#### PDF Reports
Click "Download PDF Report" to generate a comprehensive PDF including:
- Financial summary
- Complete user list with subscription details
- Formatted tables for easy reading

#### Excel Reports
Click "Download Excel Report" to generate a detailed Excel workbook with three sheets:
1. **Financial Summary**: Key metrics and revenue by month
2. **Users**: Complete user list with all subscription details
3. **Payments**: Detailed payment history

### Managing Expiring Subscriptions

When subscriptions are expiring within 7 days:
1. An alert box appears at the top of the dashboard
2. Shows user name, email, and days until expiry
3. Click "Send Reminder" to notify users (requires email service setup)

### Users Table

The main table shows all users with:
- Name and email
- Current plan (free/monthly)
- Subscription status (active/canceled/none)
- Expiration date
- Total revenue generated
- Date joined

## Email Reminder Setup (Optional)

To enable email reminders for expiring subscriptions, you'll need to integrate an email service:

### Option 1: Resend (Recommended)

1. Sign up at https://resend.com
2. Install Resend:
   ```bash
   npm install resend
   ```
3. Update `convex/admin.ts` in the `sendSubscriptionReminder` function:
   ```typescript
   import { Resend } from 'resend';
   const resend = new Resend(process.env.RESEND_API_KEY);
   
   // In the mutation handler:
   await resend.emails.send({
     from: 'FitTech AI <noreply@yourdomain.com>',
     to: user.email,
     subject: 'Your subscription is expiring soon',
     html: `<p>Hi ${user.name},</p><p>Your subscription expires in a few days...</p>`
   });
   ```

### Option 2: SendGrid

1. Sign up at https://sendgrid.com
2. Install SendGrid:
   ```bash
   npm install @sendgrid/mail
   ```
3. Update the mutation similarly with SendGrid's API

## Security Notes

⚠️ **Important Security Considerations:**

1. **Admin Role Protection**: Only users with `role: "admin"` can access the dashboard
2. **No Public Access**: The admin page checks authentication and admin status
3. **Secure Your Admin Account**: Use a strong password and enable 2FA on Clerk
4. **Limit Admin Users**: Only grant admin access to trusted team members

## Customization

### Adding More Admin Features

You can extend the admin dashboard by:

1. **Adding filters**: Filter users by subscription status, plan type, etc.
2. **Search functionality**: Search users by name or email
3. **Bulk actions**: Send bulk reminders, bulk export, etc.
4. **Charts & Graphs**: Add visual charts for revenue trends
5. **User activity logs**: Track user actions and program generations

### Styling

The admin dashboard uses the same design system as your main app:
- Cyber-themed UI with grid backgrounds
- Primary color accents
- Responsive cards and tables
- Consistent button styles

## Troubleshooting

### "Access Denied" or Redirected to Home

- Ensure your account has been set as admin using Step 1
- Clear browser cache and sign out/in again
- Verify in Convex dashboard that your user has `role: "admin"`

### Reports Not Generating

- Check browser console for errors
- Ensure jsPDF and xlsx packages are installed
- Try refreshing the page

### No Data Showing

- This is normal if you have no users yet
- Create test subscriptions to see data populate
- Check Convex dashboard to verify data exists

## Support

For additional help or feature requests, refer to:
- Convex Documentation: https://docs.convex.dev
- jsPDF Documentation: https://github.com/parallax/jsPDF
- SheetJS Documentation: https://docs.sheetjs.com

---

Enjoy your new admin dashboard! 🚀

