SELECT Kategor Категория, FORMAT(SUM(Cena*Kol_vo), 2) Сумма
    FROM datatable1
        WHERE year(Date_p)=2019
            AND month(Date_p) BETWEEN 2 AND 4
        GROUP BY Kategor
        ORDER BY Kategor, Tovar;

SELECT Kategor Категория, FORMAT(SUM(Cena*Kol_vo), 2) Сумма
    FROM datatable1
        WHERE year(Date_p)=2019
        GROUP BY Kategor
        HAVING (sum(Cena*Kol_vo) between 40000 and 50000)
        ORDER BY Kategor;

SELECT min(date_p) МинДата, max(date_p) МаксДата, format(sum(Cena*Kol_vo), 2) Сумма
    FROM datatable1
    WHERE (month(date_p) IN (2, 3))
        AND year(date_p)=2019;

SELECT Kategor Категория, format(min(Cena*Kol_vo),2) МинСумма, format(max(Cena*Kol_vo),2) МаксСумма
    FROM datatable1
        WHERE (year(date_p)=2019)
        GROUP BY Kategor
        HAVING min(Cena * Kol_vo) > 5000 AND max(Cena*Kol_vo) < 40000;

SELECT month(date_p) Месяц, Kategor Категория, format(sum(Cena*Kol_vo),2) Сумма
    FROM datatable1
    WHERE (year(date_p) = 2019 ) AND
        (month(date_p) BETWEEN 1 AND 3)
    GROUP BY month(Date_p), Kategor
    ORDER BY month(Date_p), Kategor;