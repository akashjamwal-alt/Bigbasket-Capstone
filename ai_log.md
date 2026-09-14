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


## AI-assisted prompt #2 (RCTCF)

**Code being drafted:** Task 5 — IQR outlier detection and capping
logic for amount_inr on Delivered orders.

**Prompt I used (structured against RCTCF):**

- **Role:** You are an expert data analyst who knows Pandas well,
  especially outlier detection.
- **Context:** I have a Pandas DataFrame called delivered_valid with
  Delivered orders and a column amount_inr. I need to find outliers
  using the IQR method.
- **Task:** Write Pandas code to calculate Q1, Q3, and IQR on
  amount_inr, find the upper fence (Q3 + 1.5*IQR), count how many
  rows go above it, and then cap those values at the upper fence
  instead of removing them.
- **Constraints:** Use .quantile() for Q1 and Q3, and .clip() for
  capping — don't drop or filter out the outlier rows since they
  need to stay in the data, just capped. Also make sure it doesn't
  throw a SettingWithCopyWarning, so use .copy() on the DataFrame
  first.
- **Format:** Just give me the Pandas code with print statements so
  I can see Q1, Q3, IQR, the upper fence, and how many rows are
  above it.

**What the AI gave me:** it used .quantile(0.25) and .quantile(0.75)
for Q1 and Q3, calculated the upper fence, used a boolean condition
with .sum() to count how many rows were above the fence, and used
.clip(upper=upper_fence) to cap the values. This matched what I
needed, so I used it.

**How I actually verified it:** I ran this code on my delivered_valid
data (425 Delivered orders with a valid amount) and got Q1 = 90.0,
Q3 = 275.0, IQR = 185.0, and an upper fence of 552.5, with 16 rows
above that fence. After capping, I printed
delivered_valid['amount_inr'].max() again and got exactly 552.5 as
the new maximum — which proved to me that the capping worked
correctly, since nothing could be higher than the fence anymore
after running .clip().
