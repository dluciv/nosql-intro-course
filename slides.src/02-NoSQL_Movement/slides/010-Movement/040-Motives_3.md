## Мотивы III

* **Актуальное для облачных платформ**
    * Настолько хорошая масштабируемость, насколько возможно
        * Хорошо бы вообще автоматическая
    * Желательно небольшой оверхед при администрировании
  В облаках хорошо работают:
    * Data Warehouse, заточенные под Map-Reduce
    * Хранилища ключ-значение
    * М.б. и что-то посложнее, но не настолько сложное, как RDBMS
* **Кеширование и ввод/вывод вообще**
    * РСУБД (особенно хорошо нормализованные) выполняют сложные операции при чтении $\implies$ для нагруженных сайтов не очень,
      а у NoSQL данные представлены уже в агрегированном виде
    * Приложения *ждут* ввода/вывода, это типично для протоколов и драйверов РСУБД


note:

Вообще неблокирующий ввод/вывод м.б. и для РСУБД, просто традиционно не так часто встречается