# 🎯 YOUR COMPLETE LUNCH SYSTEM - USER-FRIENDLY SETUP

## **YOUR PERFECT SYSTEM ARCHITECTURE**

You have the ideal setup for maximum user-friendliness:

### **📝 3 FORMS → 📋 3 LISTS**

```
FORM 1: "Lunch System Notifications" → LIST: "Lunch Subscription Preferences"
   ↓ (One-time signup)
FORM 2: "Weekly Lunch Vote" → LIST: "Restaurant Votes" 
   ↓ (Weekly voting)
FORM 3: "Lunch Order Form" → LIST: "Lunch Orders"
   ↓ (Individual orders)
```

**REFERENCE:** "Restaurant List" (Master data - no form needed)

---

## 🚀 **MOST USER-FRIENDLY WORKFLOW**

### **Step 1: One-Time Setup (Subscription)**
- **Users fill**: "Lunch System Notifications" form
- **Data goes to**: "Lunch Subscription Preferences" list
- **Purpose**: Set notification preferences, dietary needs
- **Frequency**: Once per person

### **Step 2: Weekly Voting** 
- **Users fill**: "Weekly Lunch Vote" form
- **Data goes to**: "Restaurant Votes" list (Name, Restaurant, Date)
- **Purpose**: Vote on restaurant choice
- **Frequency**: Weekly (Thursdays)

### **Step 3: Individual Orders**
- **Users fill**: "Lunch Order Form" 
- **Data goes to**: "Lunch Orders" list
- **Purpose**: Place specific orders
- **Frequency**: After restaurant is chosen

---

## 🔧 **POWER AUTOMATE FLOWS STATUS**

### **✅ FLOW 1: SUBSCRIPTION FLOW (COMPLETED!)**
- **Status**: ✅ Working Successfully
- **Form**: "Lunch System Notifications"
- **List**: "Lunch Subscription Preferences"
- **Test Result**: Green checkmarks in run history

### **✅ FLOW 2: VOTING FLOW (COMPLETED!)**
- **Status**: ✅ Working Successfully
- **Form**: "Weekly Lunch Vote"  
- **List**: "Restaurant Votes"
- **Test Result**: Green checkmarks in run history

### **✅ FLOW 3: ORDER FLOW (COMPLETED!)**
- **Status**: ✅ Working Successfully
- **Form**: "Lunch Order Form"
- **List**: "Lunch Orders"
- **Test Result**: Green checkmarks in run history

---

## 🎯 **SETUP FLOW 2: VOTING SYSTEM**

### **Exact Steps for Voting Flow:**

1. **Power Automate** → **"Create"** → **"Automated cloud flow"**

2. **Name**: "Weekly Lunch Voting Flow"

3. **Trigger**: "When a new response is submitted (Microsoft Forms)"

4. **Select Form**: "Weekly Lunch Vote" from dropdown

5. **Add Action**: "Create item (SharePoint)"

6. **Configure SharePoint**:
   - **Site**: `https://oemeta01.sharepoint.com/sites/OemetaNorthAmerica`
   - **List**: "Restaurant Votes"

7. **Field Mapping (EXACT FIELDS FOR YOUR LIST)**:

   **YOUR SHAREPOINT FIELDS TO MAP:**
   - Restaurant Name (text field) 
   - Day of (date field)
   - Created By (automatically filled by SharePoint)

   **Step 7A: Map Restaurant Choice**
   1. **Look for**: A field labeled "Restaurant Name" 
   2. **Click in the Restaurant Name field box**
   3. **Click the lightning bolt** (Dynamic content)
   4. **Look for**: The restaurant choice field from your voting form (might be "Restaurant Choice", "Which restaurant", etc.)
   5. **Click on the restaurant field** from the dynamic content list

   **Step 7B: Add Today's Date (AUTOMATIC)**
   1. **Look for**: A field labeled "Day of"
   2. **Click in the Day of field box** 
   3. **Click the lightning bolt** (Dynamic content)
   4. **At the bottom, click "Expression"** (tab next to Dynamic content)
   5. **Type exactly**: `utcnow()`
   6. **Click "OK"**
   
   This automatically adds today's date/time when someone votes.

   **Step 7C: Created By (No Action Needed)**
   - SharePoint automatically fills "Created By" with the person who submitted the form
   - You don't need to map this field - it's automatic!

8. **Save and Turn On**:
   1. **Click "Save"** (top right corner)
   2. **Click "Turn on"** (top right corner)
   3. **Status should show**: "Flow is on"

9. **Test Your Voting Flow**:
   1. **Find your "Weekly Lunch Vote" form** (check Microsoft Forms)
   2. **Fill it out yourself** with a test vote
   3. **Submit the form**
   4. **Wait 1-2 minutes**
   5. **Check your "Restaurant Votes" SharePoint list**
   6. **Verify**: Your test vote appears with name, restaurant, and date

10. **Verify Flow Success**:
    1. **Go back to Power Automate** 
    2. **Click your voting flow name**
    3. **Click "Run history"**
    4. **Look for green checkmark** = success, red X = error
    5. **If error**: Click the red entry to see what went wrong

---

## 🎯 **SETUP FLOW 3: ORDER SYSTEM (DETAILED WALKTHROUGH)**

### **Exact Steps for Order Flow:**

