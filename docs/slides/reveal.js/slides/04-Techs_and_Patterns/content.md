## Распределённая обработка информации и NoSQL СУБД

# Некоторые технологии и паттерны

### Луцив Дмитрий Вадимович
### ЗАО «Ланит-Терком», СПбГУ

= = = = = = = = = = = = =

# Файловые системы вычислительных кластеров

<iframe width="100%" height="1000px" src="https://www.youtube.com/embed/Xxz630u7YlQ?start=118&autoplay=1" frameborder="0" allowfullscreen></iframe>
<!-- . slide : data-background="images/hard-drive.gif" -->

- - - - - - - - - - - - -
## Свойства

* **Прозрачность доступа** — одинаковый доступ к локальным и удалённым данным
* **Прозрачность именования** — общее пространство имён для локальных и удалённых
* **Прозрачность параллельности** — когерентность изменений у всехъ читателей
* **Прозрачность восстановления после сбоев** — сбои и восстановления клиентов не касаются
* **Гетерогенность клиентов и, возможно, серверов**
* **Масштабируемость** хранилища
* **Прозрачность репликации** файлов внутри ФС
* **Прозрачность миграции** файлов внутри ФС

- - - - - - - - - - - - -
## Примеры

ФС        | М/Д | Драйверы
----------|-----|----------
Ceph      | отд | Спец. бибилиотеки, S3 API, FUSE
BeeGFS    | отд | POSIX (модуль)
GlusterFS | [EH](http://moo.nac.uci.edu/~hjm/fs/An_Introduction_To_Gluster_ArchitectureV7_110708.pdf) | Спец. библиотеки, FUSE, NFS, SMB
Lustre    | отд | Спец. бибилиотеки, POSIX (модуль), FUSE
HDFS      | отд | Не монтируется; спец. библиотеки для C и Java, HTTP API

- - - - - - - - - - - - -
## [Подробнее о HDFS](http://www.taskdata.com/index.php?option=com_content&view=article&id=26&Itemid=72&lang=ru)

- Блоки распределяются по нескольким машинам во время загрузки
- Оптимизирована для потоковых считываний
- Нет random write. Есть append, небыстрый random read

= = = = = = = = = = = = =
# Паттерны организации распределённых вычислений <!-- .element style="color:white;" -->
<!-- .slide: data-background="images/pattern.gif" -->

- - - - - - - - - - - - -
## Grid

Очень «рыхлый» гетерогенный кластер, сильно распределённый, а иногда даже общественный.

Свойства:

* Общая очередь или пространство задач
    * Обычно задача одна и та же, но данные разные
* Много вычислительных узлов, которые считают свои фрагменты

Примеры задач:

* Анализ геномов
    * Борьба с болезнями
* Поиск следов клингонов и рептилоидов во вселенной
* Прочие физические рассчёты

- - - - - - - - - - - - -
## MapReduce: основы

### История

Название в честь `(map ...)` и `(reduce ...)` (в более современных языках — `fold`) LSIP

### Принцип

* Разбиение на классы эквивалдентности $$ map: D \rightarrow C \times V $$

* Редукция $$ reduce: 2^{C \times V} \rightarrow V' $$

Jeffrey Dean, Sanjay Ghemawat. [MapReduce: Simplified Data Processing on Large Clusters](http://static.googleusercontent.com/media/research.google.com/es/us/archive/mapreduce-osdi04.pdf).

- - - - - - - - - - - - -
## Как это выглядит

Map $\rightarrow$ Shuffle $\rightarrow$ Reduce

![](images/MapReduce_Work_Structure.png) <!-- .element width="100%" -->

- - - - - - - - - - - - -
## Оптимизация

Для $V = V'$ и идемпотентной $reduce$ выполняют частичную редукцию:

$$combine: 2^{C \times V} \rightarrow 2^{C \times V}$$

---

Полкучается $$reduce \circ combine \circ map$$ по трафику эффективнее, чем $$reduce \circ map.$$

= = = = = = = = = = = = =
# Примеры <!-- .element style="color:cyan;" -->
<!-- .slide: data-background="images/helloworld.gif" -->

= = = = = = = = = = = = =
# Спасибо
