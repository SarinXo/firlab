
SELECT kategor ���������, format(sum(`Cena`*`Kol_vo`),2) �����
from datatable1 where (year(date_p) = 2019 ) and
    (month(date_p) between 1 and 5)
group by `Kategor`
order by `Kategor`


SELECT kategor ���������, format(sum(`Cena`*`Kol_vo`),2) �����
from datatable1 where (year(date_p) = 2019 )
group by `Kategor`
having (sum(`Cena`*`Kol_vo`) between 20000 and 50000)
order by `Kategor`


SELECT min(date_p) �������, max(date_p) ��������,
       format(sum(`Cena`*`Kol_vo`),2) �����
from datatable1
where (month(date_p) between 1 and 2)
  and year(date_p)=2019


SELECT kategor ���������, format(min(`Cena`*`Kol_vo`),2) ��������,
       format(max(`Cena`*`Kol_vo`),2) ��������
from datatable1
where (year(date_p)=2019)
group by kategor
having min(cena * kol_vo) > 5000


SELECT month(date_p) �����, `Kategor` �������,
       format(sum(`Cena`*`Kol_vo`),2) �����
from datatable1
where (year(date_p) = 2019 ) and
    (month(date_p) between 3 and 5)
group by month(`Date_p`),`Kategor`
order by month(`Date_p`),`Kategor`