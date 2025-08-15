# 🆘 Troubleshooting Guide

## 🔧 PowerShell Script Issues

### Error: "Execution policy restriction"
**Solution:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
Then run the script again.

### Error: "Cannot connect to SharePoint"
**Solution:**
1. Make sure you're connected to company network/VPN
2. Check your SharePoint URL is correct
3. Try this command:
```powershell
Connect-PnPOnline -Url "https://yourcompany.sharepoint.com/sites/northamerica" -Interactive
```

### Error: "Access denied"
**Solution:**
- Confirm you're an owner of the SharePoint site
- Ask IT to verify your permissions
- Try logging out and back into SharePoint

## 🔧 Power Automate Issues

### Error: "Flow import failed"
**Solution:**
1. Go to Power Automate → "Templates"
2. Search for "SharePoint approval"  
3. Use a template instead of importing
4. Modify the template with your settings

### Error: "Flows not running"
**Solution:**
1. Check each flow status (should be "On")
2. Click flow → "Run history" → check error details
3. Common fix: Re-authorize SharePoint connections

### Error: "Notifications not sending"
**Solution:**
1. Go to flow → "Connections"  
2. Remove old SharePoint connection
3. Add new connection
4. Test the flow

## 🔧 SharePoint Issues

### Error: "Dashboard not displaying"
**Solution:**
1. Edit the page
2. Delete current web part
3. Add new "Embed" web part
4. Paste the HTML code again

### Error: "Lists not created"
**Solution:**
```powershell
# Manual list creation
New-PnPList -Title "Restaurant Options" -Template GenericList
New-PnPList -Title "Weekly Votes" -Template GenericList  
New-PnPList -Title "Lunch Orders" -Template GenericList
New-PnPList -Title "Participants" -Template GenericList
```

## 🔧 Form Issues

### Error: "Forms not accessible"
**Solution:**
1. Go to Microsoft Forms
2. Settings → "Who can respond"
3. Select "Anyone can respond"
4. Copy the new link

### Error: "Responses not saving"
**Solution:**
1. Check form → "Responses" → "Open in Excel"
2. If empty, reconnect to SharePoint:
   - Form settings → "Store responses" → Select SharePoint list

## 🔧 Email Notification Issues

### Error: "Emails going to spam"
**Solution:**
1. Add your work email to safe senders
2. Check company email rules
3. Use Teams notifications instead:
```
Power Automate → Add action → "Post message in Teams"
```

### Error: "Some people not getting emails"
**Solution:**
1. Check the Participants list in SharePoint
2. Verify email addresses are correct
3. Check their spam/junk folders

## 🔧 Mobile Access Issues

### Error: "Forms don't work on phones"
**Solution:**
1. Test the direct form links
2. Create QR codes with these tools:
   - `https://qr-code-generator.com`
   - Paste your form URL
   - Print QR codes for warehouse

### Error: "SharePoint not mobile friendly"
**Solution:**
1. Use SharePoint mobile app instead
2. Or create simple HTML forms:
```html
<!-- Mobile-friendly voting form -->
<form action="your-flow-url" method="post">
  <select name="restaurant" style="font-size:18px;padding:10px;">
    <option>Pizza Palace</option>
    <option>Burger Barn</option>
  </select>
  <button type="submit" style="font-size:18px;padding:10px;">Vote</button>
</form>
```

## 🤖 AI Help Commands

If you want to modify anything, ask AI:

### Change Timing:
```
"Hey Copilot, change the voting time from Thursday 12pm to Wednesday 2pm"
```

### Add Restaurants:
```  
"Hey Copilot, add 'Taco Time' to the restaurant list"
```

### Change Notifications:
```
"Hey Copilot, send Teams messages instead of emails"
```

### Add Features:
```
"Hey Copilot, add a budget tracking feature"
```

## 📞 Emergency Fixes

### System Completely Broken:
1. Run: `.\reset-system.ps1`
2. Start setup again from Step 1

### Need Manual Override:
1. Go to SharePoint lists directly
2. Manually add/edit entries
3. Send emails manually through Outlook

### Backup Plan:
- Use simple Excel file on SharePoint
- Manual email notifications
- WhatsApp group for warehouse (if allowed)

## ✅ System Health Check

Run this monthly:
1. Test all flows manually
2. Check SharePoint list permissions  
3. Verify email deliverability
4. Update restaurant options

---
**Remember**: Every error message has a solution above. If not listed, copy the exact error and ask AI for help!
