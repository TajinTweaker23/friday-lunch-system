# Microsoft Forms Setup Guide

## 🗳️ Voting Form Setup

### Step 1: Create Voting Form
1. **Go to** https://forms.microsoft.com
2. **Click "New Form"**
3. **Title:** "Weekly Lunch Voting"
4. **Description:** "Vote for this week's restaurant! Voting closes Friday at 7:45 AM."

### Step 2: Add Questions

#### Question 1: Name
- **Type:** Text
- **Question:** "Your Name"
- **Required:** Yes

#### Question 2: Restaurant Choice  
- **Type:** Choice (Single Answer)
- **Question:** "Which restaurant do you vote for this week?"
- **Options:** (Add your restaurants)
  - Pizza Palace
  - Burger Barn
  - Taco Town
  - Sandwich Shop
- **Required:** Yes

### Step 3: Form Settings
1. **Click Settings (gear icon)**
2. **Who can fill out this form:** Anyone with the link
3. **Record name:** Off (for privacy)
4. **One response per person:** On
5. **Start and end dates:** Set if desired
6. **Click "Share"**
7. **Copy the link** - this goes in your Power Automate flows

---

## 🍔 Order Form Setup

### Step 1: Create Order Form
1. **Go to** https://forms.microsoft.com
2. **Click "New Form"**
3. **Title:** "Weekly Lunch Order"
4. **Description:** "Place your individual lunch order. Orders close at 11:00 AM Friday."

### Step 2: Add Questions

#### Question 1: Name
- **Type:** Text
- **Question:** "Your Name"
- **Required:** Yes

#### Question 2: Confirm Restaurant
- **Type:** Text
- **Question:** "Restaurant (auto-filled from voting winner)"
- **Default answer:** Will be filled by Power Automate
- **Read-only:** Make sure this is clear it's just for confirmation

#### Question 3: Order Details
- **Type:** Long Text
- **Question:** "What would you like to order?"
- **Placeholder:** "e.g., Large pepperoni pizza, Diet Coke"
- **Required:** Yes

#### Question 4: Special Instructions
- **Type:** Long Text
- **Question:** "Special instructions or dietary requirements (optional)"
- **Placeholder:** "e.g., No onions, extra sauce, allergic to nuts"
- **Required:** No

### Step 3: Form Settings
1. **Same settings as voting form**
2. **Share and copy link** for Power Automate flows

---

## 📝 Opt-In Registration Form

### Step 1: Create Registration Form
1. **Go to** https://forms.microsoft.com
2. **Click "New Form"**  
3. **Title:** "Join LISTO - Weekly Lunch Program"
4. **Description:** "Sign up to participate in our weekly lunch ordering system!"

### Step 2: Add Questions

#### Question 1: Full Name
- **Type:** Text
- **Question:** "Full Name"
- **Required:** Yes

#### Question 2: Email
- **Type:** Text
- **Question:** "Email Address"
- **Required:** Yes

#### Question 3: Phone (Optional)
- **Type:** Text
- **Question:** "Phone Number (optional)"
- **Required:** No

#### Question 4: Notification Preference
- **Type:** Choice
- **Question:** "How would you like to receive notifications?"
- **Options:**
  - Email only
  - Teams only (if you have access)
  - Both Email and Teams
- **Required:** Yes

#### Question 5: Confirmation
- **Type:** Choice
- **Question:** "I want to participate in the weekly lunch program"
- **Options:**
  - Yes, sign me up!
  - No thanks
- **Required:** Yes

### Step 3: Auto-Response Setup
1. **Settings → Response options**
2. **Send email receipt to respondents:** On
3. **Receipt message:** "Welcome to LISTO! You'll receive your first voting notification next Thursday at 12 PM."

---

## 🔗 Integration with Power Automate

### Connecting Forms to SharePoint

#### For Voting Form:
1. **In Power Automate, add trigger:** "When a new response is submitted"
2. **Select your Voting form**
3. **Add action:** "Get response details"
4. **Add action:** "Create item in SharePoint" 
5. **List:** Weekly_Votes
6. **Map fields:**
   - VoterName → Name response
   - RestaurantChoice → Restaurant response
   - VoteDate → Current time
   - WeekNumber → Current week formula

#### For Order Form:
1. **Similar setup but map to:** Order_Details list
2. **Map fields:**
   - CustomerName → Name response
   - Restaurant → Restaurant response
   - OrderDetails → Order response
   - SpecialInstructions → Instructions response
   - OrderDate → Current time
   - WeekNumber → Current week formula

#### For Opt-In Form:
1. **Map to:** Participants list
2. **Map fields:**
   - FullName → Name response
   - EmailAddress → Email response
   - PhoneNumber → Phone response
   - NotificationPref → Preference response
   - Active → True (if they said yes)
   - JoinDate → Current time

---

## 📱 QR Codes for Easy Access

### Generate QR Codes:
1. **Go to:** https://www.qr-code-generator.com (free)
2. **Paste your form links**
3. **Download QR codes**
4. **Print and post around office/warehouse**

### QR Code Labels:
- **"Scan to Join Lunch Program"** (opt-in form)
- **"Scan to Vote"** (voting form - only show on Thursdays)  
- **"Scan to Order"** (order form - only show Friday mornings)

---

## ✅ Testing Your Forms

### Test Checklist:
- [ ] Forms submit successfully
- [ ] Data appears in SharePoint lists
- [ ] Email notifications work
- [ ] QR codes scan correctly
- [ ] Mobile-friendly display
- [ ] Required fields work
- [ ] Form responses trigger Power Automate flows

### Test Users:
Create test entries with yourself to verify everything works before going live.
