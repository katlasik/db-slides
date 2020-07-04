### Pobieranie danych
 
 1. Pobierz wszyskie dane z tabeli **students**.
 
   ```sql
   SELECT * FROM students
   ```
 
 2. Wyszukaj tylko imiona i nazwiska uczniów w tabeli **students**.
   
   ```sql
   SELECT first_name, last_name FROM students
   ``` 

 3. Wyszukaj id oraz imiona i nazwiska nauczycieli w tabeli **teachers**.
 
   ```sql
   SELECT id, first_name, last_name FROM teachers
   ``` 
 
 4. Wyszukaj nazwiska i imiona nauczycieli w tabeli **teachers** oraz posortuj wyniki alfabetycznie najpierw po nazwisku, a potem po imieniu.
 
   ```sql
   SELECT last_name, first_name FROM teachers ORDER BY last_name, first_name
   ``` 

 5. Wyszukaj imiona, nazwiska i datę urodzenia uczniów w tabeli **students** i posortuj wyniki narastająco po dacie urodzenia.

   ```sql
   SELECT first_name, last_name, birthdate FROM students ORDER BY birthdate
   ```  
 
 6. Znajdź 5 najlepszych ocen i daty ich otrzymania z tabeli **student_notes**.
 
   ```sql
   SELECT value as note, received_at FROM student_notes ORDER BY value DESC LIMIT 5;   
   ```

 7. Znajdź kolejne 5 najlepszych ocen i daty ich otrzymania z tabeli **student_notes**.
 
   ```sql
   SELECT value as note, received_at FROM student_notes ORDER BY value DESC LIMIT 5 OFFSET 5;   
   ```
 
 8. Znajdź 5 najgorszych ocen i daty ich otrzymania z tabeli **student_notes**.
 
   ```sql
   SELECT value as note, received_at FROM student_notes ORDER BY value LIMIT 5 OFFSET 5;   
   ```
   
### Filtrowanie danych

 1. Wyszukaj dane w tabeli **students** ucznia, którego id to 3.
 
   ```sql
   SELECT * FROM students WHERE id = 3;   
   ``` 
 
 2. Wyszukaj dane w tabeli **students**, tak aby pobrać tylko uczniów, których imię to Szymon.
 
   ```sql
   SELECT * FROM students WHERE first_name = 'Szymon'
   ```

 3. Wyszukaj dane w tabeli **students**, tak aby pobrać tylko uczniów, których imię to Szymon albo Krystyna.
 
   ```sql
   SELECT * FROM students WHERE birthdate < '1999-01-01'
   ```

 4. Wyszukaj dane w tabeli **students**, tak aby pobrać tylko uczniów urodzonych przed 1 stycznia 1999 roku.
 
   ```sql
   SELECT * FROM students WHERE birthdate < '1999-01-01'
   ```

 5. Wyszukaj dane w tabeli **students**, tak aby pobrać tylko uczniów urodzonych przed 1 stycznia 1999 roku, ale po 1 stycznia 1998 roku.

   ```sql
   SELECT * FROM students WHERE birthdate < '1999-01-01' AND birthdate > '1998-01-01'
   ```

 6. Znajdź imiona 3 najstarszych uczniów w tabeli **students** urodzonych po 1 stycznia 1996 roku.

   ```sql
   SELECT * FROM students WHERE birthdate > '1996-01-01' ORDER BY birthdate LIMIT 3
   ```
 
 7. Znajdź uczniów, których nazwiska zaczynają się do *Ko*.

   ```sql
   SELECT * FROM students WHERE last_name LIKE 'Ko%'
   ```

 8. Znajdź uczniów, których nazwiska kończą się się do *ski*.

   ```sql
   SELECT * FROM students WHERE last_name LIKE 'ski%'
   ```

 9. Znajdź uczniów, których nazwiska zawierają *wal*. 
 
   ```sql
   SELECT * FROM students WHERE last_name LIKE '%wal%'
   ```
 
