Задачи с сайта sql-ex

1) Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

SELECT model, speed, hd
FROM pc
WHERE price < 500;
=======================

2) Найдите производителей принтеров. Вывести: maker

SELECT DISTINCT maker 
FROM product
WHERE type = 'Printer'
=======================

3) Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

SELECT model, ram, screen
FROM laptop
WHERE price > 1000
=======================

4) Найдите все записи таблицы Printer для цветных принтеров.

SELECT * FROM printer
WHERE color = 'y'
=======================

5) Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

SELECT model, speed, hd
FROM pc
WHERE price < 600 AND (cd = '12x' OR cd = '24x')
=======================

6) Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

SELECT DISTINCT product.maker AS maker, laptop.speed AS speed
FROM laptop JOIN
product ON product.model = laptop.model
WHERE NOT (laptop.hd < 10)
ORDER BY maker
=======================

7) Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT laptop.model, laptop.price
FROM laptop JOIN
product ON laptop.model = product.model
WHERE maker = 'B'

UNION

SELECT printer.model, printer.price
FROM printer JOIN
product ON printer.model = product.model
WHERE maker = 'B'

UNION

SELECT pc.model, pc.price
FROM pc JOIN
product ON pc.model = product.model
WHERE maker = 'B'
=======================

8) Найдите производителя, выпускающего ПК, но не ПК-блокноты.

=======================

9) Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

=======================

10) Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

=======================