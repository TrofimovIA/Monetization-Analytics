-- объединяем таблицы codesubmit и coderun
with run_submit_uniuon as
	(
	select user_id, problem_id
	from codesubmit 
	union all
	select user_id, problem_id 
	from coderun
	),
-- считаем количество уникальных задач, которые решил каждый пользователь
cnt_problems as 
	(
	select user_id, count(distinct problem_id) cnt_problems -- считаем количество задач 
	from run_submit_uniuon
	group by user_id
	),
-- считаем количество уникальных тесов, которые решил каждый пользователь
cnt_tests as 
	(
	select t.user_id, count(distinct t.test_id) cnt_tests
	from teststart t 
	group by t.user_id
	)
-- формируем итоговую таблицу со средними значениями
select
-- средние значения
	round(avg(cnt_problems), 2) problems_avg,
	round(avg(cnt_tests), 2) tests_avg,
-- медианные значения
	percentile_cont(0.5) within group(order by cnt_problems) problems_median,
	percentile_cont(0.5) within group(order by cnt_tests) tests_median
from cnt_problems, cnt_tests