### Funkcje  
 
 1. Zwróć imiona i nazwiska uczniów jako jedną kolumnę o nazwie **name** z tabeli **students**.
 
   ```sql
   SELECT CONCAT(first_name, ' ', last_name) as name FROM students WHERE last_name LIKE 'Ko%'
   ```
 
 2. Zwróć inicjały uczniów jako kolumnę **shortcut** (Andrzej Nowacki -> A.N.).
   
   ```sql
   SELECT CONCAT(SUBSTRING(first_name,1,1), '.', SUBSTRING(last_name,1,1), '.') as shortcut FROM students
   ```

 3. Zwróć całe imiona nauczycieli napisane dużymi literami.
    
    ```sql
    SELECT UPPER(first_name) as name FROM teachers
    ```

 4. Zwróć imię, nazwisko i rok urodzenia danego ucznia.

    ```sql
    SELECT first_name, last_name, year(birthdate) as birth_year FROM students
    ```

 5. Zwróc bieżącą datę.

    ```sql
    SELECT CURRENT_DATE
    ```

 6. Stwórz zapytanie symulujące rzut kostką sześciościenną.

    ```sql
    SELECT ROUND(RAND()*6) +1 AS kostka
    ```

 7. Zwróć ilość dni do końca 2020 roku.

    ```sql
    SELECT DATEDIFF(DATE('2020-12-31'), CURRENT_DATE)
    ```

 8. Zwróć oceny uczniów razem z ilością dni jako upłynęła od ich otrzymania.

    ```sql
    SELECT value, DATEDIFF(CURRENT_DATE, received_at) AS days_age FROM student_notes;
    ```

 9. Zwróć nazwę oraz opis przedmiotu z tabeli **school_classes**. Jeżeli nie istnieje opis to wyświetl *"brak opisu"*.

    ```sql
    SELECT name, COALESCE(description, 'brak opisu') FROM school_classes;
    ```

 10. Pobierz wartość oraz datę otrzymania oceny, ale jeżeli ocena została wystawiona przed 1 czerwca 2019, to przyjmij tą datę.
 
     ```sql
     SELECT value, GREATEST(received_at, DATE('2019-06-01')) FROM student_notes;
     ```
    
 11. Pobierz oceny i dodaj opis oceny: dla 1,2 opis `niska`, 3,4 `średnia` oraz 5,6 `wysoka`. 
    
     ```sql
     SELECT
         value,
     	 CASE
     		WHEN value IN(1,2) THEN 'niska'
     		WHEN value IN(3,4) THEN 'średnia'
     		WHEN value IN(5,6) THEN 'wysoka'
     	E ND AS description
      FROM student_notes;
     ```    
 12. Stwórz zapytanie zwracające imię i nazwisko 3 losowych uczniów.
 
     ```sql
     SELECT 
      first_name, last_name
     FROM
       students
     ORDER BY RAND()
     LIMIT 3;
     ```

### Agregacje
 1. Zwróć średni wiek uczniów liczony w latach.
    ```sql
    SELECT ROUND(AVG(YEAR(CURRENT_DATE) - YEAR(birthdate))) FROM students;
    ```
    
 2. Policz wszystkich uczniów.
     ```sql
    SELECT COUNT(1) FROM students;
    ```
 
 3. Zwróć ilość wszystkich ocen (tabela **student_notes**) według stopni w kolejności od najlepszej.
     ```sql
    SELECT value, COUNT(1) as count FROM student_notes GROUP BY value ORDER BY value DESC;
    ```
 
 4. Zwróć ilość ocen w tabeli **student_notes** według miesięcy (bez względu na rok) w kolejności od stycznia.
     ```sql
    SELECT MONTH(received_at) AS month, COUNT(1) as count FROM student_notes GROUP BY MONTH(received_at) ORDER BY MONTH(received_at);
    ```
 
 5. Znajdź długość najkrótszego nazwiska ucznia.
    ```sql
    SELECT MIN(LENGTH(last_name)) AS LONGEST FROM students;
    ```
 
 6. Wyznacz najlepszą i najgorszą ocenę wystawioną w danym miesiącu.
    ```sql
     SELECT MONTH(received_at) AS month, MAX(value) AS best_note, MIN(value) AS worst_note 
     FROM student_notes GROUP BY   MONTH(received_at) ORDER BY MONTH(received_at);
    ```
    
 7. Wyznacz średnią ocenę wystawioną w danym miesiącu. Nie bierz pod uwagę ocen 1 oraz 6. Odrzuć średnie 
    poniżej 3.5. Sformatuj średnią, tak by miałą tylko 2 miejsca po przecinku.
       
    ```sql
    SELECT MONTH(received_at) AS month, FORMAT(AVG(value), 2) AS avg
    FROM student_notes
    WHERE value NOT IN (1,6)
    GROUP BY month(received_at)
    HAVING avg > 3.5
    ```      
 
