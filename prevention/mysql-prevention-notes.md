# MySQL Prevention Notes

## Why Generated Columns
MySQL lacks partial indexes.
Generated columns allow conditional uniqueness
without procedural logic.

## Transaction Discipline
Because MySQL does not support DEFERRABLE constraints:
- Application commits approval + status change atomically
- Pre-deploy and scheduled checks enforce correctness

## Design Principle

> MySQL prevention favors explicit structure over hidden logic.

