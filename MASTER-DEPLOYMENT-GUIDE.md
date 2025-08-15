# 🚀 MASTER DEPLOYMENT GUIDE - Friday Lunch System

## 📋 Overview

This guide will walk you through setting up your automated Friday lunch ordering system. The system will:

1. **Thursday 12 PM** - Send voting emails to everyone
2. **Capture votes automatically** via Microsoft Forms
3. **Friday 7:45 AM** - Announce winner, start order collection
4. **Capture orders automatically** via Microsoft Forms
5. **Friday 11 AM** - Send you organized order summary

---

## 🛠️ PART 1: SharePoint Lists Setup (10 minutes)

### Step 1.1: Access Your SharePoint Site
1. **Open your browser** and go to: `https://oemeta01.sharepoint.com/sites/OemetaNorthAmerica`
2. **Sign in** with your work credentials
3. **You should see**: SharePoint site homepage with navigation menu on the left

**✅ Success Check**: You can see "Site Contents" in the left navigation menu

### Step 1.2: Create Restaurant Options List
1. **Click "Site Contents"** in the left menu
2. **Click "New"** at the top
3. **Click "List"** from the dropdown
4. **Enter name**: `Restaurant_Options` (exact spelling!)
5. **Click "Create"**
6. **You should see**: Empty list with "Title" column

**Add Restaurant Options:**
1. **Click "New"** in the list
2. **Enter Title**: "Pizza Palace"
3. **Click "Save"**
4. **Repeat for**:
   - "Burger Barn"
   - "Taco Town" 
   - "Sandwich Shop"

**✅ Success Check**: You have 4 restaurants in the Restaurant_Options list

### Step 1.3: Create Voting List
1. **Go back to Site Contents** (click "Site Contents" in left menu)
2. **Click "New" → "List"**
3. **Enter name**: `Weekly_Votes` (exact spelling!)
4. **Click "Create"**
5. **Leave empty for now** - votes will be added automatically

**✅ Success Check**: Empty Weekly_Votes list is created

### Step 1.4: Create Order Details List
1. **Go back to Site Contents**
2. **Click "New" → "List"**
3. **Enter name**: `Order_Details` (exact spelling!)
4. **Click "Create"**
5. **Leave empty for now** - orders will be added automatically

**✅ Success Check**: Empty Order_Details list is created

### Step 1.5: Create Participants List
1. **Go back to Site Contents**
2. **Click "New" → "List"**
3. **Enter name**: `Participants` (exact spelling!)
4. **Click "Create"**

**Add Yourself as Test Participant:**
1. **Click "New"** in the Participants list
2. **Enter Title**: Your full name
3. **Click "Save"**

**✅ Success Check**: You have 4 SharePoint lists: Restaurant_Options (with 4 items), Weekly_Votes (empty), Order_Details (empty), Participants (with you)

---

## ⚙️ PART 2: Power Automate Flows Setup (20 minutes)

### Step 2.1: Access Power Automate
1. **Open new browser tab**: `https://make.powerautomate.com`
2. **Sign in** with same work credentials
3. **You should see**: Power Automate homepage with "My flows" in left menu

**✅ Success Check**: You can see "My flows" and "Create" options

### Step 2.2: Import Voting Flow (5 minutes)
1. **Click "My flows"** in left menu
2. **Click "Import"** at the top
3. **Click "Upload"** button
4. **Select file**: `TEST-voting-flow-9-30AM.json` from your downloads
5. **Click "Import"** button

**Configure Connections:**
1. **You'll see connection warnings** - this is normal
2. **For SharePoint connection**:
   - Click dropdown next to SharePoint
   - Select "Create new" 
   - Click "Save"
   - Sign in when prompted
3. **For Office 365 connection**:
   - Click dropdown next to Office 365 Outlook
   - Select "Create new"
   - Click "Save" 
   - Sign in when prompted
4. **Click "Import"** button

**Turn On the Flow:**
1. **Click the flow name** once imported
2. **Click "Turn on"** button
3. **You should see**: "Flow is on" status

**✅ Success Check**: Voting flow shows "On" status and no connection errors

### Step 2.3: Import Winner Flow (5 minutes)
1. **Click "Import"** again at the top
2. **Upload file**: `TEST-winner-flow-9-45AM.json`
3. **Configure connections**: Same as above (SharePoint + Office 365)
4. **Import and turn on**

**✅ Success Check**: Winner flow shows "On" status

### Step 2.4: Import Summary Flow (5 minutes)
1. **Click "Import"** again
2. **Upload file**: `TEST-summary-flow-10-00AM.json`
3. **Configure connections**: Same as above
4. **Import and turn on**

**✅ Success Check**: Summary flow shows "On" status

