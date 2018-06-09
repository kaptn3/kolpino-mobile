-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июн 07 2018 г., 21:42
-- Версия сервера: 5.7.22-0ubuntu0.16.04.1
-- Версия PHP: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mobile_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Адрес`
--
-- Создание: Май 31 2018 г., 16:46
--

DROP TABLE IF EXISTS `Адрес`;
CREATE TABLE `Адрес` (
  `id` int(11) NOT NULL,
  `Улица` varchar(255) NOT NULL,
  `Дом` varchar(255) NOT NULL,
  `ТК` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Адрес`:
--

--
-- Очистить таблицу перед добавлением данных `Адрес`
--

TRUNCATE TABLE `Адрес`;
-- --------------------------------------------------------

--
-- Структура таблицы `Возрат`
--
-- Создание: Июн 06 2018 г., 11:59
--

DROP TABLE IF EXISTS `Возрат`;
CREATE TABLE `Возрат` (
  `id` int(11) NOT NULL,
  `Товар` int(11) DEFAULT NULL,
  `Номер клиента` varchar(20) NOT NULL,
  `Имя клиента` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Возрат`:
--   `Товар`
--       `Товар` -> `id`
--

--
-- Очистить таблицу перед добавлением данных `Возрат`
--

TRUNCATE TABLE `Возрат`;
-- --------------------------------------------------------

--
-- Структура таблицы `Выручка точки`
--
-- Создание: Июн 05 2018 г., 19:29
--

DROP TABLE IF EXISTS `Выручка точки`;
CREATE TABLE `Выручка точки` (
  `id` int(11) NOT NULL,
  `Точка` int(11) NOT NULL,
  `Выручка` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Выручка точки`:
--   `Точка`
--       `Точки` -> `id`
--

--
-- Очистить таблицу перед добавлением данных `Выручка точки`
--

TRUNCATE TABLE `Выручка точки`;
-- --------------------------------------------------------

--
-- Структура таблицы `Должности`
--
-- Создание: Май 31 2018 г., 16:34
--

DROP TABLE IF EXISTS `Должности`;
CREATE TABLE `Должности` (
  `id` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Должности`:
--

--
-- Очистить таблицу перед добавлением данных `Должности`
--

TRUNCATE TABLE `Должности`;
-- --------------------------------------------------------

--
-- Структура таблицы `Логистика`
--
-- Создание: Июн 05 2018 г., 13:40
--

DROP TABLE IF EXISTS `Логистика`;
CREATE TABLE `Логистика` (
  `Дата` date NOT NULL,
  `Товар` int(11) NOT NULL,
  `Точка` int(11) NOT NULL,
  `Работник` int(11) DEFAULT NULL,
  `Количество` int(11) NOT NULL,
  `Статус перевозки` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Логистика`:
--   `Работник`
--       `Офис` -> `id`
--   `Статус перевозки`
--       `Статус перевозки` -> `id`
--   `Товар`
--       `Товар` -> `id`
--   `Точка`
--       `Точки` -> `id`
--

--
-- Очистить таблицу перед добавлением данных `Логистика`
--

TRUNCATE TABLE `Логистика`;
-- --------------------------------------------------------

--
-- Структура таблицы `Офис`
--
-- Создание: Май 31 2018 г., 16:34
--

DROP TABLE IF EXISTS `Офис`;
CREATE TABLE `Офис` (
  `id` int(11) NOT NULL,
  `Имя` varchar(255) NOT NULL,
  `Фамилия` varchar(255) NOT NULL,
  `Должность` varchar(255) NOT NULL,
  `e-mail` varchar(255) NOT NULL,
  `Телефон` varchar(255) NOT NULL,
  `Тип` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Офис`:
--   `Тип`
--       `Тип пользователя` -> `id`
--   `Должность`
--       `Должности` -> `id`
--

--
-- Очистить таблицу перед добавлением данных `Офис`
--

TRUNCATE TABLE `Офис`;
-- --------------------------------------------------------

--
-- Структура таблицы `Поставки`
--
-- Создание: Июн 06 2018 г., 12:26
--

DROP TABLE IF EXISTS `Поставки`;
CREATE TABLE `Поставки` (
  `id` int(11) NOT NULL,
  `Дата` date NOT NULL,
  `Поставщик` int(11) NOT NULL,
  `Товар` int(11) NOT NULL,
  `Количество` int(11) NOT NULL,
  `Стоимость` int(11) NOT NULL,
  `Статус поставки` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Поставки`:
--   `Статус поставки`
--       `Статус поставки` -> `id`
--   `Товар`
--       `Товар` -> `id`
--   `Поставщик`
--       `Поставщики` -> `id`
--

--
-- Очистить таблицу перед добавлением данных `Поставки`
--

TRUNCATE TABLE `Поставки`;
-- --------------------------------------------------------

--
-- Структура таблицы `Поставщики`
--
-- Создание: Май 31 2018 г., 20:48
--

DROP TABLE IF EXISTS `Поставщики`;
CREATE TABLE `Поставщики` (
  `id` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL,
  `Адрес` int(11) NOT NULL,
  `Телефон` varchar(255) NOT NULL,
  `ИНН` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Поставщики`:
--   `Адрес`
--       `Адрес` -> `id`
--

--
-- Очистить таблицу перед добавлением данных `Поставщики`
--

TRUNCATE TABLE `Поставщики`;
-- --------------------------------------------------------

--
-- Структура таблицы `Продавцы`
--
-- Создание: Май 31 2018 г., 16:27
-- Последнее обновление: Июн 06 2018 г., 15:09
--

DROP TABLE IF EXISTS `Продавцы`;
CREATE TABLE `Продавцы` (
  `id` int(11) NOT NULL,
  `Имя` varchar(255) NOT NULL,
  `Фамилия` varchar(255) NOT NULL,
  `Телефон` varchar(255) NOT NULL,
  `Статус` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Продавцы`:
--

--
-- Очистить таблицу перед добавлением данных `Продавцы`
--

TRUNCATE TABLE `Продавцы`;
--
-- Дамп данных таблицы `Продавцы`
--

INSERT INTO `Продавцы` (`id`, `Имя`, `Фамилия`, `Телефон`, `Статус`) VALUES
(1, 'Иван', 'Романов', '87777777777', 1),
(2, 'Иван', 'Петров', '87777777723', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Продавцы точки`
--
-- Создание: Май 31 2018 г., 16:42
-- Последнее обновление: Июн 06 2018 г., 15:21
--

DROP TABLE IF EXISTS `Продавцы точки`;
CREATE TABLE `Продавцы точки` (
  `Продавец` int(11) NOT NULL,
  `Точка` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Продавцы точки`:
--   `Точка`
--       `Точки` -> `id`
--   `Продавец`
--       `Продавцы` -> `id`
--

--
-- Очистить таблицу перед добавлением данных `Продавцы точки`
--

TRUNCATE TABLE `Продавцы точки`;
--
-- Дамп данных таблицы `Продавцы точки`
--

INSERT INTO `Продавцы точки` (`Продавец`, `Точка`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Продажи`
--
-- Создание: Май 31 2018 г., 21:08
--

DROP TABLE IF EXISTS `Продажи`;
CREATE TABLE `Продажи` (
  `id` int(11) NOT NULL,
  `Продавец` int(11) NOT NULL,
  `Товар` int(11) NOT NULL,
  `Количество` int(11) NOT NULL,
  `Дата` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Продажи`:
--   `Товар`
--       `Товар` -> `id`
--   `Продавец`
--       `Продавцы` -> `id`
--

--
-- Очистить таблицу перед добавлением данных `Продажи`
--

TRUNCATE TABLE `Продажи`;
-- --------------------------------------------------------

--
-- Структура таблицы `Склад`
--
-- Создание: Май 31 2018 г., 11:56
--

DROP TABLE IF EXISTS `Склад`;
CREATE TABLE `Склад` (
  `Товар` int(11) NOT NULL,
  `Статус` int(11) NOT NULL,
  `Количество` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Склад`:
--   `Статус`
--       `Статус товара` -> `id`
--   `Товар`
--       `Товар` -> `id`
--

--
-- Очистить таблицу перед добавлением данных `Склад`
--

TRUNCATE TABLE `Склад`;
-- --------------------------------------------------------

--
-- Структура таблицы `Статус перевозки`
--
-- Создание: Июн 05 2018 г., 13:46
--

DROP TABLE IF EXISTS `Статус перевозки`;
CREATE TABLE `Статус перевозки` (
  `id` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Статус перевозки`:
--

--
-- Очистить таблицу перед добавлением данных `Статус перевозки`
--

TRUNCATE TABLE `Статус перевозки`;
-- --------------------------------------------------------

--
-- Структура таблицы `Статус поставки`
--
-- Создание: Июн 06 2018 г., 12:25
--

DROP TABLE IF EXISTS `Статус поставки`;
CREATE TABLE `Статус поставки` (
  `id` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Статус поставки`:
--

--
-- Очистить таблицу перед добавлением данных `Статус поставки`
--

TRUNCATE TABLE `Статус поставки`;
-- --------------------------------------------------------

--
-- Структура таблицы `Статус товара`
--
-- Создание: Май 31 2018 г., 11:44
--

DROP TABLE IF EXISTS `Статус товара`;
CREATE TABLE `Статус товара` (
  `id` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Статус товара`:
--

--
-- Очистить таблицу перед добавлением данных `Статус товара`
--

TRUNCATE TABLE `Статус товара`;
-- --------------------------------------------------------

--
-- Структура таблицы `Статус точки`
--
-- Создание: Май 31 2018 г., 11:49
--

DROP TABLE IF EXISTS `Статус точки`;
CREATE TABLE `Статус точки` (
  `id` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Статус точки`:
--

--
-- Очистить таблицу перед добавлением данных `Статус точки`
--

TRUNCATE TABLE `Статус точки`;
-- --------------------------------------------------------

--
-- Структура таблицы `Тип пользователя`
--
-- Создание: Май 31 2018 г., 16:30
--

DROP TABLE IF EXISTS `Тип пользователя`;
CREATE TABLE `Тип пользователя` (
  `id` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Тип пользователя`:
--

--
-- Очистить таблицу перед добавлением данных `Тип пользователя`
--

TRUNCATE TABLE `Тип пользователя`;
-- --------------------------------------------------------

--
-- Структура таблицы `Тип товара`
--
-- Создание: Май 31 2018 г., 11:43
--

DROP TABLE IF EXISTS `Тип товара`;
CREATE TABLE `Тип товара` (
  `id` int(11) NOT NULL,
  `Название` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Тип товара`:
--

--
-- Очистить таблицу перед добавлением данных `Тип товара`
--

TRUNCATE TABLE `Тип товара`;
-- --------------------------------------------------------

--
-- Структура таблицы `Товар`
--
-- Создание: Июн 06 2018 г., 07:31
--

DROP TABLE IF EXISTS `Товар`;
CREATE TABLE `Товар` (
  `id` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL,
  `Тип` int(11) NOT NULL,
  `Цена` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Товар`:
--   `Тип`
--       `Тип товара` -> `id`
--

--
-- Очистить таблицу перед добавлением данных `Товар`
--

TRUNCATE TABLE `Товар`;
-- --------------------------------------------------------

--
-- Структура таблицы `Товары точки`
--
-- Создание: Май 31 2018 г., 11:56
--

DROP TABLE IF EXISTS `Товары точки`;
CREATE TABLE `Товары точки` (
  `id_товара` int(11) NOT NULL,
  `id_точки` int(11) NOT NULL,
  `Количество` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Товары точки`:
--   `id_товара`
--       `Товар` -> `id`
--   `id_точки`
--       `Точки` -> `id`
--

--
-- Очистить таблицу перед добавлением данных `Товары точки`
--

TRUNCATE TABLE `Товары точки`;
-- --------------------------------------------------------

--
-- Структура таблицы `Точки`
--
-- Создание: Май 31 2018 г., 11:45
--

DROP TABLE IF EXISTS `Точки`;
CREATE TABLE `Точки` (
  `id` int(11) NOT NULL,
  `Адрес` varchar(255) NOT NULL,
  `Статус` int(11) NOT NULL,
  `Выход` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `Точки`:
--   `Адрес`
--       `Адрес` -> `id`
--   `Статус`
--       `Статус точки` -> `id`
--

--
-- Очистить таблицу перед добавлением данных `Точки`
--

TRUNCATE TABLE `Точки`;
--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Адрес`
--
ALTER TABLE `Адрес`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Возрат`
--
ALTER TABLE `Возрат`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Выручка точки`
--
ALTER TABLE `Выручка точки`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Должности`
--
ALTER TABLE `Должности`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Логистика`
--
ALTER TABLE `Логистика`
  ADD PRIMARY KEY (`Товар`,`Точка`,`Дата`);

--
-- Индексы таблицы `Офис`
--
ALTER TABLE `Офис`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Поставки`
--
ALTER TABLE `Поставки`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Поставщики`
--
ALTER TABLE `Поставщики`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Продавцы`
--
ALTER TABLE `Продавцы`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Продавцы точки`
--
ALTER TABLE `Продавцы точки`
  ADD PRIMARY KEY (`Продавец`,`Точка`);

--
-- Индексы таблицы `Продажи`
--
ALTER TABLE `Продажи`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Склад`
--
ALTER TABLE `Склад`
  ADD PRIMARY KEY (`Товар`,`Статус`);

--
-- Индексы таблицы `Статус перевозки`
--
ALTER TABLE `Статус перевозки`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Статус поставки`
--
ALTER TABLE `Статус поставки`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Статус товара`
--
ALTER TABLE `Статус товара`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Статус точки`
--
ALTER TABLE `Статус точки`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Тип пользователя`
--
ALTER TABLE `Тип пользователя`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Тип товара`
--
ALTER TABLE `Тип товара`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Товар`
--
ALTER TABLE `Товар`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Товары точки`
--
ALTER TABLE `Товары точки`
  ADD PRIMARY KEY (`id_товара`,`id_точки`);

--
-- Индексы таблицы `Точки`
--
ALTER TABLE `Точки`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Адрес`
--
ALTER TABLE `Адрес`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Возрат`
--
ALTER TABLE `Возрат`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Выручка точки`
--
ALTER TABLE `Выручка точки`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Должности`
--
ALTER TABLE `Должности`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Офис`
--
ALTER TABLE `Офис`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Поставки`
--
ALTER TABLE `Поставки`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Поставщики`
--
ALTER TABLE `Поставщики`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Продавцы`
--
ALTER TABLE `Продавцы`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `Статус перевозки`
--
ALTER TABLE `Статус перевозки`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Статус поставки`
--
ALTER TABLE `Статус поставки`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Статус товара`
--
ALTER TABLE `Статус товара`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Статус точки`
--
ALTER TABLE `Статус точки`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Тип пользователя`
--
ALTER TABLE `Тип пользователя`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Тип товара`
--
ALTER TABLE `Тип товара`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Точки`
--
ALTER TABLE `Точки`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
