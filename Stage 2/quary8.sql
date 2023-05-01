SELECT Employee.EmID, Employee.EmName, COUNT(InstalledOn.SoId) AS NumOfSoftware
FROM Employee
LEFT JOIN Computer ON Employee.CID = Computer.CID
LEFT JOIN InstalledOn ON Computer.CID = InstalledOn.CID
GROUP BY Employee.EmID, Employee.EmName
ORDER BY NumOfSoftware DESC;