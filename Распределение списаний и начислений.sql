-- Считаем списания, начисления и баланс пользователей
with agg as (
    select
        user_id,
        -- Тип «списание» имеют записи с id: 1, 23-28.
        sum(case when type_id in (1, 23, 24, 25, 26, 27, 28) then -value end) write_off,
        -- Тип «начисление» имеют записи с id: 2-22, 29.
        sum(case when type_id not in (1, 23, 24, 25, 26, 27, 28) then value end) accruals,
        sum(case when type_id in (1, 23, 24, 25, 26, 27, 28) then -value else value end) balance
    from "transaction" t
    -- Транзакции больше или равные 500 монет не идут в рачсчет - это начисления бета-тестерам.
    where value < 500
    group by user_id
)
-- Получаем средние значения
select
    round(avg(write_off), 2) as write_off,
    round(avg(accruals), 2) as accruals,
    round(avg(balance), 2) as balance
from agg
