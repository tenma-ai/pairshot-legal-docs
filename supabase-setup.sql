-- Create reports table for PairShot legal document reporting system
CREATE TABLE IF NOT EXISTS reports (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Report classification
    report_type TEXT NOT NULL CHECK (report_type IN (
        'harassment', 
        'inappropriate_content', 
        'dating_misuse', 
        'fake_profile', 
        'privacy_violation', 
        'spam', 
        'technical_issue',
        'bug_report',
        'app_crash',
        'other'
    )),
    
    urgency TEXT NOT NULL CHECK (urgency IN ('low', 'medium', 'high', 'critical')),
    
    -- Reporter information
    user_email TEXT,
    reporter_ip TEXT,
    user_agent TEXT,
    
    -- Target information
    target_user TEXT,
    
    -- Report content
    description TEXT NOT NULL,
    evidence TEXT,
    
    -- Technical details for bug/crash reports
    device_info JSONB,
    app_version TEXT,
    os_version TEXT,
    crash_logs TEXT,
    steps_to_reproduce TEXT,
    
    -- Metadata
    language TEXT DEFAULT 'ja' CHECK (language IN ('ja', 'en', 'zh')),
    status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'reviewing', 'resolved', 'dismissed')),
    
    -- Admin fields
    admin_notes TEXT,
    resolved_at TIMESTAMP WITH TIME ZONE,
    resolved_by TEXT
);

-- Create index for efficient querying
CREATE INDEX IF NOT EXISTS idx_reports_created_at ON reports(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_reports_type ON reports(report_type);
CREATE INDEX IF NOT EXISTS idx_reports_urgency ON reports(urgency);
CREATE INDEX IF NOT EXISTS idx_reports_status ON reports(status);
CREATE INDEX IF NOT EXISTS idx_reports_language ON reports(language);

-- Enable Row Level Security
ALTER TABLE reports ENABLE ROW LEVEL SECURITY;

-- RLS Policy: Allow anonymous inserts (for public reporting)
-- This is intentionally permissive to allow anyone to submit reports
CREATE POLICY "Allow anonymous report submission" ON reports
    FOR INSERT 
    WITH CHECK (true);

-- RLS Policy: Only authenticated users can read reports
-- In a real app, this would be restricted to admin users
CREATE POLICY "Allow authenticated users to read reports" ON reports
    FOR SELECT 
    USING (auth.role() = 'authenticated');

-- RLS Policy: Only authenticated users can update reports (admin function)
CREATE POLICY "Allow authenticated users to update reports" ON reports
    FOR UPDATE 
    USING (auth.role() = 'authenticated');

-- Create a view for admin dashboard (optional)
CREATE OR REPLACE VIEW reports_summary AS
SELECT 
    report_type,
    urgency,
    language,
    status,
    COUNT(*) as count,
    MIN(created_at) as oldest_report,
    MAX(created_at) as newest_report
FROM reports
GROUP BY report_type, urgency, language, status
ORDER BY urgency DESC, count DESC;

-- Grant permissions
GRANT SELECT, INSERT ON reports TO anon;
GRANT ALL ON reports TO authenticated;
GRANT SELECT ON reports_summary TO authenticated;