### Podzapytania
 1. Znajdź imię i nazwisko uczniów, których wiek jest powyżej przeciętnego wieku.
    ```sql
    SELECT first_name, last_name FROM students WHERE DATEDIFF(CURRENT_DATE, birthdate) > (
        SELECT AVG(DATEDIFF(CURRENT_DATE, birthdate)) FROM students
    )
    ```
 2. Znajdź daty wystawienia i  wartości ocen, które zostały wystawione pół roku później niż pierwsza ocena.
    ```sql
    SELECT received_at, value FROM student_notes WHERE DATE_SUB(received_at, INTERVAL 6 MONTH) > (
        SELECT MIN(received_at) FROM student_notes
    )
    ```
    
 3. Znajdź przedmioty, których średnia ocen jest wyższa niż średnia ocen dla wszystkich przedmiotów.
 
    ```sql
    SELECT *
    FROM school_classes WHERE id = ANY (
       SELECT school_class_id
       FROM (
             SELECT AVG(value) AS avg_value, school_class_id
             FROM student_notes GROUP BY school_class_id
       ) average_notes WHERE avg_value > (
             SELECT AVG(value) AS all_avg_value
             FROM student_notes
       )
    );
    ```
    
 4. Wyświetl uczniów, którzy otrzymali przynajmniej jedną szóstkę.
  
    ```sql
    SELECT *
    FROM students
    WHERE EXISTS(
        SELECT id
        FROM student_notes
        WHERE student_notes.student_id = students.id
        AND value = 6
    )
    ```
    
  5. Wyświetl przedmioty szkolne, których uczniowie dostali co najmniej 2 szóstki.
     
     ```sql
     SELECT *
     FROM school_classes
     WHERE EXISTS(
       SELECT COUNT(1) AS count
       FROM student_notes
       WHERE value = 6 AND school_class_id = school_classes.id
       GROUP BY school_class_id
       HAVING count > 1
     )
     ```
  
  6. Wyznacz różnicę między najlepszą, a najgorszą średnią ocen uczniów.
     
     ```sql
     SELECT MAX(avg) - MIN(avg)
     FROM (
       SELECT first_name, last_name, AVG(value) AS avg
       FROM student_notes
          JOIN students ON students.id = student_notes.student_id
       GROUP BY first_name, last_name
     ) averages
     ```
  7. Znajdź uczniów, którzy ze wszystkich przedmiotów dostali średnią powyżej 2.5.
   
     ```sql
     SELECT * FROM students WHERE
     2.5 < ALL(SELECT AVG(value) FROM student_notes WHERE student_id = students.id GROUP BY school_class_id);
     ```
      
  8. Znajdź uczniów, którzy przynajmniej z jednego przedmiotu dostali średnią poniżej 2.5.
     
     ```sql
     SELECT * FROM students WHERE
     2.5 > ANY(SELECT AVG(value) FROM student_notes WHERE student_id = students.id GROUP BY school_class_id);
     ```
 
