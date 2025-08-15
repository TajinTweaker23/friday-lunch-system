# 🚀 QUICK START: Enhanced Lunch System

## ⚡ **IMMEDIATE ACTION PLAN** 

### **Step 1: Create Subscription Form (5 minutes)**

1. Go to **https://forms.microsoft.com**
2. Click **+ New Form**
3. Title: **"Lunch System Subscription & Preferences"**
4. Add these 7 questions EXACTLY:

```
1. Full Name
   - Type: Text
   - Required: Yes

2. Email Address  
   - Type: Text
   - Required: Yes

3. Do you want to participate in the weekly lunch system?
   - Type: Choice
   - Options: Yes, No
   - Required: Yes

4. Preferred notification method(s) (select all that apply)
   - Type: Choice (Multiple selections allowed)
   - Options: Microsoft Teams, Outlook Email, Gmail, SMS/Text Message, WhatsApp, Telegram
   - Required: Yes

5. Phone Number
   - Type: Text
   - Required: No
   - Subtitle: "Required if you selected SMS or WhatsApp"

6. Telegram Username (Optional)
   - Type: Text  
   - Required: No
   - Subtitle: "Required if you selected Telegram (without @)"

7. Any dietary restrictions or preferences?
   - Type: Long answer
   - Required: No
```

✅ **COMPLETED!** Your form: https://forms.office.com/e/Ncx0j1M6QR
✅ **SharePoint List:** https://oemeta01.sharepoint.com/:l:/s/OemetaNorthAmerica/FL5rsN0T7cxJpWeZcLdsP88BkrxTaSE02iFuTlOfEnsPTg

✅ **COMPLETED!** Your SharePoint list is ready!

### **Step 3: Import Subscription Flow (DETAILED WALKTHROUGH)**

**🎯 Goal:** Set up the automation that processes subscription form responses

#### **3A. Export Flow as ZIP File (3 minutes) - IMPORTANT**

**Note:** Power Automate requires a `.zip` package file for import, not a `.json` file.

**If you have an existing flow to export:**

1. Go to **<https://flow.microsoft.com>**
2. Sign in with your work account
3. Click **"My flows"** in the left sidebar
4. Find your flow and click the **"..."** (three dots) menu
5. Select **"Export"** → **"Package (.zip)"**
6. Choose export settings:
   - Name: Keep default or rename
   - Click **"Export"** 
7. **Download** the `.zip` file to your computer

**If you don't have a flow to export:**

- The workspace should contain `SUBSCRIPTION-PROCESSING-FLOW.zip`
- If you only see `.json` files, you'll need to create the flow manually using the JSON as reference

#### **3B. Go to Power Automate (1 minute)**

1. Open **<https://flow.microsoft.com>** in a new tab
2. **Sign in** with your work account (same one you used for SharePoint)
3. You should see the Power Automate dashboard

#### **3C. Import the Flow (2 minutes)**

1. Click **"My flows"** in the left sidebar
2. Click **"Import"** at the top
3. Click **"Upload"** and select your `SUBSCRIPTION-PROCESSING-FLOW.zip` file
4. Click **"Import"** - you'll see a screen with connection requirements

#### **3D. Configure Connections (5 minutes) - CRITICAL STEP**

You'll see 3 connections that need to be set up:

**Connection 1: Microsoft Forms**

- Click **"Select during import"**
- Choose **"Create new"**
- Click **"Save"** (it will connect automatically)

**Connection 2: SharePoint**

- Click **"Select during import"**
- Choose **"Create new"**
- Click **"Save"** (it will connect to your SharePoint site)

**Connection 3: Office 365 Outlook**

- Click **"Select during import"**
- Choose **"Create new"**
- Click **"Save"** (connects your email for sending confirmations)

#### **3E. Update Form ID (2 minutes) - MUST DO**

1. After importing, click **"Edit"** on the imported flow
2. Look for the trigger: **"When a new response is submitted"**
3. You'll see `YOUR_SUBSCRIPTION_FORM_ID` - **this needs to be replaced**

