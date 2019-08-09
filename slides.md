
## Bazy danych
![Relacyjne bazy danych](images/database.jpg)

---

##### Czym są relacyjne bazy danych?

Relacyjne bazy danych służą do przechowywania danych połączonych ze sobą relacjami. Charakterystyczne cechy baz danych to:

* Szybkie wyszukiwanie informacji
* Przechowywanie dużej ilości danych na małej powierzchni
* Prosta analiza zgromadzonych danych
* Przystępny dostęp i możliwość dostępu zdalnego
* Łatwe tworzenie kopii zapasowych
* Ułatwione zachowywanie spójności danych

---

##### CRUD

Skrót **CRUD** oznacza cztery podstawowe operacje wykonywane na
danych implementowane w aplikacjach bazodanowych
* **C – create** (tworzenie)
* **R – read** (odczyt)
* **U – update** (aktualizacja)
* **D – delete** (usuwanie)

---

#### Tabela

**Tabela** to wydzielony logicznie zbiór danych, zorganizowanych w formie zbioru składającego się z wierszy dzielonych na kolumny.

![Mail](images/table.png)

---

#### Relacja

**Relacja** to logiczne połączenie pomiędzy między tabelami.

![Mail](images/relation.png)

---

#### Klucz główny


Do jednoznacznej identyfikacji wierszy stosuje klucz główny (*ang.* **primary key**), czyli jedną z kolumn lub ich grupę, których wartości są unikatowe w całej tabeli (dzięki czemu jednoznacznie identyfikują wiersz).

---

#### Klucz obcy

Innym rodzajem klucza jest tzw. klucz obcy (*ang.* **foreign key**). Służy do wskazywania zależności pomiędzy danymi składowanymi w różnych tabelach. Na klucz obcy nałożony jest wymóg, że w tabeli wskazywanej musi istnieć wartość na którą wskazuje klucz. 

---

##### Typy danych SQL

Każda kolumna w tabeli musi posiadać określony typ:

* **Tekst** - CHAR, VARCHAR, BLOB, TEXT, ENUM, SET,...
* **Liczby całkowite** - BIT, TINYINT, BOOLEAN, SMALLINT, ...
* **Liczby zmiennoprzecinkowe** - DOUBLE, DECIMAL, ...
* **Data i czasu** - DATE, TIME, DATETIME, ...
* **Specjalne** - na przykład JSON

---

### **<span style="color:salmon">S</span>tructured <span style="color:salmon">Q</span>uery <span style="color:salmon">L</span>anguage**

Większość współczesnych relacyjnych baz danych korzysta z jakiejś wersji języka **SQL** pozwalającego wprowadzać zmiany w strukturze bazy danych, jak również zmiany danych w bazie i wybieranie informacji z bazy danych. 

Język ten opiera się na silniku bazy danych, który pozwala zadawać w języku **SQL** pewnego rodzaju pytania (kwerendy) i wyświetlać dane, które spełniają warunki zapytania. 

Zapytania **SQL** mogą także wykonywać operacje wstawiania danych, usuwania danych i ich aktualizacji. Język **SQL** zapewnia również zarządzanie bazą danych.

---

* **SQL** został stworzony w latach 70 w IBM.
* W roku 1986 została wydana pierwsza wersja standardu **ANSI-SQL**.
* Najnowsza wersja standardu to **SQL:2016**.

---

Podstawowe instrukcje to:

* **SHOW DATABASES** - wyświetla bazy danych na serwerze
* **USE [nazwa bazy danych]** - wybiera bazę danych
* **SHOW TABLES** - wyświetla tabele w wybranej bazie danych.
* **DESC [bazwa tabeli]** - wyświetla detale tabeli

---

## Data Query Language

---

Podstawowe zapytanie  **SQL** pozwala pobrać kolumny z danej tabeli za pomocą słów kluczowych `SELECT` i `FROM`:

```sql
SELECT [kolumny] FROM [tabela]
```

```sql
SELECT * FROM students
SELECT id, first_name FROM students
```
---

Możemy ograniczyć liczbę wyników za pomocą `LIMIT` oraz przesuwać punkt start za pomocą `OFFSET`.

```sql
SELECT * FROM [nazwa_tabeli] LIMIT [ilość_wierszy] OFFSET [punkt startu];
```

```sql
SELECT * FROM students LIMIT 5 OFFSET 5;
```