### Złączenia
 1. Wyświetl wszystkich nauczycieli oraz klasy, których uczą. Jeżeli nie uczą żadnej klasy, to wyświetl *"brak"*.
    Zwróć kolumny z imieniem i nazwiskiem oraz z nazwą przedmiotu.
    
     ```sql
     SELECT first_name, last_name, COALESCE(school_classes.name, 'brak') AS note 
       FROM teachers LEFT JOIN school_classes ON   school_classes.teacher_id = teachers.id
     ```
    
 2. Wyświetl listę  uczniów razem z nazwami przedmiotów, których się uczą oraz nauczycieli uczących tych przedmiotów. Może występować wiele wierszy na ucznia.
    Nawet jeżeli uczeń nie uczy się w żadnej klasie powienien zostać wyświetlony. 
     ```sql
     SELECT s.first_name, s.last_name, sc.name, t.first_name, t.last_name
     FROM students s
     LEFT JOIN school_class_students scs ON s.id = scs.student_id
     LEFT JOIN school_classes sc ON sc.id = scs.school_class_id
     LEFT JOIN teachers t ON sc.teacher_id = t.id
     ```

 3. Wyświetl listę uczniów wzraz z ocenami, datami otrzymania tych ocen oraz przedmiotami na których zostały otrzymane. 
    Posortuje dane alfebetycznie po imionach uczniów, a potem chronologicznie od najstarszej otrzymanej oceny. 
    Dodatkowo wyświetl ocenę jako ilość gwiazdek, na przykład **3** -> *\*\*\**.
    Może występować wiele wierszy na ucznia.
 
    ```sql
    SELECT s.first_name, s.last_name, sn.value, sn.received_at
    FROM students s
             LEFT JOIN student_notes sn ON sn.student_id = s.id
    ORDER BY s.first_name, s.last_name, sn.received_at
    ```
 4. Wyświetl listę nauczycieli wraz z listą wystawionych przez nich ocen wraz z datami. 
       Posortuj po nazwisku nauczyciela alfabetycznie, a potem od nastarszej oceny.
       Może występować wiele wierszy na nauczyciela. 
       Nauczyciel powienien występować na liście nawet jeżeli nie wystawił żadnej oceny.
       
    ```sql
    SELECT t.first_name, t.last_name, sn.value, sn.received_at
    FROM teachers t
             lEFT JOIN school_classes sc ON sc.teacher_id = t.id
             LEFT JOIN student_notes sn ON sn.school_class_id = sc.id
    ORDER BY t.first_name, t.last_name, sn.received_at
    ```    
 5. Stwórz listę meczów ligi tenisa stołowego pomiędzy uczniami w formacie każdy z każdym.  
  
     ```sql
     SELECT
            CONCAT(host.first_name, ' ', host.last_name) AS host,
            CONCAT(guest.first_name, ' ', guest.last_name) AS guest
     FROM students host
     CROSS JOIN students guest
     WHERE host.id != guest.id
     ```
 
 6. Znajdź najlepszą ocenę jaką dostał uczeń. Zwróć dwie kolumny: uczeń i ocena. Jeżeli uczeń nie dostał żadnej oceny wyświetl *---*.
  
     ```sql
     SELECT CONCAT(first_name, ' ', last_name), MAX(value) AS best
     FROM student_notes
     JOIN students ON students.id = student_notes.student_id 
     GROUP BY CONCAT(first_name, ' ', last_name)
     ``` 
 7. Wyznacz średnią ocen każdego ucznia. Zaokrąglij średnią do jednego miejsca po przecinku. Wyświetl dane w formacie
        imię i nazwisko ucznia, średnia ocen. Zaokrąglij średnią do jednego miejsca po przecinku.
  
     ```sql
     SELECT first_name, last_name, ROUND(AVG(value),1) AS avg 
     FROM student_notes 
     JOIN students ON students.id = student_notes.student_id 
     GROUP BY first_name, last_name
     ``` 

 8. Wyznacz średnią ocen każdego ucznia. Zaokrąglij średnią do jednego miejsca po przecinku.
  
     ```sql
    SELECT first_name, last_name, ROUND(AVG(value),1) AS avg 
    FROM student_notes 
    JOIN students ON students.id = student_notes.student_id 
    GROUP BY first_name, last_name
    ```
 8.  Wyznacz średnią ocen każdego ucznia, ale wyświetl tylko te wiersze w których średnia jest powyżej 3.5.
        Wyświetl dane w formacie imię i nazwisko ucznia, średnia ocen. Zaokrąglij średnią do jednego miejsca po przecinku.
    
      ```sql
      SELECT first_name, last_name, ROUND(AVG(value),1) AS avg 
      FROM student_notes 
      JOIN students ON students.id = student_notes.student_id 
      GROUP BY first_name, last_name HAVING avg > 3.5
      ```
  9. Znajdź uczniów, których średnia ocen jest poniżej przeciętnej.
       
     ```sql
       SELECT first_name, last_name, avg FROM (
          SELECT s.first_name, s.last_name, AVG(sn.value) AS avg
          FROM students s
                   LEFT JOIN student_notes sn ON s.id = sn.student_id
          GROUP BY s.first_name, s.last_name
       ) averages WHERE
         averages.avg < (SELECT avg(value) FROM student_notes)   
     ```
  
  10. Wyświetl listę przedmiotów z następującymi kolumnami: nazwa, opis (w przypadku braku opisu wyświetl *"---"*),
      ilość uczniów która uczęszcza na dany przedmiot, nauczyciel, który uczy danego przedmiotu, najlepsza i najgorsza ocena.
           
       ```sql
       SELECT
              name,
              COALESCE(description, '---') AS description,
              best_note,
              worst_note,
              CONCAT(teachers.first_name, ' ', teachers.last_name) AS teacher
       FROM school_classes
       LEFT JOIN (
           SELECT school_class_id, COUNT(1) AS count FROM school_class_students GROUP BY school_class_id
       ) students_count ON students_count.school_class_id = school_classes.id
       LEFT JOIN (
           SELECT MAX(value) AS best_note, MIN(value) AS worst_note, school_class_id FROM student_notes GROUP BY school_class_id
       ) best_worst_notes ON best_worst_notes.school_class_id = school_classes.id
       LEFT JOIN teachers on school_classes.teacher_id = teachers.id
       ```
 11. Wyznacz ile ocen wystawił dany nauczyciel. Każdy nauczyciel powienien zostać wyświetlony, nawet jeżeli nie wystawił ocen.
     
     ```sql
     SELECT teachers.first_name, teachers.last_name, COALESCE(note_counts.count, 0) AS count
     FROM teachers
     LEFT JOIN (
         SELECT school_classes.teacher_id, COUNT(1) as count
         FROM school_classes
                  JOIN student_notes
                       ON school_classes.id = student_notes.school_class_id
         GROUP BY school_classes.teacher_id
     ) note_counts ON note_counts.teacher_id = teachers.id
     ```
     
 12. Wyświetl średnią uczniów osobno dla każdego przedmiotu w formacie uczeń (imię i nazwisko, przedmiot, średnia).
  
     ```sql
     SELECT s.first_name, s.last_name, sc.name AS school_class, avg_note FROM (
       SELECT AVG(value) AS avg_note, student_id, school_class_id
       FROM student_notes
       GROUP BY student_id, school_class_id
     ) averages
     RIGHT JOIN students s on averages.student_id = s.id
     LEFT JOIN school_classes sc on averages.school_class_id = sc.id
     ```
     
 13. Wyświetl średnią uczniów w formacie uczeń (imię i nazwisko, przedmiot, średnia).
     Średnią oblicz metodą średniej ważonej: matematyka 2, fizyka i chemia 1.5, WOS 1.  
     
     ```sql
     WITH priorities AS (
         SELECT 2 AS priority, 1 AS school_class_id
         UNION
         SELECT 1.5, 2
         UNION
         SELECT 1.5, 3
         UNION
         SELECT 1, 4
     ) SELECT CONCAT(first_name, ' ', last_name) AS student,
              SUM(p.priority * sn.value) / SUM(p.priority) AS avg
     FROM students s
     LEFT JOIN student_notes sn on s.id = sn.student_id
     LEFT JOIN school_classes sc on sn.school_class_id = sc.id
     LEFT JOIN priorities p ON sc.id = p.school_class_id
     GROUP BY student;
     ```
 
 14. Wyświetl imiona oraz nazwiska uczniów oraz najlepszą ocenę danego ucznia według przedmiotu i kiedy ją otrzymał.
     Jeżeli uczeń otrzymał najlepszą ocenę wielokrotnie to wyświetl wiele wierszy. 
     Wyświetl też uczniów bez ocen. 
     ```sql
     SELECT s.first_name, s.last_name, sc.name AS school_class, value AS note, received_at FROM (
        SELECT MAX(value) AS best_note, student_id, school_class_id
        FROM student_notes
        GROUP BY student_id, school_class_id
     ) bn JOIN student_notes sn
         ON bn.best_note = sn.value AND bn.student_id = sn.student_id AND bn.school_class_id = sn.school_class_id
     RIGHT JOIN students s on sn.student_id = s.id
     LEFT JOIN school_classes sc on sn.school_class_id = sc.id
     ```
 15. Wyświetl nauczycieli oraz wszystkich uczniów, których uczą jako listę. Do zgrupowania uczniów użyć funkcji `GROUP_CONCAT`.
     ```sql
     SELECT CONCAT(t.first_name, ' ', t.last_name) AS teacher, GROUP_CONCAT(CONCAT(s.first_name, ' ', s.last_name)) AS students
     FROM teachers t
     JOIN school_classes sc on t.id = sc.teacher_id
     JOIN school_class_students scs on sc.id = scs.school_class_id
     JOIN students s on scs.student_id = s.id
     GROUP BY teacher
     ```
 16. Wyświetl najlepszego ucznia danego miesiąca według średniej. Kolumny: miesiąc, imię, nazwisko, średnia. 
     Miesiące, które nie mają ocen nie muszą być wyświetlane.  
     ```sql
     WITH averages AS (
        SELECT AVG(value)         AS avg,
               month(received_at) AS month,
               student_id
        FROM student_notes
        GROUP BY month, student_id
     )
     SELECT best_averages.month,
           first_name,
           last_name,
           averages.avg
     FROM (
             SELECT MAX(avg) AS best_avg, month
             FROM averages
             GROUP BY month
         ) best_averages
             JOIN averages ON averages.month = best_averages.month AND averages.avg = best_averages.best_avg
             JOIN students ON students.id = averages.student_id ORDER By month;
     ```

