# Friday Lunch Ordering System (LISTO)

**🍽️ Automated Weekly Lunch Coordination System**

## 📋 What This System Does

- **Thursday 12:00 PM**: Automatically starts restaurant voting via email
- **Forms capture votes**: People vote using Microsoft Forms
- **Friday 7:45 AM**: Announces winner, starts individual order collection
- **Forms capture orders**: People submit lunch orders via Microsoft Forms
- **Friday 11:00 AM**: Sends you complete organized order summary

## 🎯 Your Configuration

- **SharePoint Site**: `https://oemeta01.sharepoint.com/sites/OemetaNorthAmerica`
- **Voting Form**: `https://forms.office.com/e/dH0SR0c1Gj`
- **Order Form**: `https://forms.office.com/e/CxqgqQJeFh`
- **Testing Email**: `pacheco@oemeta.com` (marked for easy replacement with coordinator's email)

## 🚀 Ready to Deploy

All flows are configured with your specific details. Follow the **MASTER-DEPLOYMENT-GUIDE.md** for complete step-by-step instructions.

## 📁 System Files

### Core Flows (Ready to Import)
- `TEST-voting-flow-9-30AM.json` - Sends voting emails (configured for immediate testing)
- `TEST-winner-flow-9-45AM.json` - Calculates winner & announces (configured for immediate testing)
- `TEST-summary-flow-10-00AM.json` - Compiles & sends order summary (configured for immediate testing)
- `VOTE-CAPTURE-FLOW.zip` - Automatically saves votes from Microsoft Forms to SharePoint
- `ORDER-CAPTURE-FLOW.zip` - Automatically saves orders from Microsoft Forms to SharePoint

### Setup & Infrastructure
- `sharepoint-setup.ps1` - Creates required SharePoint lists
- `complete-deployment.ps1` - Full automated deployment (for Windows environments)
- `dashboard-code.html` - Admin control panel interface

### Documentation
- `MASTER-DEPLOYMENT-GUIDE.md` - Complete step-by-step instructions
- `troubleshooting.md` - Common issues and solutions
- `email-templates.md` - All email templates used by the system
- `microsoft-forms-setup.md` - Forms creation guide

## ✅ System Status: Ready for Testing

The system is **completely configured** and ready for immediate testing. All flows include your SharePoint site, form URLs, and email addresses with clear markers for easy replacement when moving to production.
- Real-time status, quick actions, activity logs
- Modern responsive design

### ✅ Microsoft Forms Integration
- `microsoft-forms-setup.md` - Step-by-step form creation
- `voting-form-integration-flow.zip` - Auto-save votes to SharePoint
- `order-form-integration-flow.zip` - Auto-save orders to SharePoint

### ✅ Email & Communication
- `email-templates.md` - All email templates included
- Automated voting notifications
- Winner announcements with order links  
- Order confirmations and summaries

### ✅ Documentation & Support  
- `QUICK-START.md` - 30-minute deployment guide
- `SETUP-GUIDE.md` - Detailed instructions
- `troubleshooting.md` - Fix common issues
- `COMPLETION-PLAN.md` - Implementation roadmap

## ✅ System Requirements

- SharePoint access (you already have this)
- Power Automate access (included with Office 365)
- Owner permissions on your North America SharePoint site

## 🔒 Privacy & Security

- Uses only Microsoft tools (IT approved)
- No third-party apps required
- Anonymous access for warehouse workers
- All data stays within your organization

---
**Location**: `C:\Users\travi\OneDrive\Desktop\Friday Lunch\`
**Completely separate from LISTO or any other projects**
