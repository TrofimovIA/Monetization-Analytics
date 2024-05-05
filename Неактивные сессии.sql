-- собираем информацию об активности пользователей
with activities as (
    select
        user_id,
        to_char(created_at, 'YYYY-MM-DD') as dt
    from
        coderun c
    union
    select
        user_id,
        to_char(created_at, 'YYYY-MM-DD') as dt
    from
        codesubmit c2
    union
    select
        user_id,
        to_char(created_at, 'YYYY-MM-DD') as dt
    from
        teststart
)
select
	-- вычисляем неактивные сессии
    round(sum(case when a.user_id is null then 1 else 0 end)* 100.0 / count(*), 2) as entries_without_activities
from
    userentry u
left join activities a
on
    to_char(u.entry_at, 'YYYY-MM-DD') = a.dt
    and u.user_id = a.user_id
