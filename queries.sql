SELECT S.sname, COUNT(*) as TotalParts
FROM suppliers S, catalog C, parts P
WHERE C.sid = S.sid AND P.pid = C.pid
GROUP BY S.sname, S.sid;

SELECT S.sname, COUNT(*) as TotalParts
FROM suppliers S, catalog C, parts P
WHERE C.sid = S.sid AND P.pid = C.pid
GROUP BY S.sname, S.sid
HAVING COUNT(*) >= 3;

SELECT S.sname, COUNT(*) as TotalParts
FROM Suppliers S, Parts P, Catalog C
WHERE P.pid = C.pid AND C.sid = S.sid
GROUP BY S.sname, S.sid
HAVING EVERY (P.color = 'Green');

CREATE VIEW TEMP as
SELECT DISTINCT C.sid
FROM catalog C, parts P
WHERE C.pid = P.pid AND P.color = 'Red'
INTERSECT
SELECT DISTINCT C1.sid
FROM catalog C1, parts P1
WHERE C1.pid = P1.pid AND P1.color = 'Green';

SELECT S.sname, Max(C.cost) as MostExpensive
FROM TEMP, catalog C, suppliers S
WHERE TEMP.sid = c.sid AND C.sid = S.sid
GROUP BY S.sname, S.sid;
