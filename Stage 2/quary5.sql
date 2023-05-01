SELECT DISTINCT s.suid, s.suname
FROM suplier s
JOIN printer p ON s.suid = p.suid
JOIN connectedTo c ON c.priid = p.priid
JOIN computer m ON c.cid = m.cid
JOIN installedON i ON m.cid = i.cid
JOIN software o ON i.soid = o.soid
JOIN employee e ON e.cid = m.cid
JOIN evaluation v ON e.emid = v.emid
WHERE (p.priid IN (
SELECT priid
FROM connectedTo
GROUP BY priid
HAVING COUNT(DISTINCT cid) > 10
) OR o.soid IN (
SELECT soid
FROM installedON
GROUP BY soid
HAVING COUNT(DISTINCT cid) > 10
)) AND e.emid IN (
SELECT emid
FROM employee
WHERE cid = m.cid
) AND v.grade > 7;