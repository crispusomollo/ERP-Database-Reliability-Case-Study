BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => 'ERP_INTEGRITY_CHECK',
    job_type        => 'EXECUTABLE',
    job_action      => '/opt/oracle/scripts/integrity_check.sh',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=DAILY;BYHOUR=2',
    enabled         => TRUE
  );
END;
/

