SELECT project.proid, project.proname
FROM project
INNER JOIN team ON project.teid = team.teid
INNER JOIN employee ON employee.teid = team.teid
INNER JOIN evaluation ON employee.emid = evaluation.emid
WHERE evaluation.grade > 6
AND project.teid IN (
SELECT teid
FROM employee
INNER JOIN evaluation ON employee.emid = evaluation.emid
WHERE evaluation.grade > 6
GROUP BY teid
HAVING COUNT(DISTINCT evaluation.emid) >= 2
)
GROUP BY project.proid, project.proname
HAVING COUNT(DISTINCT evaluation.emid) >= 2;