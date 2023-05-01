SELECT project.proname, project.duedate, team.tename, AVG(evaluation.grade) AS averageGrade
FROM project
INNER JOIN team ON project.teid = team.teid
INNER JOIN employee ON employee.teid = team.teid
INNER JOIN evaluation ON employee.emid = evaluation.emid
GROUP BY project.proname, project.duedate, team.tename
ORDER BY averageGrade DESC;