Możemy rówież wyświetlić tylko unikatowe wartości za pomocą `DISTINCT`.

```sql
SELECT DISTINCT first_name FROM students;
```

---

Aby nadać kolumnie inną nazwę (alias) używamy słowa kluczowego `AS` (można też je ominąć):

```sql
SELECT [nazwa_kolumn] AS [nowa_nazwa] FROM [nazwa_tabeli];
SELECT [nazwa_kolumn] [nowa_nazwa] FROM [nazwa_tabeli];

```

```sql
SELECT first_name AS imię FROM students;
SELECT first_name imię FROM students;
```

---

Aby ustalić kolejność wyników należy użyć słowa kluczowego `ORDER BY`:

```sql
SELECT * FROM [nazwa_tabeli] ORDER BY [nazwa_kolumny1, nazwa_kolumny2, ...];
```

```sql
SELECT * FROM students ORDER BY age, first_name;
```

---

###### Predykaty i filtrowanie danych
Pobierane dane możemy filtrować za pomocą słowa kluczowego `WHERE` do którego przekazujemy predykat:

* `=` i `<>` - operatory *równa się* i *różni się*. 
   ```sql
  SELECT * FROM students WHERE id = 9;
   ```
* `>`, `>=`, `<`, `<=` to operatory porównania.
   ```sql
  SELECT * FROM students age > 10;
   ```
* `IN` - operator sprawdzający czy wartość należy do zbioru.
   ```sql
  SELECT * FROM students WHERE name IN ('Jerzy', 'Kazimierz');
  ```

* `BETWEEN` sprawdzający czy wartość jest w zakresie.
 ```sql
 SELECT * FROM students WHERE age BETWEEN 15 AND 17;
 ```
 
---

* `LIKE` porównujący tekst z innym wyrażeniem tekstowym zawierającym znaki uniwersalne % (znak procenta), _ (znak podkreślenia)
   ```sql
  SELECT * FROM students WHERE name LIKE 'St_fan';
  SELECT * FROM students WHERE name LIKE 'Stefa%';
  SELECT * FROM students WHERE name LIKE '%efan';
  SELECT * FROM students WHERE name LIKE '%efa%';
   ```
Predykaty mogą być łączone za pomocą `OR` albo `AND`.
  ```sql
  SELECT * FROM students WHERE id = 9 OR id = 8;
  SELECT * FROM students WHERE first_name = 'Stefan' AND last_name= 'Bijak';
  ```
Możemy również negować predykaty za pomocą `NOT`.
  ```sql
 SELECT * FROM students WHERE id NOT BETWEEN 3 AND 6;
  ```
---
#### Funkcje SQL

Na kolumnach możemy wykonywać operacje używając funkcji:  

```sql
   SELECT [nazwa_funkcji(kolumna)] FROM [tabela];
```

```sql
   SELECT LENGTH(first_name) AS name_length FROM students;
```

---
Podstawowe funkcje związane z tekstem:

* **CONCAT(argument1, ...)** - łączy ze sobą łańcuchy tekstowe
* **LENGTH(argument)** - zwraca długość argumentu
* **SUBSTRING(argument,pozycja, długość)** zwraca argument począwszy od wskazanej pozycji o zadanej ilości znaków
* **LOWER(argument)** zwraca argument pisany małymi literami
* **UPPER(argument)** zwraca argument pisany dużymi literami
* **LPAD(argument, długość, znaki)** zwraca argument uzupełniony do lewej strony określonym ciągiem znaków
* **LTRIM(argument)** usuwa znaki spacji z lewej strony argumentu
* **RPAD(argument, długość, znaki)** zwraca argument uzupełniony do prawej strony określonym ciągiem znaków
* **RTRIM(argument)** usuwa znaki spacji z prawej strony argumentu

---

Podstawowe funkcje związane z datą i czasem:

* **CURRENT_DATE()** - zwraca bieżącą datę
* **CURRENT_TIME()** - zwraca bieżący czas
* **CURRENT_DATETIME()** albl **NOW()** - zwraca bieżącą datę z czasem
* **DATE(argument)** - zwraca datę z przekazanego tekstu
* **DATEDIFF(wyrażenie_1,wyrażenie_2)** - zwraca ilość dni pomiędzy datami przekazanymi jako argumenty funkcji
* **MONTH(data)** - pobiera miesiąc z przekazanego argumentu
* **YEAR(data)** - zwraca rok z przekazanego argumentu

