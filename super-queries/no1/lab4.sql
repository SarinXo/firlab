--
SELECT otdel Отдел,fio ФИО,oklad Оклад
FROM table4 t1
WHERE oklad =
      (SELECT MAX(oklad) FROM table4 t2
       WHERE t1.otdel=t2.otdel )
ORDER BY otdel,fio;

SELECT maxresult
FROM(SELECT max(result.summa) maxresult
     FROM (SELECT otdel, sum(oklad) summa
           FROM table4
           GROUP BY otdel)
         result) res;

SELECT t1.otdel Отдел,
    format( sum(t1.oklad), 2)  СуммОклад,
    format( (SELECT maxresult
             FROM(SELECT max(result.summa) maxresult
                  FROM (SELECT otdel, sum(oklad) summa
                        FROM table4
                        GROUP BY otdel)
                           result)
                     tt), 2)  МаксОклад
    FROM table4 t1
GROUP BY t1.otdel
HAVING sum(t1.oklad) < (SELECT maxresult
                        FROM(SELECT max(result.summa) maxresult
                             FROM (SELECT otdel, sum(oklad) summa
                                   FROM table4
                                   GROUP BY otdel)
                                      result)
                                tt)
ORDER BY t1.otdel;