**Step 1: Create New Flow**
1. **Go to**: [Power Automate](https://make.powerautomate.com)
2. **Click**: "Create" (left sidebar)
3. **Click**: "Automated cloud flow"
4. **Flow name**: Type "Lunch Order Processing Flow"
5. **Skip the trigger selection** → Click "Create"

**Step 2: Set Up Form Trigger**
1. **Search for**: "Microsoft Forms"
2. **Select**: "When a new response is submitted"
3. **Sign in** if prompted
4. **Form Id dropdown**: Select "Lunch Order Form"
5. **Click**: "New step"

**Step 3: Add SharePoint Action**
1. **Search for**: "SharePoint"
2. **Select**: "Create item"
3. **Sign in** if prompted (if not already connected)

**Step 4: Configure SharePoint Connection**
1. **Site Address**: Select "Oemeta North America Internal - https://oemeta01.sharepoint.com/sites/OemetaNorthAmerica"
2. **List Name**: Select "Lunch Orders" from dropdown

**Step 5: Get Form Details**
1. **Click**: "New step" 
2. **Search for**: "Microsoft Forms"
3. **Select**: "Get response details"
4. **Form Id**: Select "Lunch Order Form" (same as before)
5. **Response Id**: Click lightning bolt → Select **"Response Id"** from **"When a new response is submitted"** section (NOT the "ID" from "Lunch Orders" section)

**Step 6: Field Mapping (EXACT FIELDS FOR YOUR LIST)**:

   **PERFECT! YOUR DYNAMIC CONTENT NOW SHOWS:**
   - Name (from Lunch Order Form)
   - Order Details (from Lunch Order Form)
   - Special Instructions (from Lunch Order Form)

   **Step 6A: Map Employee Name**
   1. **Clear the current "Name" mapping** (click X to remove it)
   2. **Click in the Employee Name field box**
   3. **Click the lightning bolt** (Dynamic content)
   4. **Click "Name"** from **"Lunch Order Form"** section

   **Step 6B: Map Restaurant**
   1. **Click in the Restaurant field box**
   2. **Click the lightning bolt** (Dynamic content)
   3. **Type "restaurant"** in the search box (this will help find the restaurant field)
   4. **Look for restaurant field** from "Lunch Order Form" section and click it
   
   **Step 6C: Map Order Details**
   1. **Clear the current "Order Details" mapping** (click X to remove it)
   2. **Click in the Order Details field box**
   3. **Click the lightning bolt** (Dynamic content)
   4. **Click "Order Details"** from **"Lunch Order Form"** section

   **Step 6D: Map Allergies/Notes**
   1. **Clear the current "Special Instructions" mapping** (click X to remove it)
   2. **Click in the Allergies/Notes field box**
   3. **Click the lightning bolt** (Dynamic content)
   4. **Click "Special Instructions"** from **"Lunch Order Form"** section

   **Step 6E: Add Today's Date (AUTOMATIC)**
   1. **Click in the Date field box** 
   2. **Click the lightning bolt** (Dynamic content)
   3. **At the bottom, click "Expression"** (tab next to Dynamic content)
   4. **Type exactly**: `utcToday()`
   5. **Click "OK"**
   
   This automatically adds today's date when someone places an order.

**Step 7: Save and Turn On**
1. **Click "Save"** (top right corner)
2. **Click "Turn on"** (top right corner)
3. **Status should show**: "Flow is on"

**Step 8: Test Your Order Flow**
1. **Find your "Lunch Order Form"** (check Microsoft Forms)
2. **Fill it out yourself** with a test order
3. **Submit the form**
4. **Wait 1-2 minutes**
5. **Check your "Lunch Orders" SharePoint list**
6. **Verify**: Your test order appears with all details

**Step 9: Verify Flow Success**
1. **Go back to Power Automate** 
2. **Click your order flow name**
3. **Click "Run history"**
4. **Look for green checkmark** = success, red X = error

---

## 📊 **USER EXPERIENCE FLOW**

### **For Team Members:**

1. **Week 1**: Fill out subscription form (one-time)
2. **Every Thursday**: Get notification → Fill voting form
3. **After voting closes**: Get notification → Fill order form
4. **Friday**: Enjoy lunch!

### **For You (Coordinator):**

1. **Check "Restaurant Votes" list** → Determine winner
2. **Send order form** to team
3. **Check "Lunch Orders" list** → Place group order
4. **Coordinate pickup/delivery**

---

## 🎯 **IMMEDIATE NEXT ACTION**

**Set up the Voting Flow:**

1. **Go to Power Automate** → **"Create"**
2. **Choose**: "Automated cloud flow"
3. **Name**: "Weekly Lunch Voting Flow"
4. **Trigger**: Microsoft Forms → "Weekly Lunch Vote"
5. **Action**: SharePoint → "Restaurant Votes" list
6. **Map**: Name, Restaurant, Date

**Want me to guide you through setting up the Voting Flow step-by-step?**

---

## ✅ **SYSTEM ADVANTAGES**

**Maximum User-Friendliness:**
- ✅ Separate forms = clear purpose for users
- ✅ Simple fields = quick completion
- ✅ Automated workflows = no manual work
- ✅ SharePoint lists = easy coordinator oversight

**Technical Benefits:**
- ✅ Clean data separation
- ✅ Easy reporting and analytics
- ✅ Scalable for team growth
- ✅ Flexible notification options

**Ready to set up your Voting Flow?** 🚀
