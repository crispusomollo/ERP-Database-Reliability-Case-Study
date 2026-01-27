# MySQL Cron Example

Run nightly integrity checks at 02:00 AM.

```bash
0 2 * * * mysql \
  --defaults-extra-file=/secure/db.cnf \
  erp_db < mysql-nightly-integrity-check.sql \
  | grep -q . && exit 1 || exit 0

