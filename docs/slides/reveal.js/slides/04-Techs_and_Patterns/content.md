## Распределённая обработка информации и NoSQL СУБД

# Некоторые технологии и паттерны

### Луцив Дмитрий Вадимович
### ЗАО «Ланит-Терком», СПбГУ

= = = = = = = = = = = = =

# [Файловые системы вычислительных кластеров](https://www.youtube.com/embed/Xxz630u7YlQ?start=118)

<!-- .slide: data-background="images/clusterfs.gif" -->

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
## Как это выглядит теоретически

Map $\rightarrow$ Shuffle $\rightarrow$ Reduce

![](images/MapReduce_Work_Structure.png) <!-- .element width="100%" -->

- - - - - - - - - - - - -
## Как это выглядит практически (например)

![](images/mapreduce_step01.jpg) <!-- .element width="100%" -->

--- note:

Пример с семьёй и монетами

- - - - - - - - - - - - -
## Оптимизация

Для $V = V'$ и идемпотентной $reduce$ выполняют частичную редукцию:

$$combine: 2^{C \times V} \rightarrow 2^{C \times V}$$

---

Полкучается $$reduce \circ combine \circ map$$ по трафику эффективнее, чем $$reduce \circ map.$$

= = = = = = = = = = = = =
# Примеры <!-- .element style="color:cyan;" -->
<!-- .slide: data-background="images/helloworld.gif" -->

- - - - - - - - - - - - -
## [Пример](https://habrahabr.ru/post/184130/) MongoDB: данные

    {
      name : "John",
      age : 23,
      interests : ["football", "IT", "women"]
    }

$\rightarrow$

    {
      key: "football",
      value: 1349
    },
    {
      key: "MongoDB",
      value: 58
    },
    //...

- - - - - - - - - - - - -
## Пример MongoDB: код

    function map(){
      for(var i in this.interests) {
        emit(this.interests[i], 1);
      }
    }

    function reduce(key, values) {
      var sum = 0;
      for(var i in values) {
        sum += values[i];
      }
      return sum;
    }

    function finalize(key, reducedValue) {
      return reducedValue.interests_count / reducedValue.count;
    }

---

    db.users.mapReduce(map, reduce, {
      finalize: finalize, out:"interests_by_age"
    });

- - - - - - - - - - - - -
## Примеры Hadoop

* [Пример с подсчётом слов](https://hadoop.apache.org/docs/stable/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html#Example:_WordCount_v1.0)
* [Пример с подсчётом $\pi$ методом Монте-Карло](https://hadoop.apache.org/docs/r2.6.0/api/org/apache/hadoop/examples/pi/package-summary.html)

- - - - - - - - - - - - -
## Hadoop Map Split

Map в одиночку?.. Нет!

[![](images/hadoop-split.jpg)<!-- .element: width="100%" -->](http://www.dummies.com/programming/big-data/hadoop/input-splits-in-hadoops-mapreduce/)

* Распараллеливание потоковой обработки файлов
* Интеллектуальное [разбиение на блоки](https://developer.yahoo.com/hadoop/tutorial/module5.html) средствами [InputFormat](https://hadoop.apache.org/docs/r2.7.2/api/org/apache/hadoop/mapred/InputFormat.html)
    * Например, текстовые файлы [встроенными средствами](http://hadoop.apache.org/docs/r2.7.1/api/org/apache/hadoop/mapreduce/lib/input/TextInputFormat.html) разбиваются на строки


= = = = = = = = = = = = =
# Pregel <!-- .element style="color: black;" -->
<!-- .slide: data-background="images/1652.jpg" -->

- - - - - - - - - - - - -
## Pregel: зачем и почему?

**Зачем**
* считать [Page Rank](https://en.wikipedia.org/wiki/PageRank) =)
* исполнять прочие алгоритмы для [вебграфов](https://en.wikipedia.org/wiki/Webgraph)

**Почему**
* для вебграфов эффективны итеративные алгоритмы
* итеративные алгоритмы плохо ложатся в MapReduce

- - - - - - - - - - - - -
## Пример: Page Rank

[![](images/PageRanks-Example.svg)  <!-- .element style="margin-left: 500px; margin-right: auto; width: 600px;" -->](images/PageRanks-Example.svg)

Вероятность того, что пользователь перейдёт по случайной ссылке с учётом затухания интереса

$${\rm PR}(P) = (1 - D) + D \sum_{P' \rightarrow P; P' \not{} = P} \frac{{\rm PR}(P')}{|{\rm links}(P')|},$$

Где $D \approx 0,85$, а $1 - D$ — минимальный ${\rm PR}$.

Проблема в том, что ${\rm PR}$ изначально неизестны, поэтому:

1. Сперва их выставляют случайными или минимальными.
2. Потом *несколько раз* пересчитывают.

- - - - - - - - - - - - -
## Об итеративных алгоритмах

**Оператор** выполняет операцию по изменению состояния системы

Если итераций мало или «*матрица оператора плотная*» (т.е. многие компоненты состояния влияют на многие) $\implies$ MapReduce, а лучше что-то более локальное
* Пример — метод Рунге-Кутты

Если итераций много (например, $1\% \approx 0,85^{28,34}$) и «*матрица разреженная*» $\implies$ стоит подумать, а не о графе ли речь
* Пример — Page Rank

И задачи на вебграфах обычно графовые =)

- - - - - - - - - - - - -
## [Page Rank](https://github.com/LaurensRietveld/GiraphAnalysis/blob/master/src/main/java/org/data2semantics/giraph/pagerank/PageRankComputation.java) с помощью [Apache Giraph](http://giraph.apache.org/)

    public class PageRankComputation extends RandomWalkComputation<NullWritable> {
        @Override protected double transitionProbability(
                Vertex<Text, DoubleWritable, NullWritable> vertex,
                double stateProbability, Edge<Text, NullWritable> edge) {
            return stateProbability / vertex.getNumEdges();
        }

        @Override protected double recompute(
                Vertex<Text, DoubleWritable, NullWritable> vertex,
                Iterable<DoubleWritable> partialRanks,
                double teleportationProbability) {
            // rank contribution from incident neighbors
            double rankFromNeighbors = MathUtils.sum(partialRanks);

            // rank contribution from dangling vertices
            double danglingContribution =
                 getDanglingProbability() / getTotalNumVertices();

            // recompute rank
            return (1d - teleportationProbability) *
                   (rankFromNeighbors + danglingContribution) +
                   teleportationProbability / getTotalNumVertices();
        }
    }

= = = = = = = = = = = = =
# Спасибо