---

i inne...

* **COALESCE(arg1, arg2, ...)** - zwraca pierwszy argument, który nie jest nullem
* **RAND()** - zwraca losową liczbę
* **SQRT()** - zwraca pierwiastek z liczby
---

#### Agregacje wyników

Wyniki możemy agregować za pomocą słowa kluczowego `GROUP BY` i funkcji agregującej:

* **COUNT(kolumna)** - liczy wyniki w grupie
* **SUM(kolumna)** - sumuje wyniki w grupie
* **MIN(kolumna)** - wyznacza minimalną wartość w grupie.
* **MAX(kolumna)** - wyznacza minimalną wartość w grupie.
* **AVG(kolumna)** - wyznacza średnią wartość w grupie.

---

```sql
SELECT [kolumna_grupująca1,kolumna_grupująca2, ...],[nazwa_funkcji(kolumna)] 
FROM [tabela] 
GROUP BY [kolumna_grupująca1, kolumna_grupująca2, ...]
```

```sql
SELECT year, AVG(value) AS avg_income 
FROM incomes 
GROUP BY year;
```
```sql
SELECT employee, year, AVG(value) AS avg_income 
FROM incomes 
GROUP BY employee, year;
```

---

##### Podzapytania
Podzapytanie to instrukcja **SELECT** zagnieżdżona w innej instrukcji SQL, która dostarcza dla tej
drugiej danych wejściowych.

* Podzapytanie **zagnieżdżone** występuje wtedy, gdy wynik wewnętrznego zapytania zostaje przekazany do zewnętrznego zapytania,
```sql
SELECT surname, salary
FROM employee
WHERE salary > (SELECT avg(salary) FROM employee)
```

---

* Podzapytanie **skorelowane** występuje, gdy zapytanie zewnętrzne pobiera wszystkie ewentualne wiersze wyniku,
  a następnie dla każdego wiersza zapytania zewnętrznego uruchamiane jest zapytanie wewnętrzne.

```sql
SELECT surname, salary
FROM employee e1
WHERE e1.salary > (SELECT avg(salary)
                   FROM employee e2
                   WHERE e2.dept_id = e1.dept_id)
```
---

#### Złączenia

Złączenia (ang. *joins* ) oraz unie (ang. *unions* ) pozwalają na horyzontalne lub wertykalne łączenie danych w określony sposób.

---

###### CROSS JOIN

```sql
SELECT [kolumny...]
FROM [tabela_1]
CROSS JOIN [tabela_2];
```

```sql
SELECT emp_no, first_name, last_name, dept_name
FROM employees 
CROSS JOIN departments
```

![CrossJoin](/images/cross_join.png)

---

###### INNER JOIN

```sql
SELECT [kolumny...] FROM [tabela_1]
JOIN [tabela_2]
ON [tabela_1.kolumna] = [tabela_2.kolumna];
```

```sql
SELECT e.emp_no, e.first_name,
e.last_name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_no = d.dept_no;
```

![InnerJoin](/images/join.png)

Note: Aliasy!
---

###### LEFT JOIN

```sql
SELECT [kolumny...] FROM [tabela_1]
LEFT JOIN [tabela_2]
ON [tabela_1.kolumna] = [tabela_2.kolumna];
```

```sql
SELECT e.emp_no, e.first_name,
e.last_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_no = d.dept_no;
```

![InnerJoin](/images/left_join.png)

---

###### RIGHT JOIN

```sql
SELECT [kolumny...] FROM [tabela_1]
RIGHT JOIN [tabela_2]
ON [tabela_1.kolumna] = [tabela_2.kolumna];
```

```sql
SELECT e.emp_no, e.first_name,
e.last_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_no = d.dept_no;
```

![InnerJoin](/images/right_join.png)
---

###### UNION

```sql
SELECT [kolumny...]
FROM [tabela1]
UNION
SELECT [kolumny...]
FROM [tabela2]
```

```sql
SELECT first_name, last_name
FROM employees
UNION
SELECT first_name, last_name
FROM external_employees;
```

![InnerJoin](/images/union.png)

---

###### UNION ALL

```sql
SELECT [kolumny...]
FROM [tabela1]
UNION ALL
SELECT [kolumny...]
FROM [tabela2]
```

```sql
SELECT first_name, last_name
FROM employees
UNION ALL
SELECT first_name, last_name
FROM external_employees;
```