### Unie
 1. Zwróć listę imion i nazwisk uczniów i nauczycieli. Kolumny nazwij **imię** i **nazwisko**.
 
    ```sql
    SELECT first_name as imię, last_name as nazwisko FROM students
    UNION
    SELECT first_name as imię, last_name as nazwisko FROM teachers
     ```
 
 2. Zwróć listę nazwisk uczniów i nauczycieli  w jednej kolumnie a w drugiej to jak często występują.

    ```sql
    SELECT
        last_name,
        COUNT(*) AS count
    FROM (
             SELECT last_name FROM students
             UNION ALL
             SELECT last_name FROM teachers
         ) names
    GROUP BY last_name
    ```
 3. Stwórz listę pierwszych dni miesiąca od 1 stycznia 2010 do 1 stycznia 2020.
  
    ```sql
    WITH RECURSIVE first_days AS (
        SELECT '2010-01-01' AS day
        UNION
        SELECT DATE_ADD(day, INTERVAL 1 MONTH) FROM first_days WHERE day < '2020-01-01'
    ) SELECT * FROM first_days;
    ```
  
 4. Stwórz ranking zawierający najlepszą ocenę według miesiąca. Nawet jeżeli dla danego miesiąca nie ma żadnych ocen to miesiąc powinien zostać wyświetlony.
   
    ```sql
    WITH months AS (
          SELECT 1 AS month
          UNION
          SELECT 2 AS month
          UNION
          SELECT 3 AS month
          UNION
          SELECT 4 AS month
          UNION
          SELECT 5 AS month
          UNION
          SELECT 6 AS month
          UNION
          SELECT 7 AS month
          UNION
          SELECT 8 AS month
          UNION
          SELECT 9 AS month
          UNION
          SELECT 10 AS month
          UNION
          SELECT 11 AS month
          UNION
          SELECT 12 AS month
      ) SELECT
             month,
             max(value) AS best
    FROM months
    LEFT JOIN student_notes ON
         months.month = month(student_notes.received_at)
    GROUP BY month
    ORDER BY month
    ```  
    alternatywnie:
     
    ```sql
    WITH RECURSIVE months AS (
        SELECT 1 AS month
        UNION
        SELECT month + 1 FROM months WHERE month < 12
    ) SELECT
          month,
          max(value) AS best
    FROM months
             LEFT JOIN student_notes ON
            months.month = month(student_notes.received_at)
    GROUP BY month
    ORDER BY month
    ```
     
 5. Narysuj choinkę używając rekurencyjnego zapytania **WITH RECURSIVE**:
 
    ```sql
    WITH RECURSIVE numbers AS (
        SELECT 1 AS lvl
        UNION
        SELECT lvl + 1 FROM numbers WHERE lvl < 5
    ), branches AS (
        SELECT RPAD(REPEAT('*', lvl), 10, ' ') AS branch
        FROM numbers
    ), tree AS (
        SELECT CONCAT(reverse(branch), branch)
        FROM branches
        UNION ALL
        SELECT CONCAT(reverse(branch), branch)
        FROM branches
        UNION ALL
        SELECT CONCAT(reverse(branch), branch)
        FROM branches
    ) SELECT * FROM tree;
    ```
