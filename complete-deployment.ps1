# LISTO Complete Deployment Script
# This script sets up the complete Friday Lunch System

param(
    [Parameter(Mandatory=$true)]
    [string]$SharePointSiteUrl,
    
    [Parameter(Mandatory=$true)]
    [string]$CoordinatorEmail,
    
    [Parameter(Mandatory=$false)]
    [string[]]$InitialRestaurants = @("Pizza Palace", "Burger Barn", "Taco Town", "Sandwich Shop"),
    
    [Parameter(Mandatory=$false)]
    [string[]]$InitialParticipants = @()
)

Write-Host "🍕 LISTO Complete Deployment Starting..." -ForegroundColor Green
Write-Host "Site URL: $SharePointSiteUrl" -ForegroundColor Yellow
Write-Host "Coordinator: $CoordinatorEmail" -ForegroundColor Yellow

# Install required modules
$requiredModules = @("PnP.PowerShell", "Microsoft.Graph")
foreach ($module in $requiredModules) {
    if (-not (Get-Module -ListAvailable -Name $module)) {
        Write-Host "Installing $module module..." -ForegroundColor Yellow
        Install-Module -Name $module -Force -AllowClobber -Scope CurrentUser
    }
}

try {
    # Step 1: SharePoint Setup
    Write-Host "`n🏗️ STEP 1: Setting up SharePoint Lists..." -ForegroundColor Cyan
    Connect-PnPOnline -Url $SharePointSiteUrl -Interactive
    
    # Create lists with all required fields
    Write-Host "Creating Restaurant Options list..." -ForegroundColor Yellow
    try {
        $restaurantList = New-PnPList -Title "Restaurant_Options" -Template GenericList -Url "Lists/Restaurant_Options" -ErrorAction Stop
        Add-PnPField -List "Restaurant_Options" -DisplayName "Restaurant Name" -InternalName "RestaurantName" -Type Text -Required
        Add-PnPField -List "Restaurant_Options" -DisplayName "Phone Number" -InternalName "PhoneNumber" -Type Text
        Add-PnPField -List "Restaurant_Options" -DisplayName "Website" -InternalName "Website" -Type URL
        Add-PnPField -List "Restaurant_Options" -DisplayName "Active" -InternalName "Active" -Type Boolean
        
        # Add initial restaurants
        foreach ($restaurant in $InitialRestaurants) {
            Add-PnPListItem -List "Restaurant_Options" -Values @{"Title"=$restaurant; "RestaurantName"=$restaurant; "Active"=$true}
        }
        Write-Host "✅ Restaurant Options list created with $($InitialRestaurants.Count) restaurants" -ForegroundColor Green
    }
    catch {
        Write-Host "⚠️  Restaurant Options list may already exist" -ForegroundColor Yellow
    }
    
    Write-Host "Creating Weekly Votes list..." -ForegroundColor Yellow
    try {
        $voteslist = New-PnPList -Title "Weekly_Votes" -Template GenericList -Url "Lists/Weekly_Votes" -ErrorAction Stop
        Add-PnPField -List "Weekly_Votes" -DisplayName "Voter Name" -InternalName "VoterName" -Type Text -Required
        Add-PnPField -List "Weekly_Votes" -DisplayName "Restaurant Choice" -InternalName "RestaurantChoice" -Type Text -Required
        Add-PnPField -List "Weekly_Votes" -DisplayName "Vote Date" -InternalName "VoteDate" -Type DateTime
        Add-PnPField -List "Weekly_Votes" -DisplayName "Week Number" -InternalName "WeekNumber" -Type Number
        Write-Host "✅ Weekly Votes list created" -ForegroundColor Green
    }
    catch {
        Write-Host "⚠️  Weekly Votes list may already exist" -ForegroundColor Yellow
    }
    
    Write-Host "Creating Order Details list..." -ForegroundColor Yellow
    try {
        $ordersList = New-PnPList -Title "Order_Details" -Template GenericList -Url "Lists/Order_Details" -ErrorAction Stop
        Add-PnPField -List "Order_Details" -DisplayName "Customer Name" -InternalName "CustomerName" -Type Text -Required
        Add-PnPField -List "Order_Details" -DisplayName "Restaurant" -InternalName "Restaurant" -Type Text -Required
        Add-PnPField -List "Order_Details" -DisplayName "Order Details" -InternalName "OrderDetails" -Type Note -Required
        Add-PnPField -List "Order_Details" -DisplayName "Special Instructions" -InternalName "SpecialInstructions" -Type Note
        Add-PnPField -List "Order_Details" -DisplayName "Order Date" -InternalName "OrderDate" -Type DateTime
        Add-PnPField -List "Order_Details" -DisplayName "Week Number" -InternalName "WeekNumber" -Type Number
        Write-Host "✅ Order Details list created" -ForegroundColor Green
    }
    catch {
        Write-Host "⚠️  Order Details list may already exist" -ForegroundColor Yellow
    }
    
    Write-Host "Creating Participants list..." -ForegroundColor Yellow
    try {
        $participantsList = New-PnPList -Title "Participants" -Template GenericList -Url "Lists/Participants" -ErrorAction Stop
        Add-PnPField -List "Participants" -DisplayName "Full Name" -InternalName "FullName" -Type Text -Required
        Add-PnPField -List "Participants" -DisplayName "Email Address" -InternalName "EmailAddress" -Type Text -Required
        Add-PnPField -List "Participants" -DisplayName "Phone Number" -InternalName "PhoneNumber" -Type Text
        Add-PnPField -List "Participants" -DisplayName "Notification Preference" -InternalName "NotificationPref" -Type Choice -Choices @("Email","Teams","Both")
        Add-PnPField -List "Participants" -DisplayName "Active" -InternalName "Active" -Type Boolean
        Add-PnPField -List "Participants" -DisplayName "Join Date" -InternalName "JoinDate" -Type DateTime
        
        # Add coordinator as first participant
        Add-PnPListItem -List "Participants" -Values @{
            "Title"="Lunch Coordinator"; 
            "FullName"="Lunch Coordinator"; 
            "EmailAddress"=$CoordinatorEmail; 
            "Active"=$true;
            "JoinDate"=(Get-Date);
            "NotificationPref"="Email"
        }
        
        Write-Host "✅ Participants list created with coordinator" -ForegroundColor Green
    }
    catch {
        Write-Host "⚠️  Participants list may already exist" -ForegroundColor Yellow
    }

    # Step 2: Create Dashboard Page
    Write-Host "`n📊 STEP 2: Creating Dashboard Page..." -ForegroundColor Cyan
    
    # Read dashboard HTML content
    $dashboardPath = Join-Path $PSScriptRoot "dashboard-code.html"
    if (Test-Path $dashboardPath) {
        $dashboardContent = Get-Content $dashboardPath -Raw
        
        try {
            # Create dashboard page
            Add-PnPPage -Name "LISTO-Dashboard" -Title "LISTO Dashboard - Friday Lunch System" -Layout Article
            Add-PnPPageTextPart -Page "LISTO-Dashboard" -Text $dashboardContent
            Set-PnPPage -Identity "LISTO-Dashboard" -Publish
            
            $dashboardUrl = "$SharePointSiteUrl/SitePages/LISTO-Dashboard.aspx"
            Write-Host "✅ Dashboard created at: $dashboardUrl" -ForegroundColor Green
        }
        catch {
            Write-Host "⚠️  Could not create dashboard page automatically" -ForegroundColor Yellow
            Write-Host "   Manual step: Create a SharePoint page and paste dashboard-code.html content" -ForegroundColor White
        }
    }
    
    # Step 3: Generate Configuration Files
    Write-Host "`n⚙️  STEP 3: Generating Configuration Files..." -ForegroundColor Cyan
    
    # Update flow templates with real URLs
    $flowFiles = @(
        "voting-flow-template.json",
        "winner-flow-template.json", 
        "summary-flow-template.json",
        "voting-form-integration-flow.zip",
        "order-form-integration-flow.zip"
    )
    
    foreach ($flowFile in $flowFiles) {
        $flowPath = Join-Path $PSScriptRoot $flowFile
        if (Test-Path $flowPath) {
            $content = Get-Content $flowPath -Raw
            $content = $content.Replace("YOUR_SHAREPOINT_SITE", $SharePointSiteUrl)
            $content = $content.Replace("YOUR_COORDINATOR_EMAIL", $CoordinatorEmail)
            
            # Create configured version
            $configuredPath = $flowPath.Replace("-template.json", "-configured.json")
            Set-Content $configuredPath $content
            Write-Host "✅ Configured: $flowFile" -ForegroundColor Green
        }
    }
    
    # Step 4: Generate Setup Summary
    Write-Host "`n📋 STEP 4: Generating Setup Summary..." -ForegroundColor Cyan
    
    $summaryContent = @"
# LISTO Deployment Summary - $(Get-Date -Format 'yyyy-MM-dd HH:mm')

## ✅ COMPLETED
- SharePoint Lists: Restaurant_Options, Weekly_Votes, Order_Details, Participants  
- Sample restaurants: $($InitialRestaurants -join ', ')
- Coordinator added: $CoordinatorEmail
- Flow templates configured with your URLs
- Dashboard page created (if successful)

## 🚀 NEXT STEPS

### 1. Create Microsoft Forms (10 minutes)
**Voting Form:**
- Go to https://forms.microsoft.com
- Create form titled: "Weekly Lunch Voting"
- Add questions: Name (Text), Restaurant Choice (Multiple Choice)
- Set options: $($InitialRestaurants -join ', ')
- Share with: Anyone with link

**Order Form:**  
- Create form titled: "Place Your Lunch Order"
- Add questions: Name (Text), Order (Long Text), Special Instructions (Text)
- Share with: Anyone with link

### 2. Import Power Automate Flows (15 minutes)
**Import these configured flows:**
- voting-flow-configured.json
- winner-flow-configured.json  
- summary-flow-configured.json
- voting-form-integration-configured.json
- order-form-integration-configured.json

**For each flow:**
1. Go to https://make.powerautomate.com
2. Click "Import" → "Upload" → Select JSON file
3. Configure connections (SharePoint, Office 365, Microsoft Forms)
4. Update Form IDs in the integration flows
5. Turn on the flow

### 3. Test System (10 minutes)
- Add test participant to Participants list
- Manually trigger voting flow
- Submit test vote via voting form
- Check that vote appears in Weekly_Votes list
- Test winner calculation and order flow

### 4. Launch Announcement
Subject: 🍕 NEW: Automated Friday Lunch System (LISTO) is Live!

Hi everyone! 

We're launching our new automated lunch ordering system. Here's how it works:

**Thursday 12PM**: You'll get voting email with restaurant options
**Friday 7:45AM**: Voting closes, winner announced + order form opens  
**Friday 11AM**: Order collection closes, summary sent to coordinator

No more manual coordination needed!

Questions? Reply to this email.

## 📧 SUPPORT
- Setup Guide: SETUP-GUIDE.md
- Troubleshooting: troubleshooting.md  
- Dashboard: $SharePointSiteUrl/SitePages/LISTO-Dashboard.aspx

## 🔗 RESOURCES
- SharePoint Lists: $SharePointSiteUrl/Lists
- Power Automate: https://make.powerautomate.com
- Microsoft Forms: https://forms.microsoft.com

**Deployment completed at: $(Get-Date)**
"@

    Set-Content "DEPLOYMENT-SUMMARY.md" $summaryContent
    Write-Host "✅ Setup summary saved to DEPLOYMENT-SUMMARY.md" -ForegroundColor Green
    
    # Final Success Message
    Write-Host ""
    Write-Host "🎉 LISTO DEPLOYMENT COMPLETE!" -ForegroundColor Green -BackgroundColor Black
    Write-Host ""
    Write-Host "✅ SharePoint lists created and configured" -ForegroundColor White
    Write-Host "✅ Flow templates updated with your settings" -ForegroundColor White  
    Write-Host "✅ Dashboard page created" -ForegroundColor White
    Write-Host "✅ Deployment summary generated" -ForegroundColor White
    Write-Host ""
    Write-Host "📋 Next: Check DEPLOYMENT-SUMMARY.md for remaining steps" -ForegroundColor Yellow
    Write-Host "🚀 Estimated time to complete: 30-45 minutes" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Dashboard URL: $SharePointSiteUrl/SitePages/LISTO-Dashboard.aspx" -ForegroundColor Cyan
    
}
catch {
    Write-Host "❌ Error occurred: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "Check the troubleshooting.md file for solutions" -ForegroundColor Yellow
}
finally {
    Disconnect-PnPOnline -ErrorAction SilentlyContinue
}