![InnerJoin](/images/unionall.png)

---

## Data Manipulation Language

---

##### Dodawanie danych

```sql
INSERT INTO [nazwa_tabeli]([kolumny...]) VALUES ([wartości...])
```
```sql
INSERT INTO department(id, name, city) VALUES(10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO department VALUES(11, 'LEGAL', 'LOS ANGELES');

```

Możemy też wykonywać `insert` za pomocą danych zwróconych przez zapytanie:

```sql
INSERT INTO department SELECT DEPTNO, DNAME, LOC FROM migrated_department;
```

---

##### Uaktualnianie danych

```sql
UPDATE [nazwa tabeli]
SET [nazwa_kolumny1]=[wartość1], [nazwa_kolumny2]=[wartość2], ...
WHERE [predykat]
```
```sql
UPDATE department
SET dept_name = ’Sales’,
WHERE dept_name = ’Finance’;
```

---

##### Usuwanie danych:

Aby usunąć konkretne dane używamy `DELETE`:

```sql
DELETE FROM students WHERE id = 9
```

`TRUNCATE` usuwa wszystkie dane z tabeli i resetuje autoinkrementujące się wartości/sekwencje.

```
TRUNCATE TABLE students;
```

Note: Truncate kasuje też sekwencje, delete będzie wymagać WHERE
---

## Data definition language

---

##### Zarządzanie bazami danych

Stworzenie nowej bazy danych:

```sql
CREATE DATABASE {IF NOT EXISTS} [nazwa_bazy_danych];
```

Usunięcie istniejącej bazy danych:

```sql
DROP DATABASE {IF EXISTS} [nazwa_bazy_danych]
```

---

#### Tworzenie i usuwanie tabeli

Tabelę tworzymy przy pomocy `CREATE TABLE`.

```sql
CREATE TABLE [nazwa] ([definicje kolumn] [definicje kluczy])
```

```sql
CREATE TABLE employee (
  EMPNO SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ENAME VARCHAR(40) NOT NULL,
  JOB VARCHAR(20) NOT NULL,
  HIREDATE date,
  SAL DECIMAL(7,2),
  DEPTNO SMALLINT(5) UNSIGNED,
  PRIMARY KEY (EMPNO),
  FOREIGN KEY(DEPTNO) REFERENCES department (DEPTNO)
);
```

Tabelę możemy usunąć przy pomocy `DROP`.

```sql
DROP TABLE employee;
```

---

#### Uaktualnianie tabeli

```sql
ALTER TABLE [nazwa] [operacja];
```

```sql
ALTER TABLE department ADD DESCRIPTION VARCHAR(100);
```

```sql
ALTER TABLE department MODIFY DESCRIPTION VARCHAR(200);
```

```sql
ALTER TABLE department RENAME COLUMN DESCRIPTION TO DESCR;
```

```sql
ALTER TABLE department DROP COLUMN DESCR;
```

---

#### Widoki

**Widok** (zwany również wirtualną tabelą, ang. *view*) składa się ze zbioru wierszy
zwracanych w wyniku wykonania określonego zapytania SQL. Widok **nie stanowi kopii danych** reprezentowanych przez zapytanie.

* Widoki mogą ukrywajać złożone złączenia pobierające danych z kilku tabel
* Umożliwiają ograniczenia dostępu do kolumn (np. ukrywanie wysokości pensji)

**Widok zmaterializowany ** (ang. *materialized view*) **tworzy kopię danych** z zapytania wykorzystanego do jego stworzenia.
Przy każdej zmianie tabeli źródłowych widok jest uaktualniany.

---
Widok tworzymy zapytaniem:
```sql
CREATE {MATERIALIZED} VIEW OR REPLACE [nazwa_widoku] ([kolumny])
AS SELECT [zapytanie];
```

Z widoku korzystamy jak z tabeli:
```sql
SELECT [kolumny] FROM [widok];
```

Aby usunąć widok, używamy `DROP`:
```sql
DROP VIEW [widok];
```
---

##### Wyzwalacze
**Wyzwalacz** (ang. *trigger*) to procedura, która jest wykonywana w odpowiedzi na zajście w bazie danych określonych zdarzeń, takich jak:

* wstawianie danych (**INSERT**)
* modyfikowanie danych (**UPDATE**)
* usuwanie danych z tabel (**DELETE**)