### Window functions 
 1. Oblicz średnią każdego ucznia. Wyświetl rożnicę między średnią danego ucznia, a następnego. Wyświetl imię,
    nazwisko, średnią i różnicę.
    ```sql
    SELECT first_name, last_name, avg, (LAG(avg) over (ORDER BY avg DESC)) - avg AS difference FROM (
                  SELECT AVG(value) AS avg, student_id
                  FROM student_notes
                  GROUP BY student_id
              ) averages JOIN students ON averages.student_id = students.id
    ```
 2. Stwórz ranking trzech pierwszych uczniów z najwyższą średnią według przedmiotu.
    ```sql
    SELECT first_name, last_name, avg, name as school_class FROM (
         SELECT *,
                (ROW_NUMBER() over (PARTITION BY school_class_id ORDER BY avg DESC)) AS ranking
         FROM (
                  SELECT AVG(value) AS avg, student_id, school_class_id
                  FROM student_notes
                  GROUP BY student_id, school_class_id
              ) averages
     ) ranking
         JOIN students ON ranking.student_id = students.id
    JOIN school_classes ON school_classes.id = ranking.school_class_id
    WHERE ranking <= 3
    ```
 
 3. Znajdź drugą chronologicznie wystawioną ocenę z danego przedmiotu. Wyświetl w formacie przedmiot, ocena, data.
    ```sql
    SELECT name AS school_class, received_at, value FROM(
    SELECT school_class_id, value, received_at, DENSE_RANK() over (PARTITION BY school_class_id ORDER BY received_at) AS ord FROM student_notes
        ) notes_ordered
    JOIN school_classes ON school_class_id = school_classes.id
    WHERE ord = 2
    ```

