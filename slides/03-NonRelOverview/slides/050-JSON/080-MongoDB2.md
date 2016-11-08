## MongoDB: основные свойства

* Высокая производительность
* Развитый язык (на самом деле не язык) запросов
    * В т.ч. [агрегирование](https://docs.mongodb.com/manual/core/aggregation-pipeline/)
        * И Map-Reduce с описанием на JavaScript
    * Текстовый поиск `db.stores.find( { $text: { $search: "java coffee shop" } } )`
    * [Индексирование и запросы по геоиду](https://docs.mongodb.com/manual/tutorial/geospatial-tutorial/)
