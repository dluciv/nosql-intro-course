## Примет Berkley DB (Питон)

        data = mydb.get(key)
        if data:
            doSomething(data)

или

        rec = cursor.first()
        while rec:
            print(rec)
            rec = cursor.next()
