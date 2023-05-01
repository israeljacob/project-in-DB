SELECT c.cid
FROM computer c
JOIN employee e ON e.cid = c.cid
JOIN team t ON e.teid = t.teid
JOIN project p ON p.teid = t.teid
JOIN connectedTo con ON c.cid = con.cid
WHERE c.ram = 4
GROUP BY c.cid, e.emid, e.emname
HAVING SUM(p.profit) > 10000;