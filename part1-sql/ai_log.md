# AI-Assisted Prompt Log

## AI-assisted prompt #1 (RCTCF)

**Query being drafted:** Task 5(c) — the derived-fields variance / percentage_variance
query joining category-level revenue to `category_targets`.


**Prompt used (structured against RCTCF):**


- **Role:** "You are an expert SQLite data analyst who is very careful, patient tutorand has years of market experience."

- **Context:** "I have a SQLite table `category_targets and a derived per-category total_revenue
  , computed from SUM(amount_inr) over Delivered orders,
  joined from a subquery aliased `cr`)."

- **Task:** "Write a SQL query that computes `variance = target_revenue_inr -
  total_revenue` and `percentage_variance = (total_revenue - target_revenue_inr)
  as a percentage of target_revenue_inr`, then tags each row 'Above Target' if
  total_revenue >= target, 'Below Target - Watch' if the shortfall is within
  15%, else 'Below Target - Critical'."

- **Constraints:** "Both revenue columns are INTEGER in SQLite. Make sure the
  percentage calculation does NOT get truncated to an integer/0 by SQLite's
  integer division rules before the percentage is computed."

- **Format:** "Return only the final SQL query,along with sone breif explaintion as you proceed 1 step at a time, keep it short 
no long essay, also verify your codes though facts and logic behind 
the code , no guessing only facts based verification, using a CTE
  or subquery for the category revenue aggregation." 

**AI's suggested query (as returned):** used `CAST(total_revenue AS REAL)` on
the numerator of the percentage_variance expression, joined `cr` (a subquery
aggregating Delivered revenue by category) to `category_targets`.

**Verification step actually performed:
--Also i did four-step verification process for AI Outputs.
--Read the output carefully: I First tried to Understand every line and logic of the AI-generated code or response.
--Check names and references: Validate column names, data types, cell references, and other identifiers against actual data.
--Test on a small dataset: Run the AI-generated code or formula on a small, manageable subset of data before applying it broadly.
--Sanity check: Confirm the output values and results make logical and business sense with your knowledge and manual checks.