Zdarzenia te mogą być wykonywane bezpośrednio przed operacją lub tuż po niej.

---

##### Wyzwalacze możemy stosować do:

* weryfikacji danych przed zapisem w bazie
* automatyzacja operacji (jak wstawienie daty ostatniej modyfikacji)

---
Wyzwalacz dodajemy używając `CREATE TRIGGER`:
```sql
CREATE TRIGGER OR REPLACE [nazwa_wyzwalacza]
{ BEFORE | AFTER }
{ INSERT | UPDATE | DELETE }
ON [nazwa_tabeli]
FOR EACH ROW
[instrukcja/instrukcje_do_wykonania]
```
Jeśli wyzwalacz wykonuje więcej niż jedną instrukcje umieszcza się te instrukcje pomiędzy słowami kluczowym **BEGIN** i **END**.

Możemy też usunąć istniejący wyzwalacz:
```sql
DROP TRIGGER [nazwa_wyzwalacza];
```
---

```sql
CREATE TRIGGER check_amount
   AFTER UPDATE OF account
      ON employees
   BEGIN
      IF NEW.amount < 0 THEN
         SET NEW.amount = OLD.amount;
      ELSEIF NEW.amount > 100 THEN
         SET NEW.amount = 100;
      END IF;
END;
```

```sql
DROP check_amount;
```

---

#### Indeksy

Indeksy to dodatkowe struktury dazy danych definiowane dla konkretnych kolumn.

* Indeksy zajmują miejsce na dysku.
* Przyspieszają wyszukiwanie danych.
* Przyspieszają sortowanie danych.
* Spowalniają aktualizację danych w kolumnie.

---

###### Tablice hashy

* Są bardzo szybkie.
* Mogą działąć tylko na operatorze równości.

<br/>

###### Zrównoważone drzewa binarne

* Jest to domyślna struktura dla indeksu w większości przypadków.
* Pozwala wyszukiwać dane w czasie logarytniczmnym,
* Pozawala wyszukiwać dane używając operatorów porównania.

---

###### Tworzenie indeksów

```sql
CREATE {UNIQUE|FULLTEXT} INDEX [nazwa_indeksu] ON [kolumn] {USING BTREE};
```

```sql
CREATE  INDEX autid ON newauthor(aut_id);
CREATE  UNIQUE INDEX newautid ON newauthor(aut_id);
CREATE  UNIQUE INDEX newautid ON newauthor(aut_id) USING BTREE;
```

```sql
DROP INDEX [nazwa_indeksu] ON [nazwa_tabeli];
```

Note: SELECT SQL_NO_CACHE * FROM students WHERE first_name LIKE '%yna';
---

##### Procedury

```sql
CREATE PROCEDURE [nazwa_procedury] ([parametr[, ...]])
[kod procedury]
```

```sql
DROP PROCEDURE [nazwa_procedury];
```

```sql
CREATE PROCEDURE get_data(IN product_number CHAR(8), OUT count INT)
SELECT COUNT(*) FROM products WHERE product = product_number INTO count;
```

```sql
CALL get_data();
SELECT @count;
```

---

### Funkcje

```sql
CREATE FUNCTION [nazwa_funkcji] ([parametr[, ...]]) RETURNS [typ] [cechy, ...]
[kod_funkcji]
```

```sql
DROP FUNCTION [nazwa_funkcji];
```

---

## Data control language

---

##### Zarządzanie użytkownika i uprawnieniami

Tworzenie nowego użytkownika:
```sql
CREATE USER 'user'@'localhost' IDENTIFIED BY 'pass';
CREATE USER 'user'@'192.168.1.204' IDENTIFIED BY 'pass';
```

Usuwanie użytkownika:

```sql
DROP USER użytkownik;
```
---

Nadanie uprawnień:
```sql
GRANT [rodzaj_uprawnienia] ON [typ_obiektu] TO [uzytkownik];
```
Przeładowania uprawnień:

```sql
FLUSH PRIVILEGES;
```

Odbieranie uprawnień:
```sql
REVOKE [rodzaj_uprawnienia] ON [typ_obiektu] FROM [uzytkownik];
```

```sql
CREATE USER 'james'@'localhost' IDENTIFIED BY 'bond';
GRANT SELECT, INSERT, UPDATE ON employees.department TO james;
GRANT SELECT(name), UPDATE(job) ON employees.employee TO james@localhost;
GRANT ALL PRIVILEGES ON departments.* TO james;
REVOKE INSERT ON employees.dept FROM john;
```

