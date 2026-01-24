erDiagram
    ASSETS {
        bigint id PK
        string asset_tag
        string asset_name
        string category
        date acquisition_date
        decimal acquisition_cost
        string status
    }

    ASSET_ASSIGNMENTS {
        bigint id PK
        bigint asset_id FK
        bigint assigned_to FK
        timestamp assigned_at
        timestamp return_date
    }

    EMPLOYEES {
        bigint id PK
        string employee_number
        string full_name
        string department
        string status
    }

    PROJECTS {
        bigint id PK
        string project_code
        string project_name
        string status
    }

    TIMESHEETS {
        bigint id PK
        bigint employee_id FK
        bigint project_id FK
        date work_date
        decimal hours
        string status
    }

    APPROVALS {
        bigint id PK
        string reference_type
        bigint reference_id FK
        bigint approved_by
        string approval_status
        timestamp approved_at
    }

    ASSETS ||--o{ ASSET_ASSIGNMENTS : "has history"
    EMPLOYEES ||--o{ ASSET_ASSIGNMENTS : "assigned to"
    EMPLOYEES ||--o{ TIMESHEETS : "logs"
    PROJECTS ||--o{ TIMESHEETS : "tracked in"
    TIMESHEETS ||--o{ APPROVALS : "requires"

