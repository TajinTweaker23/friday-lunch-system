# LISTO SharePoint Setup Script
# This script creates all the SharePoint lists needed for the lunch ordering system

param(
    [Parameter(Mandatory=$true)]
    [string]$SharePointSiteUrl
)

Write-Host "🍕 LISTO Setup Starting..." -ForegroundColor Green
Write-Host "Site URL: $SharePointSiteUrl" -ForegroundColor Yellow

# Install PnP PowerShell if not already installed
if (-not (Get-Module -ListAvailable -Name "PnP.PowerShell")) {
    Write-Host "Installing PnP PowerShell module..." -ForegroundColor Yellow
    Install-Module -Name "PnP.PowerShell" -Force -AllowClobber -Scope CurrentUser
}

try {
    # Connect to SharePoint
    Write-Host "Connecting to SharePoint..." -ForegroundColor Yellow
    Connect-PnPOnline -Url $SharePointSiteUrl -Interactive
    
    Write-Host "✅ Connected successfully!" -ForegroundColor Green
    
    # Create Restaurant Options List
    Write-Host "Creating Restaurant Options list..." -ForegroundColor Yellow
    $restaurantList = New-PnPList -Title "Restaurant_Options" -Template GenericList -Url "Lists/Restaurant_Options"
    Add-PnPField -List "Restaurant_Options" -DisplayName "Restaurant Name" -InternalName "RestaurantName" -Type Text -Required
    Add-PnPField -List "Restaurant_Options" -DisplayName "Phone Number" -InternalName "PhoneNumber" -Type Text
    Add-PnPField -List "Restaurant_Options" -DisplayName "Website" -InternalName "Website" -Type URL
    Add-PnPField -List "Restaurant_Options" -DisplayName "Active" -InternalName "Active" -Type Boolean
    
    # Add sample restaurants
    Add-PnPListItem -List "Restaurant_Options" -Values @{"Title"="Pizza Palace"; "RestaurantName"="Pizza Palace"; "Active"=$true}
    Add-PnPListItem -List "Restaurant_Options" -Values @{"Title"="Burger Barn"; "RestaurantName"="Burger Barn"; "Active"=$true}
    Add-PnPListItem -List "Restaurant_Options" -Values @{"Title"="Taco Town"; "RestaurantName"="Taco Town"; "Active"=$true}
    Add-PnPListItem -List "Restaurant_Options" -Values @{"Title"="Sandwich Shop"; "RestaurantName"="Sandwich Shop"; "Active"=$true}
    
    Write-Host "✅ Restaurant Options list created!" -ForegroundColor Green
    
    # Create Weekly Votes List
    Write-Host "Creating Weekly Votes list..." -ForegroundColor Yellow
    $voteslist = New-PnPList -Title "Weekly_Votes" -Template GenericList -Url "Lists/Weekly_Votes"
    Add-PnPField -List "Weekly_Votes" -DisplayName "Voter Name" -InternalName "VoterName" -Type Text -Required
    Add-PnPField -List "Weekly_Votes" -DisplayName "Restaurant Choice" -InternalName "RestaurantChoice" -Type Text -Required
    Add-PnPField -List "Weekly_Votes" -DisplayName "Vote Date" -InternalName "VoteDate" -Type DateTime
    Add-PnPField -List "Weekly_Votes" -DisplayName "Week Number" -InternalName "WeekNumber" -Type Number
    
    Write-Host "✅ Weekly Votes list created!" -ForegroundColor Green
    
    # Create Order Details List
    Write-Host "Creating Order Details list..." -ForegroundColor Yellow
    $ordersList = New-PnPList -Title "Order_Details" -Template GenericList -Url "Lists/Order_Details"
    Add-PnPField -List "Order_Details" -DisplayName "Customer Name" -InternalName "CustomerName" -Type Text -Required
    Add-PnPField -List "Order_Details" -DisplayName "Restaurant" -InternalName "Restaurant" -Type Text -Required
    Add-PnPField -List "Order_Details" -DisplayName "Order Details" -InternalName "OrderDetails" -Type Note -Required
    Add-PnPField -List "Order_Details" -DisplayName "Special Instructions" -InternalName "SpecialInstructions" -Type Note
    Add-PnPField -List "Order_Details" -DisplayName "Order Date" -InternalName "OrderDate" -Type DateTime
    Add-PnPField -List "Order_Details" -DisplayName "Week Number" -InternalName "WeekNumber" -Type Number
    
    Write-Host "✅ Order Details list created!" -ForegroundColor Green
    
    # Create Participants List
    Write-Host "Creating Participants list..." -ForegroundColor Yellow
    $participantsList = New-PnPList -Title "Participants" -Template GenericList -Url "Lists/Participants"
    Add-PnPField -List "Participants" -DisplayName "Full Name" -InternalName "FullName" -Type Text -Required
    Add-PnPField -List "Participants" -DisplayName "Email Address" -InternalName "EmailAddress" -Type Text -Required
    Add-PnPField -List "Participants" -DisplayName "Phone Number" -InternalName "PhoneNumber" -Type Text
    Add-PnPField -List "Participants" -DisplayName "Notification Preference" -InternalName "NotificationPref" -Type Choice -Choices @("Email","Teams","Both")
    Add-PnPField -List "Participants" -DisplayName "Active" -InternalName "Active" -Type Boolean
    Add-PnPField -List "Participants" -DisplayName "Join Date" -InternalName "JoinDate" -Type DateTime
    
    Write-Host "✅ Participants list created!" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "🎉 SETUP COMPLETE!" -ForegroundColor Green -BackgroundColor Black
    Write-Host ""
    Write-Host "✅ Created 4 SharePoint Lists:" -ForegroundColor White
    Write-Host "   📋 Restaurant_Options (with sample restaurants)" -ForegroundColor Cyan
    Write-Host "   🗳️ Weekly_Votes" -ForegroundColor Cyan  
    Write-Host "   🍔 Order_Details" -ForegroundColor Cyan
    Write-Host "   👥 Participants" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Next Step: Import the Power Automate flows!" -ForegroundColor Yellow
    Write-Host "Check your SETUP-GUIDE.md for Step 2 instructions." -ForegroundColor Yellow
    
}
catch {
    Write-Host "❌ Error occurred: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "Troubleshooting Tips:" -ForegroundColor Yellow
    Write-Host "1. Make sure you're a site owner/admin" -ForegroundColor White
    Write-Host "2. Check your SharePoint URL is correct" -ForegroundColor White
    Write-Host "3. Try running as Administrator" -ForegroundColor White
    Write-Host "4. Check troubleshooting.md for more help" -ForegroundColor White
}
finally {
    Disconnect-PnPOnline -ErrorAction SilentlyContinue
}
