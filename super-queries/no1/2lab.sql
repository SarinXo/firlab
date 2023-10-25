--1
SELECT DISTINCT snum
FROM `serviceorders`
order by `snum`;

   -- 2
SELECT `sname` , `address`
FROM `servicecenters`
WHERE `city`= ''
order by `sname`;

  --  3
SELECT `cnum` , `cname` ,
       `rating` , `snum`
FROM `customers`
WHERE `city`= '' and `rating`>130
order by `cname`;

  --  4
SELECT `sname` , `city` , `address`
FROM `servicecenters`
WHERE not (`city`='')
order by `sname`;

  --  5
SELECT `odate` , `onum` ,
       `snum` , format(`osum`,2)
FROM `serviceorders`
WHERE (year(`odate`)>=2017 and month(`odate`)>=8)
order by `odate`;

 --   6
SELECT `sname` , `city`
FROM `servicecenters`
WHERE `city` in('', '', '')
order by  `city`;

 --   7
SELECT `snum` , format(min(`osum`),2) ,
       format(max(`osum`),2)
FROM `serviceorders`
WHERE (year(`odate`)=2017 and
    month(`odate`) between 3 and 5)
group by `snum`
order by `snum`;

   -- 8
SELECT `snum` ��, month(`odate`) ,
       format(min(`osum`),2) ,
       format(max(`osum`),2)
FROM `serviceorders`
WHERE (year(`odate`)=2017 and
    month(`odate`) between 9 and 12)
group by `snum`, month(`odate`)
order by `snum`, month(`odate`);

--1

SELECT odate ДатаОбслуживания ,
       onum КодОбслуживания ,
       snum КодСЦ,
       format(osum,2) Стоимость
FROM serviceorders
WHERE (year(odate)=2017 and month(odate)>=9)
order by odate;

-- 2
SELECT city Город , sname СЦ
FROM servicecenters
WHERE city IN('НИЖНИЙ НОВГОРОД', 'ПЕНЗА', 'САРАНСК') ORDER BY city;

-- 3
SELECT snum СЦ,
       format(min(osum),2) МинимальнаяОплата,
       format(max(osum),2) МаксимальнаяОплата
FROM serviceorders
WHERE (year(odate)=2017 AND month(odate) BETWEEN 5 AND 9)
GROUP BY snum
ORDER BY snum;

--4
SELECT snum СЦ,
       month(odate) Месяц,
       format(min(osum),2) МинимальнаяОплата,
       format(max(osum),2) МаксимальнаяОплата
FROM serviceorders
WHERE (year(odate)=2017 AND month(odate) BETWEEN 5 AND 8)
GROUP BY snum , month(odate)
ORDER BY snum, month(odate);


