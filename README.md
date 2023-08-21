Запуск Greenplum: https://vldbsolutions.com/greenplum-docker-demo

Данные для ввода в DBeader, чтобы установить соединение:

БД: demo
User: gpadmin
Password: postgres

Создайте таблицу-фактов о продажах произвольных товаров. При создании таблицы укажите поле для разделения таблицы по сегментам. Учитывайте, что правильные сегменты должны быть одинакового размера и не иметь пустых записей. Также при создании таблицы выберите поле для партиционирования. Лучшее поле для создания партиции — поле с единицей времени (год, месяц, день и т.д.).

Создайте таблицу-измерение, в которой отражены стоимость и название товара, а также связь с таблицей-фактов из предыдущего шага.

Заполните таблицы минимальными данными. Включите оптимизатор GP. 

Напишите запрос, который рассчитывает сумму продаж определенного товара за определенную единицу времени. 

Результат:
![$screenshot](https://github.com/javascriptrocker2104/work_with_greenplum/blob/main/greenplum/result.png)

План предыдущего запроса: 
![$screenshot]([https://github.com/javascriptrocker2104/work_with_hadoop/blob/main/hadoop.png](https://github.com/javascriptrocker2104/work_with_greenplum/blob/main/greenplum/query%20plan.png)https://github.com/javascriptrocker2104/work_with_greenplum/blob/main/greenplum/query%20plan.png)

