SELECT suplier.suname, COUNT(connectedTo.priid) AS printerCount
FROM suplier
JOIN printer ON suplier.suid = printer.suid
JOIN connectedTo ON printer.priid = connectedTo.priid
JOIN computer ON connectedTo.cid = computer.cid
JOIN employee ON computer.cid = employee.cid
JOIN team ON employee.teid = team.teid
JOIN room ON team.roomNumber = room.roomNumber
WHERE room.floor = 3
GROUP BY suplier.suname;