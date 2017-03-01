## XML-Enabled (реляционные)

### Варианты

1. XML хранится при помощи CLOB (Character Large Object)
2. XML хранится по таблицам в соответствии с схемой
3. Для XML заводится специальный домен в соответствии со [стандартом ISO 9075-14](http://www.iso.org/iso/home/store/catalogue_ics/catalogue_detail_ics.htm?csnumber=53686)

### Пример — [поддержка XML IBM DB2](http://www.ibm.com/support/knowledgecenter/SSEPGG_9.7.0/com.ibm.db2.luw.xml.doc/doc/c0022308.html)

* Конечно же поддерживается КОБОЛом =)
* Позволяет создавать индексы
* Знает XML-схему
* [Запросы к XML d SQL](http://www.ibm.com/support/knowledgecenter/en/SSEPGG_9.7.0/com.ibm.db2.luw.xml.doc/doc/c0023896.html)

        select
          id, vol, xmlquery('$j/name', passing journal as "j") as name
        from
          journals
        where 
          xmlexists('$j[licence="CreativeCommons"]', passing journal as "j")