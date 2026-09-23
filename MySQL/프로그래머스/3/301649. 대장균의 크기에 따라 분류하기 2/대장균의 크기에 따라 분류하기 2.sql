SELECT A.ID,
       CASE
           WHEN A.RANKING <= A.TOTAL_COUNT / 4 THEN 'CRITICAL'
           WHEN A.RANKING <= A.TOTAL_COUNT / 2 THEN 'HIGH'
           WHEN A.RANKING <= A.TOTAL_COUNT * 3 / 4 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS COLONY_NAME
FROM (
    SELECT E1.ID,
           (
               SELECT COUNT(*)
               FROM ECOLI_DATA E2
               WHERE E2.SIZE_OF_COLONY >= E1.SIZE_OF_COLONY
           ) AS RANKING,
           (
               SELECT COUNT(*)
               FROM ECOLI_DATA
           ) AS TOTAL_COUNT
    FROM ECOLI_DATA E1
) A
ORDER BY A.ID;