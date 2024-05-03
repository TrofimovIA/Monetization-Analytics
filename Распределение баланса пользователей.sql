with balance as 
-- находим баланс пользователей
	(
	select
        user_id,
        sum(case when type_id in (1, 23, 24, 25, 26, 27, 28) then -value else value end) balance
    from 
		-- объединяем и фильтруем таблицы с пользователями и трназакциями
    	(select t.value, t.type_id, t.user_id, u.company_id
		from "transaction" t 
		left join users u 
		on t.user_id = u.id 
		) t
		-- company_id=1 - это студенты крупного университета - они могут сбивать статистику.
   		where t.value < 500 and coalesce(t.company_id, 0) != 1 
   		group by user_id
		),
-- генерируем последовательность перцентилей
perc as (select generate_series(0.1, 1.0, 0.1) as perc)
-- формируем итоговую таблицу
select 
	perc, 
	percentile_disc(perc) within group (order by balance) as balance
from balance, perc
group by perc