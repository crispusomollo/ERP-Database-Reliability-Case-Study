-- One active assignment per asset
CREATE UNIQUE INDEX ux_asset_active_assignment
ON asset_assignments(asset_id)
WHERE return_date IS NULL;

-- Performance index
CREATE INDEX idx_timesheet_status
ON timesheets(status);

-- Hour validation
ALTER TABLE timesheets
ADD CONSTRAINT chk_timesheet_hours
CHECK (hours >= 0 AND hours <= 24);

