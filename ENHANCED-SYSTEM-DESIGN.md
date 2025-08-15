# 🚀 ENHANCED LUNCH SYSTEM WITH SUBSCRIPTION PREFERENCES

## 📋 **UPDATED SYSTEM FLOW**

### **PHASE 1: Subscription & Preferences Collection**
1. **Pre-launch:** Send subscription form to all potential participants
2. **Collect preferences:** Notification methods, dietary restrictions, participation status
3. **Build notification lists:** Separate lists for each preferred channel

### **PHASE 2: Weekly Lunch Operations**
1. **Thursday 12 PM:** Send voting notifications via each person's preferred method
2. **Voting collection:** Microsoft Forms captures votes automatically
3. **Friday 7:45 AM:** Send winner announcements via preferred methods
4. **Order collection:** Microsoft Forms captures individual orders
5. **Friday 11 AM:** Compile and send summary to coordinator

## 📝 **NEW MICROSOFT FORMS TO CREATE**

### **Form 1: Subscription & Preferences Form**
**URL to create:** https://forms.microsoft.com

**Form Name:** "Lunch System Subscription & Preferences"

**Questions:**
1. **Full Name** (Text, Required)
2. **Email Address** (Text, Required) 
3. **Do you want to participate in the weekly lunch system?** (Yes/No, Required)
4. **Preferred notification method(s)** (Multiple choice, allow multiple selections):
   - Microsoft Teams
   - Outlook Email
   - Gmail
   - SMS/Text Message
   - WhatsApp
   - Telegram
5. **Phone Number** (Text, Optional - "Required if you selected SMS or WhatsApp")
6. **Telegram Username** (Text, Optional - "Required if you selected Telegram")
7. **Any dietary restrictions or preferences?** (Long text, Optional)

### **Form 2: Voting Form** (Your existing form)
**Keep existing:** https://forms.office.com/e/dH0SR0c1Gj

### **Form 3: Order Form** (Your existing form)  
**Keep existing:** https://forms.office.com/e/CxqgqQJeFh

## 🗃️ **NEW SHAREPOINT LISTS TO CREATE**

### **List 1: Subscription_Preferences** (New)
**Fields:**
- Title (Text) - Person's name
- FullName (Text)
- EmailAddress (Text)
- ParticipateInLunch (Yes/No)
- PreferredNotifications (Multiple lines of text)
- PhoneNumber (Text)
- TelegramUsername (Text)
- DietaryRestrictions (Multiple lines of text)
- SubscriptionDate (Date)

### **Lists 2-5:** (Keep your existing lists)
- Restaurant_Options
- Weekly_Votes  
- Order_Details
- Participants (can be merged with Subscription_Preferences later)

## ⚙️ **NEW POWER AUTOMATE FLOWS**

### **Flow 1: Subscription Processing Flow**
**Trigger:** When subscription form is submitted
**Actions:**
1. Get form response details
2. Create item in Subscription_Preferences list
3. Send confirmation email to subscriber
4. Notify coordinator of new subscription

### **Flow 2: Enhanced Voting Notification Flow**
**Trigger:** Thursday 12:00 PM (or manual)
**Actions:**
1. Get all active subscribers from Subscription_Preferences
2. For each subscriber:
   - If "Teams" in preferences → Post to Teams
   - If "Outlook" in preferences → Send Outlook email
   - If "Gmail" in preferences → Send Gmail
   - If "SMS" in preferences → Send Twilio SMS
   - If "WhatsApp" in preferences → Send WhatsApp via Twilio
   - If "Telegram" in preferences → Send Telegram message

### **Flow 3: Enhanced Winner Notification Flow**  
**Trigger:** Friday 7:45 AM (or manual)
**Actions:**
1. Calculate winner from votes
2. Get all active subscribers
3. Send winner announcement via each person's preferred channels

### **Flow 4: Enhanced Summary Flow**
**Trigger:** Friday 11:00 AM  
**Actions:**
1. Compile all orders
2. Send summary to coordinator
3. Optional: Post summary to Teams channel

## 🔧 **IMPLEMENTATION STEPS**

### **Step 1: Create Subscription Form (10 minutes)**
1. Go to https://forms.microsoft.com
2. Create "Lunch System Subscription & Preferences" form
3. Add all 7 questions listed above
4. Share with "Anyone with the link"
5. Copy the form URL

### **Step 2: Create SharePoint List (5 minutes)**
1. Go to your SharePoint site
2. Create "Subscription_Preferences" list
3. Add required columns (FullName, EmailAddress, etc.)

### **Step 3: Create Subscription Processing Flow (15 minutes)**
1. Go to Power Automate
2. Create flow triggered by new form responses
3. Save responses to SharePoint list
4. Send confirmation emails

### **Step 4: Send Subscription Invitation (5 minutes)**
Send this email to all potential participants:

```
Subject: 🍕 Join Our New Automated Lunch System!

Hi everyone!

We're launching an automated lunch ordering system that will make Friday lunch coordination effortless!

Please fill out this quick form to:
• Subscribe to the system
• Choose your preferred notification methods
• Share any dietary preferences

Form: [Your subscription form URL]

Takes 2 minutes, makes Fridays easier for everyone!

The system launches next Thursday. Questions? Reply to this email.

Thanks!
[Your name]
```

### **Step 5: Enhance Existing Flows**
Once you have subscription data:
1. Update your existing voting flow to use preference data
2. Update winner announcement flow for multi-channel
3. Update summary flow as needed

## 📊 **NOTIFICATION CHANNEL SETUP**

### **Immediate (No Additional Cost)**
- ✅ **Teams:** Built into Power Automate
- ✅ **Outlook:** Built into Power Automate

### **Phase 2 (Minimal Cost)**
- **Gmail:** Use Gmail connector in Power Automate
- **SMS:** Setup Twilio account + connector

### **Phase 3 (Advanced)**
- **WhatsApp:** Twilio WhatsApp Business account
- **Telegram:** Create Telegram bot

## 🎯 **BENEFITS OF THIS APPROACH**

1. **Personalized Experience:** Everyone gets notifications their preferred way
2. **Higher Participation:** People more likely to engage via preferred channels
3. **Dietary Awareness:** Can accommodate restrictions in restaurant selection
4. **Opt-in Only:** No unwanted notifications
5. **Scalable:** Easy to add new notification channels
6. **Data-driven:** Track participation and preferences

## 📅 **ROLLOUT TIMELINE**

**Week 1:** Create subscription form, send to team, collect preferences
**Week 2:** Build enhanced flows for Teams + Outlook notifications
**Week 3:** Launch lunch system with basic notifications  
**Week 4:** Add SMS/other channels based on collected preferences
**Week 5:** Full multi-channel system operational

This approach ensures you start with what works and expand based on actual user preferences rather than assumptions!
