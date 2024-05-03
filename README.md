# Аналитика монетизации плитформы для решения задач
## Описание задачи
Сейчас, по сути, платформа бесплатная. В ней есть внутренняя валюта, но мало кто ее покупает. Смысл такой - за активность на платформе пользователи получают монеты, также они могут их купить за деньги. А потратить они их могут, чтобы открыть премиальные задачи, тесты, подсказки и решения.
У внутренней валюты есть несколько существенных недостатков:
- Ее сложно продавать - практически никакой рекламной стимуляции валюта не подвергается
- На нее сложно делать акции
- Большинство людей покупает маленькие пакеты монет (да и сами пакеты недорогие)
- Человек может единоразово купить монет и ему хватит надолго
  
Пока платформа молодая и находится на стадии роста, компания планирует внедрить стандартную подписочную модель.

Для определеня, что будет входить в подписку, мне поручено посчитать следующие основные метрики, которые помогут принять решение:
- Метрика n-day retention.
- Метрика rolling retention.
- Среднее и медианное число решаемых задач и тестов.
- Сколько монет в среднем списывает пользователь за весь срок жизни? Сколько монет ему начисляется? Какая дельта между этими двумя метриками?
- Распределение итогового баланса пользователей по перцентилям.
- % сессий, не сопровождающихся активностью.
- Метрика MAU.

## Исходные дынные
Данные для подключения к базе данных:
```
Хост: 95.163.241.236
Порт: 5432
База данных: simulative
Юзер: student
Пароль: qweasd963
```
[Структура таблиц](https://docs.google.com/document/d/1TwZXkZZVGD7fk-6wTeVoZykTGw7ovObWnEEvH2kLfxM/edit)

## Распределение числа решенных задач и тестов

Задача посчитать:

- сколько в среднем задач решает один пользователь (пусть даже неправильно, но хотя бы делает попытку)
- сколько в среднем тестов начинает проходить один пользователь (пусть даже не заканчивает)

### Код

Код для решения задачи его описание можно посмотреть [здесь](https://github.com/TrofimovIA/Monetization-Analytics/blob/main/Распределение%20числа%20решенных%20задач%20и%20тестов.sql)

### Результат выполнения запроса

![Результат выполнения запроса](https://github.com/TrofimovIA/Monetization-Analytics/blob/main/tests%20and%20problems%20result.JPG)

## Распределение списаний и начислений

Задача посчитать:

- Сколько монет в среднем пользователь списывает за весь срок жизни?
- Сколько монет в среднем пользователю начисляется за весь срок жизни?
- Какая в среднем разница между этими двумя числами?

### Код

Код для решения задачи его описание можно посмотреть [здесь](https://github.com/TrofimovIA/Monetization-Analytics/blob/main/Распределение%20списаний%20и%20начислений.sql)

### Результат выполнения запроса

![Результат выполнения запроса](https://github.com/TrofimovIA/Monetization-Analytics/blob/main/write_off%2C%20accurals%2C%20balance%20result.JPG)
  