## Data Manipulation Language

 1. Dodaj rekord do tabeli students dla ucznia o imieniu i nazwisku *Zbigniew Nowak* i dacie urodzenia *4 luty 1996*.
    ```sql
    INSERT INTO students(first_name, last_name, birthdate) VALUES ('Zbigniew', 'Nowak', '1996-02-04');
    ``` 
 2. Zaktualizuj rekord w tabeli students zmieniając nazwisko ucznia o id równym **2** na Woźniak.
    ```sql
    UPDATE students SET last_name='Woźniak' WHERE id=2;
    ```
 3. Zamień imię i nazwisko wszystkim uczniom urodzonym po 1997 roku.
    ```sql
    UPDATE students src, students trg
    SET trg.first_name = src.last_name,
        trg.last_name  = src.first_name
    WHERE src.id = trg.id AND YEAR(src.birthdate) > 1997;
    ```
 4. Zmień wszystkie nazwiska nauczycieli na pierwszą literę nazwiska oraz kropkę. Na przykład `Nowak` na `N.`.
    ```sql
    UPDATE teachers src, teachers trg
    SET trg.first_name = SUBSTR(src.first_name, 1, 1),
        trg.last_name  = SUBSTR(src.last_name, 1, 1)
    WHERE src.id = trg.id;
    ```
 5. Usuń z tabeli **teachers** nauczyciela o id 2. 
    Następnie usuń nauczyciela o id 6. 
    Sprawdź czy jest możliwe usunięcie rekordu, który jest kluczem obcym w innych tabelach.
    ```sql
    DELETE FROM teachers WHERE id = 2;
    DELETE FROM teachers WHERE id = 6;
    ```
 
 6. Spróbuj usunąć wszystkie rekordy z tabeli **student_notes**.
    ```sql
    TRUNCATE student_notes;
    ```
 7. Pobierz wszystkie imiona i nazwiska nauczycieli i dodaj je do tabeli **students**.
    Urodziny wpisz na stałe `1980-01-01` (trudniejsze: wygeneruj urodziny jako losową datę w wybranym przez siebie zakresie).
    ```sql
    INSERT INTO students(first_name, last_name, birthdate)
    SELECT first_name, last_name, DATE_ADD(DATE('1980-01-01'), INTERVAL ROUND(RAND() * 1000) DAY)
    FROM teachers;
    ```
 8. Wszystkich uczniów, którzy urodzili się przed 1 stycznia 1997 roku dodaj do tabeli **teachers**.

    ```sql
    INSERT INTO teachers(first_name, last_name) SELECT first_name, last_name FROM students
    WHERE birthdate < '1997-01-01'
    ```
    