### Step 2.5: Import Form Capture Flows (5 minutes)
1. **Import**: `VOTE-CAPTURE-FLOW.zip`
   - Set Form ID for your voting form
   - Map to correct SharePoint list
   
2. **Import**: `ORDER-CAPTURE-FLOW.zip`

**✅ Success Check**: All 5 flows show "On" status in My flows list

---

## 🧪 PART 3: Testing the System (30 minutes)

### Step 3.1: Immediate Test Schedule
The test flows are set to run:
- **9:30 AM** - Voting email (if it's past 9:30, manually trigger)
- **9:45 AM** - Winner announcement
- **10:00 AM** - Order summary

### Step 3.2: Manual Testing (If Past Scheduled Times)
**For each flow:**
1. **Go to My flows** in Power Automate
2. **Click the flow name**
3. **Click "Test"** button
4. **Select "Manually"**
5. **Click "Test"**
6. **Click "Run flow"**

### Step 3.3: Test Voting Process
1. **Check your email** for voting notification
2. **Click the voting form link**: `https://forms.office.com/e/dH0SR0c1Gj`
3. **Fill out form**:
   - Name: Your name
   - Restaurant: Pick any option
4. **Submit form**
5. **Check email** for vote confirmation

**✅ Success Check**: You receive voting email and vote confirmation

### Step 3.4: Test Order Process
1. **Check email** for winner announcement
2. **Click order form link**: `https://forms.office.com/e/CxqgqQJeFh`
3. **Fill out form**:
   - Name: Your name
   - Order: "Large pepperoni pizza"
   - Special instructions: "Extra cheese"
4. **Submit form**
5. **Check email** for order confirmation

**✅ Success Check**: You receive winner email and order confirmation

### Step 3.5: Verify Summary
1. **Check email** for order summary (arrives last)
2. **Should include**:
   - Restaurant winner (Pizza Palace)
   - Your order details
   - Professional formatting
   - Text file attachment

**✅ Success Check**: You receive complete order summary with your test order

---

## 🔄 PART 4: Converting to Production (15 minutes)

### Step 4.1: Update Flow Schedules
**For each main flow (not the capture flows):**
1. **Click flow name** → **Edit**
2. **Click the "Recurrence" trigger** at the top
3. **Update schedule**:
   - Voting flow: Thursday, 12:00 PM
   - Winner flow: Friday, 7:45 AM  
   - Summary flow: Friday, 11:00 AM
4. **Click "Save"**

### Step 4.2: Replace Test Email with Coordinator Email
**Search for `pacheco@oemeta.com` in each flow and replace with coordinator's email:**
1. **Click flow** → **Edit**
2. **Look for email actions** (they have email icons)
3. **Click each email action**
4. **Replace** `pacheco@oemeta.com` with actual coordinator email
5. **Save the flow**

### Step 4.3: Add Real Participants
1. **Go to SharePoint** → **Site Contents** → **Participants**
2. **Add team members**:
   - Click "New"
   - Enter: Title, FullName, EmailAddress
   - Make sure Active = Yes

### Step 4.4: Remove Test Labels
**Edit flows to remove "TEST:" from email subjects:**
1. **Edit each flow**
2. **Click email actions**
3. **Remove "TEST:" from Subject lines**
4. **Save**

**✅ Success Check**: All flows have production schedules and coordinator email

---

## 🎯 PART 5: Launch Announcement (5 minutes)

### Step 5.1: Send Launch Email
**Send this to your team:**

```
Subject: 🍕 NEW: Automated Friday Lunch System is Live!

Hi team!

Starting this week, we have an automated lunch ordering system:

• Thursday 12 PM: You'll get voting email with restaurant options
• Friday 7:45 AM: Winner announced + individual order form opens  
• Friday 11 AM: All orders compiled and sent to restaurant

How to use:
1. Vote when you get Thursday's email
2. Submit your individual order when you get Friday's email
3. That's it! No more manual coordination.

Voting form: https://forms.office.com/e/dH0SR0c1Gj
Order form: https://forms.office.com/e/CxqgqQJeFh

Questions? Reply to this email.

Thanks!
[Your name]
```

---

## ✅ Final Success Checklist

After completing this guide, you should have:

- [ ] 4 SharePoint lists with sample data
- [ ] 5 Power Automate flows running  
- [ ] Successful test of complete workflow
- [ ] Production schedules configured
- [ ] Coordinator email updated
- [ ] Team members added to participants
- [ ] Launch announcement sent

## 📞 Support

If you encounter issues:
1. **Check** `troubleshooting.md`
2. **Look at flow run history** in Power Automate
3. **Verify** all connections are authorized
4. **Confirm** SharePoint list names match exactly

**Your automated lunch system is now live! 🎉**
