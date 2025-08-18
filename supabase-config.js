// Supabase Configuration for PairShot Legal Documents
// This file should be customized for your deployment

const SUPABASE_CONFIG = {
    // PairShot project URL
    url: 'https://ooqxmwnzpurkiusbynnx.supabase.co',
    
    // PairShot anon key
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9vcXhtd256cHVya2l1c2J5bm54Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM3OTYwNzcsImV4cCI6MjA2OTM3MjA3N30.ErMWn81ErlFPaYC0JoPq5wDInIWv8AO2P077H9Ra_Y4',
    
    // Table name for legal document reports
    reportsTable: 'legal_reports',
    
    // Enable/disable features
    features: {
        saveToDatabase: true,
        sendEmail: true,
        collectDeviceInfo: true,
        getClientIP: true
    }
};

// Export for use in HTML files
if (typeof window !== 'undefined') {
    window.SUPABASE_CONFIG = SUPABASE_CONFIG;
}

// Export for Node.js environments
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SUPABASE_CONFIG;
}