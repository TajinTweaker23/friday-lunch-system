# 🎯 DEFINITIVE POWER AUTOMATE SETUP

## **WHAT YOU SEE RIGHT NOW ON YOUR SCREEN**

Based on your screenshot, you have:
- ✅ Power Automate flow builder open
- ✅ "Get response details" action with form dropdown
- ✅ "Create item" action below it
- ✅ Form list showing many forms including "Weekly Lunch Vote"

---

## 🔧 **STEP-BY-STEP CONFIGURATION (10-YEAR-OLD PROOF)**

### **STEP 1: Select Your Subscription Form**

**What you see:** Form dropdown with many options (ISO HUB, Lunch Order Form, Weekly Lunch Vote, etc.)

**What to do:**
1. **Click the dropdown** where it says "Unique identifier of the form"
2. **Scroll down** in the list until you see: **"Lunch System Notifications"** 
   - This is your subscription form (ID: Ncx0j1M6QR)
3. **Click on "Lunch System Notifications"**
4. **Form Id will auto-populate** with the correct ID

**If you don't see "Lunch System Notifications":**
1. **Click "Enter custom value"** at bottom of dropdown
2. **Type exactly:** `Ncx0j1M6QR`
3. **Press Enter**

### **STEP 2: Fix Response ID** 

**What you see:** "Response Id" field with an X next to it

**What to do:**
1. **Click the X** to remove the current Response Id
2. **Click in the empty Response Id field**
3. **Click the lightning bolt** (Dynamic content) that appears
4. **Select "Response Id"** from the list that pops up
   - It should be at the top under "When a new response is submitted"

### **STEP 3: Click "Got it" to Dismiss Blue Box**

**What you see:** Blue box saying "Expand or collapse all actions"

**What to do:**
1. **Click "Got it"** to dismiss this box
2. **Now you can see the "Create item" action clearly**

### **STEP 4: Configure SharePoint "Create item"**

**What you see:** "Create item" action with "Invalid parameters" warning

**What to do:**
1. **Click on the "Create item" action** to expand it
2. **You'll see three fields:**
   - Site Address (dropdown)
   - List Name (dropdown) 
   - Multiple field mapping boxes

### **STEP 5: Select SharePoint Site**

**What you see:** "Site Address" dropdown

**What to do:**
1. **Click the Site Address dropdown**
2. **Look for:** `https://oemeta01.sharepoint.com/sites/OemetaNorthAmerica`
3. **Click on this exact site**
   - If you don't see it, type the URL manually

### **STEP 6: Select SharePoint List**

**What you see:** "List Name" dropdown (now populated after selecting site)

**What to do:**
1. **Click the List Name dropdown**
2. **Look for:** "Lunch Subscription Preferences"
3. **Click on "Lunch Subscription Preferences"**
   - This is where your subscription form data will go

### **STEP 7: Map Form Fields to SharePoint Columns**

**What you see:** Multiple field boxes for SharePoint columns

**What to do - Map these EXACTLY:**

**Title field:**
1. **Click in the "Title" field**
2. **Click lightning bolt** (Dynamic content)
3. **Select:** "Full Name" (from Get response details section)

**Email field:**
1. **Click in the "Email" field** 
2. **Click lightning bolt**
3. **Select:** "Email Address"

**Participate field:**
1. **Click in the "Participate" field**
2. **Click lightning bolt**  
3. **Select:** "Do you want to participate in the weekly lunch system?"

**NotificationMethods field:**
1. **Click in the "NotificationMethods" field**
2. **Click lightning bolt**
3. **Select:** "Preferred notification method(s) (select all that apply)"

**Phone field:**
1. **Click in the "Phone" field**
2. **Click lightning bolt**
3. **Select:** "Phone Number"

**TelegramUsername field:**
1. **Click in the "TelegramUsername" field**
2. **Click lightning bolt** 
3. **Select:** "Telegram Username (Optional)"

**DietaryNotes field:**
1. **Click in the "DietaryNotes" field**
2. **Click lightning bolt**
3. **Select:** "Any dietary restrictions or preferences?"

### **STEP 8: Save and Turn On**

**What to do:**
1. **Click "Save"** (top right corner)
2. **Click "Turn on"** (top right corner) 
3. **Verify status shows:** "Flow is on"

---

## 🧪 **IMMEDIATE TEST**

### **Test Your Flow:**
1. **Go to:** https://forms.office.com/e/Ncx0j1M6QR
2. **Fill out the form** with your real information
3. **Submit it**
4. **Wait 2 minutes**
5. **Check your SharePoint list:** 
   - Go to: https://oemeta01.sharepoint.com/sites/OemetaNorthAmerica/Lists/Lunch%20Subscription%20Preferences/AllItems.aspx
   - **You should see your entry**

### **Check Flow History:**
1. **In Power Automate**, click your flow name
2. **Click "Run history"**
3. **Look for green checkmark** (success) or red X (error)

---

## ⚠️ **IF SOMETHING GOES WRONG**

### **Form not in dropdown:**
- **Select "Enter custom value"** at bottom of dropdown
- **Type:** `Ncx0j1M6QR`

### **SharePoint site not showing:**
- **Type manually:** `https://oemeta01.sharepoint.com/sites/OemetaNorthAmerica`

### **List not showing:**
- **Refresh the page** and try again
- **Verify you have permissions** to the SharePoint site

### **Dynamic content fields missing:**
- **Save the flow first**
- **Go back and try mapping again**
- **Make sure Form Id is set correctly**

### **Flow won't turn on:**
- **Check all required fields are mapped** (no red warnings)
- **Save first, then turn on**

---

## ✅ **SUCCESS CRITERIA**

**Your flow is working when:**
- ✅ Form submission creates SharePoint list entry
- ✅ All form data appears in SharePoint correctly
- ✅ Flow run history shows green checkmarks
- ✅ No error messages in flow

**Ready? Start with Step 1 - Select your form from the dropdown!** 🚀
