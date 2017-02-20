<!-- -*- coding: utf-8 -*- -->

# Распределённая обработка информации и NoSQL базы данных

[![Ada Lovelace](resources/Ada-18-396x480.jpg)](https://en.wikipedia.org/wiki/Ada_Lovelace)

<!-- © [Высшая инженерная школа «Авалон»](http://www.avalon.ru/) \ -->
<!-- © [ООО «Ланит-Терком»](http://lanit-tercom.com/) \ -->
<!-- © [ФГАОУ ВО СПбПУ](http://spbstu.ru/) \ -->

* © [Дмитрий Луцив](http://dluciv.name/)
* © Ещё кто-то, но пока не совсем понятно, кто именно =)

Лицензия на материалы пока тоже непонятно, какая, но будем считать, что [уже есть](LICENSE.md).

## Аннотация

Этот курс составлен по мотивам программы одноименного [спецсеминара](http://edu.dluciv.name/Home/distrinfproc) для 4 курса (бакалавриат) студентов отделения информатики Матмеха СПбГУ.

В отличие от спецсеминара для студентов, этот курс ориентирован на программистов, которые уже обладают достаточным опытом в практическом программировании и хотят расширить свою эрудицию в актуальных областях.

Курс подразумевает занятия, которые объединяют в себе лекции, семинары и совместные лабораторные работы. От участников ожидается активная обратная связь. Мы будем вместе пробовать рассматривать распределённые вычислительные системы и СУБД, обрабатывать данные, пробовать реализовывать свои вычислительные системы.

## Расписание

### Когда?
По вторникам **с 17:30 до 19:00** (внимание, не с 17:10, а с 17:30). Пока так. *Наверное* и дальше тоже. Длительность курса — 8 пар.

### Место встречи изменить можно
Встречаемся у 4337, фактически занятие проводим в помещении, которое способно будет нас вместить. В случае, если нас окажется более двухсот, идём в парк [Сергиевка](https://ru.wikipedia.org/wiki/%D0%A1%D0%B5%D1%80%D0%B3%D0%B8%D0%B5%D0%B2%D0%BA%D0%B0_(%D0%B4%D0%B2%D0%BE%D1%80%D1%86%D0%BE%D0%B2%D0%BE-%D0%BF%D0%B0%D1%80%D0%BA%D0%BE%D0%B2%D1%8B%D0%B9_%D0%B0%D0%BD%D1%81%D0%B0%D0%BC%D0%B1%D0%BB%D1%8C)).

### А если виртуально?
Общения много, но порой хочется ещё больше, и круглосуточно.

[**Сей чат**](https://riot.im/app/#/room/#lt-nosql:matrix.org) как раз на такой случай. *Чат запущен на основе системы [Matrix](http://matrix.org/). Вы можете зарегистрироваться на сервере создателей, а можете [запустить свой](https://github.com/matrix-org/synapse/blob/master/README.rst) — система децентрализованная, подобно Email или XMPP, и разные сервера крепко дружат друг с другом.*

## Программа

Отметим сразу, что в связи с организационной спецификой, некоторые слушатели по ряду тем могут быть более эрудированы и иметь больший практический опыт, нежели преподаватель. В этом случае очень приветствуется как активное участие (которое приветствуется всегда), так и выступление кого-либо из слушателей с докладом на выбранную тему.
Программа [может и, вероятно будет меняться](https://en.wikipedia.org/wiki/Self-modifying_code) по мере исполнения.

Доступны [приветсвтенные слайды](https://dluciv.github.io/nosql-intro-course/slides/00-Hello).

### Проблематика

1. Хочется много
    * Закон Мура — правда, мура́, и где всё-таки правда
    * Закон Амдала
    * Топология задачи и топология вычислителя (пример — станция управления лифтом)
2. Реляционные БД и СУБД
    * Сложность
    * Масштабируемость и доступность
    * Вопросы программной инженерии — таблицы-объекты-таблицы
    * Вопросы *допрограммной* инженерии — вспомним табуляторы

Доступны [слайды](https://dluciv.github.io/nosql-intro-course/slides/01-Problematics) и [видеозапись занятия 25.10.2016](https://youtu.be/qHFYgicOI1o).

### The NoSQL movement и основные свойства NoSQL БД
1. The NoSQL Movement
    * История
    * Суть
2. ACID vs BASE, [О согласованности в конечном счёте](http://citforum.ru/gazeta/154/)
3. Консенсус в распределённых вычислительных системах
4. «Теорема» [CAP](https://en.wikipedia.org/wiki/CAP_theorem)
    * Правда жизни
    * [«Доказательство»](http://mwhittaker.github.io/2014/08/16/illustrated-proof-cap-theorem/)
    * [Дискуссия](http://citforum.ru/gazeta/154/) и [критика](https://arxiv.org/abs/1509.05393)
5. «Теорема» [PACELC](https://en.wikipedia.org/wiki/PACELC_theorem)

Доступны [слайды](https://dluciv.github.io/nosql-intro-course/slides/02-NoSQL_Movement_CAP_PACELC) и [видеозапись занятия 01.11.2016](https://youtu.be/6tAG-OexfQI).

### Нереляционные СУБД
1. Графовые
2. Логические
3. Ключ-значение
4. Документо-ориентированные
    * XML — [Sedna](http://sedna.org/), [eXistdb](http://exist-db.org/exist/apps/homepage/index.html)
    * JSON — [MongoDB](https://www.mongodb.com/), [CouchDB](http://couchdb.apache.org/)
5. Колоночные

Доступны [слайды](https://dluciv.github.io/nosql-intro-course/slides/03-NonRelOverview) и аудиозапись занятия 09.11.2016:
можно [прослушать](https://dluciv.github.io/nosql-intro-course/resources/recordings/recordings.html#arec-2016-11-08) и
[скачать](https://dluciv.github.io/nosql-intro-course/resources/recordings/2016-11-08_nosql-recording.opus.ogg).

### Паттерны и технологии

Технологии

2. ФС кластеров

Паттерны

1. GRID
2. Map-Reduce
3. Pregel

[Доступны слайды](https://dluciv.github.io/nosql-intro-course/slides/04-Techs_and_Patterns/) и видеозаписи занятий [15.11.2016](https://youtu.be/seERreFTyE4) и [22.11.2016](https://youtu.be/_8_iQTsjnPc).

### Использование NoSQL СУБД
Простой агрегирующий анализ обработанных данных с использованием MongoDB. Практическое занятие.

1. Вспомогательные технологии
    * Неблокирующий ввод-вывод
    * Минимум функционального программирования; [Continuation Passing Style](https://en.wikipedia.org/wiki/Continuation-passing_style)
    * Минимум JavaScript и [LiveScript](http://livescript.net/)
    * Функциональное программирование и телекоммуникации
2. Получение и первичная обработка данных
3. Импорт данных
4. Анализ данных
    * Хранимый JavaScript в MongoDB
    * MapReduce
    * Результаты

[Доступны слайды](https://dluciv.github.io/nosql-intro-course/slides/05-Distributed_Envs/), [видеозапись занятия 29.11.2016](https://youtu.be/tTegYDg3xjs?list=PLL0gqPNT01DYjMD_hD-hQE5qErwFzopPE),
а также исходный код примера [MapReduce для MongoDB](https://github.com/dluciv/nosql-intro-course/tree/master/resources/samples/iichan-slang).

### Распределённая обработка данных
Простая вычислительная задача «с нуля»

1. Краткий экскурс в выбранную платформу, на выбор:
    * Akka (Scala)
    * **[Erlang](https://youtu.be/xrIjfIjssLE)** (выбран)
    * Microsoft Orleans
2. Самостоятельно реализуем GRID
    * Решение одной из предложенных задач методом грубой или не очень грубой силы

[Доступны слайды](https://dluciv.github.io/nosql-intro-course/slides/05-Distributed_Envs/) и [видеозапись занятия 06.12.2016](https://youtu.be/sG_Ns6ijmQs?list=PLL0gqPNT01DYjMD_hD-hQE5qErwFzopPE),
а также исходный код примера [Bruteforce ZIP password для Erlang](https://github.com/dluciv/nosql-intro-course/tree/master/resources/samples/erlang-zip).


### Инженерия ПО и процесса производства ПО

Дискуссия

* [NoSQL и Agile](https://www.mongodb.com/agile-development)
* [Дискуссия](http://www.dbta.com/BigDataQuarterly/Articles/The-Emerging-Agile-Data-Architecture-NoSQL-Hadoop-and-Beyond-113936.aspx)

А NoSQL ли?.. Может что-нибудь на основе PostgreSQL? =)

* https://jaxenter.com/nosql-vs-postgres-121967.html
* http://www.aptuz.com/blog/is-postgres-nosql-database-better-than-mongodb/
* https://habrahabr.ru/post/253017/

[Доступны слайды](https://dluciv.github.io/nosql-intro-course/slides/06-Software_Engineering/) и [видеозапись занятия 13.12.2016](https://youtu.be/v9FVAJwUso4?t=27m16s).

### Андеграунд

1. Добросовестность сервисов и лояльность пользователей; совесть — лучший котнролёр; что попало в интернет — остаётся там навсегда
2. ZeroNet, FreeNet, IPFS
3. «Правильные» мессенджеры — XMPP, Matrix, Tox...
4. Blockchain и те, кто из него произошёл
5. Изоляция: две сети в «ящиках»; deaddrops

[Доступны слайды](https://dluciv.github.io/nosql-intro-course/slides/07-Underground/) и [видеозапись занятия 13.12.2016](https://youtu.be/v9FVAJwUso4?t=52m45s).


## Список литературы

... и не только литературы

1.  Christof Strauch [NoSQL Databases](http://www.christof-strauch.de/nosqldbs.pdf)
2.  Michael Stonebraker [Errors in Database Systems, Eventual Consistency, and the CAP Theorem](http://cacm.acm.org/blogs/blog-cacm/83396-errors-in-database-systems-eventual-consistency-and-the-cap-theorem/fulltext#). BLOG@CACM, April 5, 2010.
    [Перевод](http://citforum.ru/gazeta/154/) С.Д. Кузнецова, ИСП РАН
3.  Seth Gilbert, Nancy Lynch. [Brewer's Conjecture and the Feasibility of Consistent Available Partition-Tolerant Web Services](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.20.1495). In ACM SIGACT News, 2002
4.  Daniel J. Abadi. [Consistency Tradeoffs in Modern Distributed Database System Design](http://cs-www.cs.yale.edu/homes/dna/papers/abadi-pacelc.pdf), Yale University, 2012
5.  Ian Robinson, Jim Webber, Emil Eifrem. [Graph Databases](http://graphdatabases.com/), O'Reilly Media, 2013
6.  Jeffrey Dean, Sanjay Ghemawat. [MapReduce: Simplified Data Processing on Large Clusters](http://static.googleusercontent.com/media/research.google.com/es/us/archive/mapreduce-osdi04.pdf), [OSDI, 2004](https://www.usenix.org/legacy/event/osdi04/)
7.  Toby Segaran. [Programming Collective Intelligence](http://shop.oreilly.com/product/9780596529321.do), O'Reilly Media, 2007
8.  Grzegorz Malewicz, Matthew H. Austern, Aart J.C Bik, James C. Dehnert, Ilan Horn, Naty Leiser, and Grzegorz Czajkowski. [Pregel: A System for Large-Scale Graph Processing](https://kowshik.github.io/JPregel/pregel_paper.pdf). In Proceedings of the 2010 ACM SIGMOD International Conference on Management of data (SIGMOD '10). ACM, New York, NY, USA, 135-146. DOI=http://dx.doi.org/10.1145/1807167.1807184
9.  Fred Hébert. [Learn You Some Erlang for Great Good](http://learnyousomeerlang.com/), 2013
10. Суровский Евгений. [Очень большой Postgres](https://habrahabr.ru/post/253017/), 2015
