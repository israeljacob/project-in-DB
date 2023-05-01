WITH proj_profit AS (
  SELECT Project.ProID, Project.ProName, Project.Profit, Team.TeID, 
    ROW_NUMBER() OVER (PARTITION BY Team.TeID ORDER BY Project.Profit DESC) AS rn
  FROM Project
  JOIN Team ON Project.TeID = Team.TeID
)
SELECT TeID, ProID, ProName, Profit
FROM proj_profit
WHERE rn <= 10
ORDER BY TeID, Profit DESC;