## Data Definition Language oraz Data Control Language

 1. Stwórz nową bazę danych **shop**.
    ```sql
    CREATE DATABASE shop;
    ```
    
 2. Stwórz nową tabelę **orders**:
 
    | Kolumna          | Typ danych    |
    |------------------|:-------------:|
    |id                | Integer       |
    |order_number      | Varchar(255)  |
    |customer_name     | Varchar(1000) |
    |shipping_address  | Varchar(1000) |
    |sent_on           | DateTime      |
    |archived_on       | DateTime      |
  
    Dodaj przykładowe dane do tabeli **orders**:
    
    | order_number  | customer_name | shipping_address                 | sent_on             | archived_on         |
    |--------------:|:-------------:|:--------------------------------:|:-------------------:|:--------------------|
    | 100           |	Krzysiek    |  Jagiellońska 2, Częstochowa     | 2020-03-02 21:50:43 | 2020-03-04 21:50:55 |
    | 101           |	Anna 	    |  Zdrowa 44, Siemianowice Śląskie | 2020-02-01 21:51:40 |                     |

    ```sql
    CREATE TABLE orders(
        id INT AUTO_INCREMENT PRIMARY KEY,
        order_number VARCHAR(255) NOT NULL,
        customer_name VARCHAR(1000) NOT NULL,
        shipping_address VARCHAR(1000) NOT NULL,
        sent_on DATETIME NULL,
        archived_on DATETIME NULL 
    );
    ```
    
 3. Stwórz nową tabelę **items**:
 
    | Kolumna          | Typ danych      |
    |------------------|:---------------:|
    | id               | Integer         |
    | name             | Varchar(255)    |
    | price            | Decimal         |
   
    Dodaj przykładowe dane do tabeli **items**:
    
    | name            | price              |
    | --------------- |:------------------:|
    | Młotek          | 22.0               |
    | Suszarka        | 100.4              |
    | Długopis        | 99.4               |
    
    ```sql    
    CREATE TABLE items(
      id INT AUTO_INCREMENT PRIMARY KEY ,
      name VARCHAR(255) NOT NULL,
      price DECIMAL(10,2),
      order_id INT REFERENCES orders(id)
    );
    ```   
   
 4. Dodaj nową kolumnę typu **date** o nazwie **updated_on** dla tabeli **orders**.
    ```sql
    ALTER TABLE orders ADD COLUMN (
        updated_on DATETIME NULL
    );
    ```
 5. Dodaj nową kolumnę **created_on** dla tabeli **items** i dodaj domyślną wartość ustawiającą tą kolumnę podczas tworzenia przedmiotu.
    Zrób analogiczną operację dla tabeli **orders**.
    ```sql
    ALTER TABLE orders ADD COLUMN (
        created_on DATETIME DEFAULT current_timestamp
    );    
    ```
 6. Zmień nazwę tabeli **items** na **purchased_items**.
    ```sql
    ALTER TABLE items RENAME TO purchased_items;
    ```
 7. Zmień nazwę kolumn **created_on** w  **orders** na **ordered_on**.
    ```sql
    ALTER TABLE orders RENAME COLUMN created_on TO ordered_on;
    ```
 8. Dodaj nową kolumnę **shipping_country** do tabeli **orders** z domyślną wartością "Polska".
    ```sql
    ALTER TABLE orders ADD COLUMN (
        shipping_country VARCHAR(300) DEFAULT 'Polska'
    );
    ```
  9. Stwórz widok **active_orders** pozwalajacy zobaczyć numer zamówienia, nazwę klienta oraz adres wysyłki wszystkich zamówień, które które nie zostały jeszcze wysłane, ani zarchiwizowane.
          ```sql
          CREATE VIEW active_orders AS (
             SELECT * FROM orders WHERE sent_on IS NOT NULL AND archived_on IS NOT NULL
          );
          ```
 10. Stwórz widok **orders_summaries**, który pozwala zobaczyć numer zamówienia, nazwę klienta, adres wysyłki oraz łączną kwotę zamówienia, 
     zawierającą kolumn **customer_name**, **order_number**, **customer_name**, **total_price**.
     ```sql
     CREATE VIEW orders_summaries AS (
         SELECT customer_name, shipping_address, order_number, SUM(price) AS total_price
         FROM orders
                  JOIN purchased_items pi on orders.id = pi.order_id
         GROUP BY customer_name, shipping_address, order_number
     );
     ```  
 11. Dodaj trigger uaktualniający kolumnę **updated_on** zawsze gdy tabela **orders** jest edytowana.
    ```sql
    DELIMITER $$
    
    CREATE TRIGGER orders_update_trg BEFORE UPDATE ON orders
        FOR EACH ROW
    BEGIN
        SET new.updated_on = CURRENT_TIMESTAMP;
    END;
    
    $$
    ```
 12. Wykonaj zapytania:
      
     ```sql
     SELECT * FROM items WHERE name = 'Długopis';
     SELECT * FROM items WHERE name LIKE 'D%';
     ``` 
     
     Sprawdź plany zapytań. Stwórz indeks pozwalający łatwo wyszukiwać przedmioty po nazwie. Sprawdź jak zmieniły się plany zapytania.
     
     ```sql
     CREATE INDEX items_name_index ON items(name);
     ```
    
 13. Stwórz fukcję **days_passed** zwracająca ilość dni, jaka mineła od danej daty.
     ```sql
     CREATE FUNCTION daypassed(date DATE) RETURNS INT READS SQL DATA return DATEDIFF(current_date, date);
     ``` 
 14. Stwórz funkcję **brutto** zwracającą cenę z podatkiem vat 23%.
     ```sql
     CREATE FUNCTION brutto(price DECIMAL) RETURNS DOUBLE DETERMINISTIC return price * 1.23;
     ```
 15. Stwórz procedurę **calculate_archived_on** ustawiającą **achived_on** dla wszystkich zamówień starszych niż liczba dni podanych jako parametr wejściowy **threshold**.
     ```sql
     DELIMITER $$

     CREATE PROCEDURE calculate_archived_on(IN threshold INT)
     BEGIN
         UPDATE orders SET archived_on = current_date WHERE ordered_on < current_date - INTERVAL threshold DAY;
     END;

     DELIMITER ;
     ```
 16. Stwórz nową tabele **summary**, która będzie posiadała 3 kolumny: **year**, **month** oraz **total_orders_amount**. Kluczem głównym nie będzie klucz kompozytowy używający **year** oraz **month**. Stwórz procedurę **calculate_summary**, która uzupełnia tą tabelę używając danych z tabel **orders** obliczając łączną sumę kwot zamówień dla danego miesiaca.    
     ```sql
     CREATE TABLE summary(
                        month integer not null,
                        year integer not null,
                        total_orders_amount DECIMAL(10,2),
                        PRIMARY KEY(month, year)
     );

     DELIMITER $$

     CREATE PROCEDURE calculate_summary(IN year INTEGER, IN month INTEGER)
     BEGIN
         DECLARE sum DECIMAL(10,2);
         SELECT SUM(price) INTO sum FROM orders o JOIN purchased_items pi on o.id = pi.order_id WHERE year(o.ordered_on) = year AND month(o.ordered_on) = month;

         INSERT INTO summary(year, month, total_orders_amount) VALUES(year, month, sum);

     END;

     DELIMITER ;
     ```
    
 17.  Stwórz użytkowników bazy danych: **shop_user** mający pełny dostęp oraz **stats_user** który ma dostęp tylko do odczytu dla widoków.
 
      ```sql
      CREATE USER 'shop_user'@'localhost' IDENTIFIED BY 'pass';
      GRANT ALL PRIVILEGES ON shop.* TO shop_user; 
      
      CREATE USER 'stats_user'@'localhost' IDENTIFIED BY 'pass';
      GRANT SELECT ON shop.orders_summaries TO stats_user; 
      GRANT SELECT ON shop.active_orders TO stats_user; 
      ```

 
