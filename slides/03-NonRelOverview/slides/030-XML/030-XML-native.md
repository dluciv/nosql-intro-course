## Урождённые XML

### Кто они?

* NoSQL
* Документо-ориентированные
    * Только документы большие, и иерархические ссылки эффективные

### Языки

* XPath, пример**ы**

        bookstore//book/excerpt//emph
        (book/author)[last()]
        book[/bookstore/@specialty=@style]

* XQuery, пример

        for $x in doc("books.xml")/bookstore/book
        where $x/price>30
        order by $x/title
        return $x/title

* XUpdate (менее популярен)
