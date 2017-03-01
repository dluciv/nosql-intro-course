## Форматированные файлы: COBOL

    DATA DIVISION.
       FILE SECTION.
       FD STUDENT.
       01 STUDENT-FILE.
          05 STUDENT-ID PIC 9(5).
          05 NAME PIC A(25).
    
       WORKING-STORAGE SECTION.
       01 WS-STUDENT.
          05 WS-STUDENT-ID PIC 9(5).
          05 WS-NAME PIC A(25).
       01 WS-EOF PIC A(1).
