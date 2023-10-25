-- 1
SELECT Kategor Категория,
        Tovar Товар,
        MONTH(Date_p) Месяц,
       Sum(Cena * Kol_vo) Макссумма
    FROM datatable5
WHERE Date_p BETWEEN '2019-02-01' AND '2019-06-30'
GROUP BY Tovar, Kategor
HAVING Sum(Cena * Kol_vo) = (
    SELECT MAX(total_sum)
    FROM (
             SELECT Kategor, Tovar, Sum(Cena*Kol_vo) total_sum
             FROM datatable5
             WHERE Date_p BETWEEN '2019-02-01' AND '2019-06-30'
             GROUP BY Kategor, Tovar
         ) subquery
)
ORDER BY Kategor, Tovar;

SELECT Kategor Категория, Tovar Товар, MONTH(Date_p) Месяц, Sum(Cena * Kol_vo) Макссумма
FROM datatable5 WHERE Date_p BETWEEN '2019-02-01' AND '2019-06-30'
GROUP BY Tovar, Kategor HAVING Sum(Cena * Kol_vo) =
                               (SELECT MAX(total_sum) FROM (SELECT Kategor, Tovar, Sum(Cena*Kol_vo) total_sum
                                                            FROM datatable5 WHERE Date_p BETWEEN '2019-02-01' AND '2019-06-30' GROUP BY Kategor, Tovar) subquery) ORDER BY Kategor, Tovar;

--2
SELECT departments.Dept_no Отдел, FORMAT(MIN(Emp_salary), 2) Min, FORMAT(MAX(Emp_salary), 2) Max, FORMAT(AVG(Emp_salary), 2) Отдел_Средняя, FORMAT((SELECT Sum(Emp_salary) / (SELECT COUNT(*) FROM employs) FROM employs ), 2) Общая_Средняя
FROM employs JOIN departments ON employs.Dept_no = departments.Dept_no GROUP BY departments.Dept_no
HAVING ABS(AVG(Emp_salary)-(SELECT AVG(Emp_salary) FROM employs))/(SELECT AVG(Emp_salary) FROM employs)<=0.05
ORDER BY departments.Dept_no;