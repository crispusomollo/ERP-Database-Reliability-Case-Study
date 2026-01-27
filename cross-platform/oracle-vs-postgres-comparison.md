# Oracle vs PostgreSQL — Integrity Enforcement Comparison

| Capability | PostgreSQL | Oracle |
|-----------|-----------|--------|
| Conditional uniqueness | Partial unique index | Function-based index |
| Deferred constraints | Native | Native |
| Detection queries | Identical | Identical |
| Recovery approach | CTE + UPDATE | MERGE |
| Audit acceptance | High | Very High |

---

## Key Insight

> Enforcement semantics differ.
> Business correctness does not.

