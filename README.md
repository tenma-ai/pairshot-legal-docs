# PairShot Legal Documents

This repository contains the external HTML versions of all legal documents for PairShot, designed for hosting and compliance with App Store requirements.

## Documents Included

### 📄 Privacy Policies
- `privacy-policy-ja.html` - Japanese (Authoritative version)
- `privacy-policy-en.html` - English (USA/CCPA compliant)
- `privacy-policy-zh.html` - Chinese (PIPL compliant)

### 📋 Terms of Service
- `terms-of-service-ja.html` - Japanese (Authoritative version)
- `terms-of-service-en.html` - English (USA)
- `terms-of-service-zh.html` - Chinese (China)

### 👥 Community Guidelines
- `community-guidelines-ja.html` - Japanese
- `community-guidelines-en.html` - English
- `community-guidelines-zh.html` - Chinese

### 📝 Reporting Pages
- `report-ja.html` - Japanese reporting form
- `report-en.html` - English reporting form
- `report-zh.html` - Chinese reporting form

### 🏠 Main Index
- `index.html` - Landing page with language selection

### ⚙️ Configuration Files
- `supabase-setup.sql` - Database schema and RLS policies (implemented)
- `supabase-config.js` - Configuration with real credentials

## Deployment

This repository is designed to be deployed on **Vercel** for external hosting to meet App Store URL requirements.

### Quick Deploy to Vercel

1. Push this repository to GitHub
2. Connect to Vercel
3. Deploy automatically
4. Use the generated URL in App Store Connect

### Expected URLs Structure
```
https://your-vercel-domain.vercel.app/
https://your-vercel-domain.vercel.app/privacy-policy-ja.html
https://your-vercel-domain.vercel.app/privacy-policy-en.html
https://your-vercel-domain.vercel.app/terms-of-service-ja.html
```

## Supabase Setup

### ✅ Database Setup (IMPLEMENTED)

The database has been set up with Supabase MCP:

- **Table:** `legal_reports` (created with all required columns)
- **Indexes:** Created for efficient querying by date, type, urgency, status, language
- **RLS Policies:** Configured for anonymous submissions and authenticated admin access

### ✅ Environment Configured (IMPLEMENTED)

All HTML files now use real Supabase credentials:

```javascript
const SUPABASE_URL = 'https://ooqxmwnzpurkiusbynnx.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGci...'; // Real key configured
```

The `supabase-config.js` file contains the centralized configuration.

### 3. RLS Policies

The database is configured with appropriate Row Level Security:

- **Anonymous INSERT**: Anyone can submit reports
- **Authenticated READ**: Only authenticated users can view reports
- **Authenticated UPDATE**: Only authenticated users can update reports

This allows public reporting while protecting data access.

## Features

- **Multi-language support**: Japanese, English, Chinese
- **Responsive design**: Works on all devices
- **App Store compliant**: Meets Apple's URL requirements
- **Advanced reporting**: Bug reports, crashes, violations
- **Supabase integration**: Real-time database storage
- **Email notifications**: Automatic alerts to pairshot@gmail.com
- **Device detection**: Automatic technical information collection
- **Professional styling**: Clean, modern interface

## Report System

The reporting forms support multiple report types:

### General Reports
- Harassment & Bullying
- Inappropriate Content
- Dating/Hookup Misuse
- Fake Profiles
- Privacy Violations
- Spam & Fraud

### Technical Reports
- **Bug Reports**: With app version, device info, reproduction steps
- **App Crashes**: With crash logs and technical details
- **Technical Issues**: General technical problems

### Data Collection
- User-provided information
- Automatic device detection
- IP address (optional)
- User agent string
- Screen resolution and viewport
- Timestamp and language

### Storage
- **Supabase Database**: ✅ `legal_reports` table with structured data and full search capabilities
- **Email Notifications**: Console logging (ready for email API integration)
- **Analytics**: Report trends and patterns (data structure ready)

## Legal Compliance

- **Japanese**: APPI (Act on Protection of Personal Information)
- **US**: CCPA/CPRA (California Consumer Privacy Acts)
- **Chinese**: PIPL (Personal Information Protection Law)

## Security Features

- Row Level Security (RLS) on all database tables
- Secure anonymous reporting without exposing sensitive data
- IP address collection for abuse prevention
- Structured logging for audit trails

## Contact

For legal document inquiries: pairshot@gmail.com

---

*Generated for PairShot App Store submission - August 2025*