---
##### Rodzaje uprawnień

* **SELECT** - odczyt danych z bazy
* **INSERT** - dodawanie rekordów do bazy danych
* **DELETE** - usuwanie rekordów z bazy danych
* **UPDATE** - modyfikowanie istniejących rekordów
* **CREATE** - tworzenie baz danych i tabel
* **DROP** - usuwanie baz danych i tabel
* **ALTER** - zmiana struktury tabel
* **GRANT** - przyznawanie uprawnień
* **ALL PRIVILEGES** – wszystko powyższe

---

### Normalizacja bazy danych

**Normalizacja** to proces organizowania danych w bazie danych. Obejmuje to tworzenie tabel i ustanawianie relacji między tymi tabelami zgodnie z regułami opracowanymi w celu zarówno ochrony danych, jak i zapewnienia większej elastyczności bazy danych przez wyeliminowanie nadmiarowości i niespójnych zależności.


---

#### Pierwsza postać normalna 1NF

Tabela jest w pierwszej postaci normalnej gdy pojedyncze pole tabeli zawiera informacje elementarną.

![1NF](images/1NF.png)

---

### Druga postać normalna 2NF

Tabela jest w drugiej postaci normalnej jeśli przechowuje dane dotyczące tylko jednej klasy obiektów.

![1NF](images/2NF.png)

---

### Trzecia postać normalna 3NF


W trzeciej postaci normalnej żaden atrybut nie będący częścią klucza nie zależy od innego atrybutu nie będącego częścią klucza.

![1NF](images/3NF.png)

---

##### Transakcje

**Transakcja** to zbiór operacji wykonywanych na bazie danych traktowanych jako jedna całość.

Transakcje uznaje się za zakończoną pomyślnie jeśli udało się prawidłowo
wykonać **wszystkie** wchodzące w jej skład operacje.
Jeśli którakolwiek z operacji zakończyła się niepowodzeniem, to całą transakcję
uznaje się za wykonaną nieprawidłowo.

Poprawna transakcja jest **zatwierdzana** w bazie danych (ang.&nbsp;*committed*),
a wprowadzone przez nią zmiany są widoczne dla innych procesów bazy danych.
Niepoprawna transakcja natomiast jest wycofywana (ang. *rolled-back*),
a wszystkie wprowadzone przez nią zmiany są anulowane.

---

* **Niepodzielnosć** (ang. *atomicity*) oznacza, że wszystkie operacje wchodzące w skład transakcji muszą zostać
wykonane poprawnie. W przeciwnym przypadku wszyskie operacje zostaną wycofane.
* **Spójność** (ang. *consistency*) Jeżeli nie powiedzie się zmiana stanu bazy danych to 
wraca ona do stanu sprzed rozpoczęcia transakcji (stanu spójnego).
* **Izolacja** (ang. *isolation*) oznacza, że wszystkie operacje wykonywane w ramach jednej 
transakcji muszą zostać odseparowane od reszty systemu aż do zatwierdzenia transakcji.
* **Trwałość** (ang. *durability*) oznacza, że  zatwierdzane dane muszą być zapisane w sposób
trwały, tak aby w przypadku awarii istniała możliwość przywrócenia zawartości bazy do prawidłowego stanu.

---

Standard **SQL-92** definiuje następujące cztery poziomu izolacji transakcji:
* **read uncommited** - transakcja może czytać niezatwierdzone dane czyli dane zmienione przez inną transakcję, która jest dalej wykonywana.
* **Read commited** - transakcja nie może czytać niezatwierdzonych danych. Dane aktualnie zmieniane przez inne transakcje nie mogą być odczytywane.
* **Repetable read** - transakcja nie może zmieniać danych odczytywanych przez inną transakcję.
* **Serializable** -transakcja ma wyłączność na odczyt i aktualizację danych. Inne transakcje nie mogą ani odczytywać, ani zapisywać tych samych
danych. Transakcja blokuje przetwarzany zakres wierszy aż do momentu jej zakończenia.

---

<div style="display: flex; justify-content: center; align-items: center;">
    ![Mail](images/mail.png)&nbsp;&nbsp;&nbsp;[krzysztof.atlasik@pm.me](mailto:krzysztof.atlasik@pm.me)
</div>