**To get your Form ID:**

- From your form URL: `https://forms.office.com/e/Ncx0j1M6QR`
- Your Form ID is: **`Ncx0j1M6QR`**

1. Replace `YOUR_SUBSCRIPTION_FORM_ID` with `Ncx0j1M6QR`

#### **3F. Turn On the Flow (1 minute)**

1. Click **"Save"** at the top
2. Click **"Turn on"**
3. You should see "Flow is on" status

### **🧪 IMMEDIATE TEST (5 minutes)**

**Now let's test your subscription system:**

1. **Fill out your own form:** https://forms.office.com/e/Ncx0j1M6QR
   - Use your real name and email
   - Select "Yes" for participation
   - Choose "Outlook Email" as notification method
   - Add a dietary note like "No allergies" 

2. **Check SharePoint list:** 
   - Go back to your SharePoint list 
   - Refresh the page - you should see your entry appear!

3. **Check your email:**
   - You should receive a confirmation email
   - If you don't get it within 5 minutes, check your spam folder

4. **Troubleshooting if it doesn't work:**
   - Go back to Power Automate → My flows
   - Click on your imported flow
   - Check "Run history" - any red errors?
   - If there are errors, the most common issue is the Form ID

**✅ SUCCESS CRITERIA:**
- Your info appears in SharePoint list
- You get a confirmation email
- No errors in Power Automate run history

### **Step 4: Send Subscription Invitation (2 minutes)**

**Perfect! Your system is working. Now invite your team:**

Send this email to your team:

```
Subject: 🍕 New Automated Lunch System - Sign Up!

Hi team!

We're launching an automated lunch system that will make Friday coordination effortless!

Please take 2 minutes to sign up and set your preferences:
👉 https://forms.office.com/e/Ncx0j1M6QR

This will:
✅ Let you choose how you want to be notified (Teams, email, text, etc.)
✅ Capture any dietary preferences
✅ Make sure you don't miss voting

The system launches next Thursday. Questions? Just reply!

Thanks!
[Your name]
```

### **Step 5: Test and Deploy (15 minutes)**

1. **Test the subscription:**
   - Fill out your own form
   - Check SharePoint list for your entry
   - Verify you got confirmation email

2. **Wait for responses** (give team 24-48 hours)

3. **Import enhanced voting flow:**
   - Import **ENHANCED-VOTING-FLOW.zip** 
   - Configure all connections
   - Update Teams channel ID (optional)
   - Turn on the flow

4. **Ready to go!**

## 📊 **WHAT THIS GIVES YOU**

### **Immediate Benefits:**
- ✅ Personalized notifications via preferred channels
- ✅ Automatic preference storage and management
- ✅ Professional confirmation emails
- ✅ Dietary restriction tracking
- ✅ Coordinator notifications for new sign-ups

### **Week 1 Capabilities:**
- Teams notifications for those who want them
- Email notifications (Outlook + Gmail)
- Subscription management system
- Elegant HTML emails with restaurant options

### **Future Expansion:**
- SMS notifications (requires Twilio setup)
- WhatsApp notifications (requires Twilio WhatsApp)
- Telegram notifications (requires bot creation)

## 🎯 **SUCCESS METRICS**

After 1 week, you should see:
- **High participation** (people get notified their preferred way)
- **Better engagement** (personalized messages)
- **Less confusion** (dietary needs tracked)
- **Coordinator efficiency** (automatic subscription management)

## ⚠️ **IMPORTANT NOTES**

1. **Start Simple:** Begin with Teams + Email notifications
2. **Expand Gradually:** Add SMS/WhatsApp after you see demand
3. **Test Everything:** Use your own subscription first
4. **Monitor Feedback:** Ask team about notification preferences

## 🆘 **NEED HELP?**

- **Form not working?** Check the form ID in the flow
- **Emails not sending?** Verify Office 365 connection  
- **SharePoint errors?** Confirm list name and column names match exactly
- **Teams not posting?** Teams connector can be optional for now

**Ready? Start with Step 1! 🚀**
