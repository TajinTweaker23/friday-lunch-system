# LISTO - Lunch Ordering System Setup Guide

## 🚀 30-Minute Setup (Dummy-Proof Instructions)

### Prerequisites ✅
- You have SharePoint access (you mentioned you're an owner)
- You have Power Automate access (comes with Office 365)
- You have a web browser

---

## STEP 1: SharePoint Setup (10 minutes)

### 1A: Run the PowerShell Script
1. **Right-click on `sharepoint-setup.ps1`** 
2. **Select "Run with PowerShell"**
3. **When prompted, enter your SharePoint site URL** (something like: `https://yourcompany.sharepoint.com/sites/yoursite`)
4. **Wait for "Setup Complete!" message**

**What this creates:**
- 📋 Restaurant Options list
- 🗳️ Weekly Votes list  
- 🍔 Order Details list
- 👥 Participants list

### 1B: Alternative Manual Setup (if script doesn't work)
1. Go to your SharePoint site
2. Click **"Site Contents"**
3. Click **"New"** → **"List"**
4. Create these 4 lists with exact names:
   - `Restaurant_Options`
   - `Weekly_Votes` 
   - `Order_Details`
   - `Participants`

---

## STEP 2: Power Automate Setup (15 minutes)

### 2A: Import the Voting Flow
1. **Go to** https://make.powerautomate.com
2. **Click "My flows"** in left menu
3. **Click "Import"** button
4. **Click "Upload"** and select `voting-flow.zip`
5. **Click "Import"** 
6. **Click "Update"** on any connection warnings
7. **Click "Turn on"** to activate

### 2B: Import the Order Flow
1. **Click "Import"** again
2. **Upload** `order-flow.zip`
3. **Click "Import"**
4. **Click "Turn on"**

### 2C: Import the Summary Flow  
1. **Click "Import"** again
2. **Upload** `summary-flow.zip`
3. **Click "Import"**
4. **Click "Turn on"**

---

## STEP 3: Create Your Dashboard (5 minutes)

### 3A: Create Dashboard Page
1. **Go to your SharePoint site**
2. **Click "New"** → **"Page"**
3. **Name it:** "Lunch Dashboard"
4. **Click in the page content area**
5. **Copy ALL the text from `dashboard-code.html`**
6. **Paste it into the page**
7. **Click "Publish"**

---

## STEP 4: Test Everything (5 minutes)

### 4A: Add Test Restaurants
1. **Go to your SharePoint site**
2. **Click "Site Contents"**
3. **Click "Restaurant_Options"**
4. **Click "New"** and add:
   - Pizza Palace
   - Burger Barn  
   - Taco Town
   - Sandwich Shop

### 4B: Add Yourself as Participant
1. **Go to "Participants" list**
2. **Click "New"**
3. **Add your name and email**
4. **Set Active = Yes**

### 4C: Test the Flows
1. **Go to Power Automate**
2. **Click on "Weekly Voting Trigger"**
3. **Click "Test"** → **"Manually"** → **"Test"**
4. **Check your email** - you should get a voting notification

---

## 🎉 YOU'RE DONE!

### What Happens Now:
- **Thursday 12pm:** Voting automatically starts, participants get notified
- **Friday 7:45am:** Voting closes, winner announced, order collection opens  
- **Friday 11am:** You get complete order summary in your email
- **Next Monday:** Everything resets for the new week

### Your Weekly Workflow:
1. **Thursday:** Notice voting started (optional email)
2. **Friday 11am:** Check email for order summary
3. **That's it!**

---

## 🆘 If Something Goes Wrong

### Common Issues:
1. **"Permission denied"** → Make sure you're a SharePoint site owner
2. **"Flow failed"** → Check `troubleshooting.md`
3. **"No notifications sent"** → Verify participant email addresses
4. **"Wrong time zone"** → Edit flows to adjust timing

### Emergency Reset:
1. **Run** `reset-system.ps1` 
2. **Start over from Step 1**

---

## 📞 Need Help?
- Check `troubleshooting.md` for detailed solutions
- Use AI prompts in `ai-assistance.md`
- Or ask your IT department to help with SharePoint permissions
