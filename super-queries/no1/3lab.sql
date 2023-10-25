--1
SELECT (SELECT markets.name) Магазин,
       (SELECT tovary.name) Наименование,
       (SELECT tovary.marka) Марка,
       (SELECT format(sum(prihod.cena * prihod.kol_vo), 2)) Сумма
FROM markets, tovary, prihod
WHERE markets.id=prihod.id_m
  AND prihod.id_t=tovary.id
  AND YEAR(prihod.date_prih) = '2017'
  AND MONTH(prihod.date_prih)>=10
GROUP BY prihod.id_m, prihod.id_t
ORDER BY prihod.id_m, prihod.id_t;

-- 2
SELECT (SELECT markets.name) Магазин,
       (SELECT tovary.name) Наименование,
       (SELECT tovary.marka) Марка,
       (SELECT format(sum(prihod.cena*prihod.kol_vo),2)) Сумма
FROM markets, tovary, prihod
WHERE markets.id=prihod.id_m
  AND prihod.id_t=tovary.id
  AND YEAR(prihod.date_prih) = '2017'
  AND MONTH(prihod.date_prih)>=10
GROUP BY prihod.id_m, prihod.id_t
ORDER BY markets.name, tovary.name;

-- 3
SELECT odate ДатаОбсл, onum КодОбсл,
       (SELECT servicecenters.snum) КодСЦ,
       (SELECT servicecenters.sname) НаименованиеСЦ,
       format(serviceorders.osum,2) Стоимость
FROM serviceorders, servicecenters
WHERE YEAR(serviceorders.odate)>=2017 AND MONTH(serviceorders.odate)>8
  AND serviceorders.snum=servicecenters.snum
ORDER BY serviceorders.odate;

-- 4
SELECT (SELECT servicecenters.snum) КодСЦ,
       (SELECT servicecenters.sname) НаименованиеСЦ,
       MONTH(odate) Месяц,
       format(min(osum),2) МинОплата,
       format(max(osum),2) МаксОплата
FROM serviceorders, servicecenters
WHERE YEAR(odate)=2017
  AND MONTH(odate) BETWEEN 5 AND 8
  AND serviceorders.snum=servicecenters.snum
GROUP BY servicecenters.snum, month(odate)
ORDER BY servicecenters.snum, month(odate);








--2
Select (select markets.name) Магазин,
       (select tovary.name) Наименование,
       (select tovary.marka) Марка,
       (select format(sum(prihod.cena*prihod.kol_vo),2)) Сумма
from markets, tovary, prihod
where markets.id=prihod.id_m and prihod.id_t=tovary.id
group by prihod.id_m, prihod.id_t
order by prihod.id_m, prihod.id_t


    доп задание
Select (select markets.name) Магазин,
       (select tovary.name) Наименование,
       (select tovary.marka) Марка,
       (select format(sum(prihod.cena*prihod.kol_vo),2)) Сумма
from markets, tovary, prihod
where markets.id=prihod.id_m and prihod.id_t=tovary.id
group by markets.name, tovary.name
order by markets.name, tovary.name

    2
Select odate ДатаОбсл, onum КодОбсл,
       (select servicecenters.snum) КодСЦ,
       (select servicecenters.sname) СЦ,
       format(serviceorders.osum,2) Стоимость
from serviceorders,servicecenters
where year(serviceorders.odate)>=2017 and month(serviceorders.odate)>8
  and serviceorders.snum=servicecenters.snum
order by serviceorders.odate

    3
Select (select servicecenters.snum) КодСЦ,
       (select servicecenters.sname) СЦ,
       month(odate) Месяц,
       format(min(osum),2) МинОплата,
       format(max(osum),2) МаксОплата
from serviceorders, servicecenters
where year(odate)=2017 and month(`odate`) between 9 and 12
  and serviceorders.snum=servicecenters.snum
group by servicecenters.snum, month(odate)
order by servicecenters.snum, month(odate)