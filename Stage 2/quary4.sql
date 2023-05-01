SELECT DISTINCT p.proid, p.proname
FROM project p
INNER JOIN team t ON p.teid = t.teid
INNER JOIN employee e ON e.teid = t.teid
WHERE NOT EXISTS(
SELECT evid FROM evaluation WHERE emid = e.emid AND grade > 5
);