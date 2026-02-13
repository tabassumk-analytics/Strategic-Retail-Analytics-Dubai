/* Strategic Retail Pipeline Analysis
   Calculating Market Capture and Sales Success Rates
*/

WITH Daily_Performance AS (
    SELECT 
        date,
        mall_footfall,
        store_entries,
        transactions,
        revenue
    FROM retail_data
)
SELECT 
    date,
    -- Market Capture Rate (Premium/Luxury Target: 5%)
    (store_entries / NULLIF(mall_footfall, 0)) * 100 AS market_capture_pct,
    
    -- Sales Success Rate (Conversion)
    (transactions / NULLIF(store_entries, 0)) * 100 AS sales_success_pct,
    
    -- Visitor Yield (AED)
    revenue / NULLIF(store_entries, 0) AS visitor_yield_aed
FROM Daily_Performance;
