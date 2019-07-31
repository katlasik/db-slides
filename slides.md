
## Bazy danych
![Relacyjne bazy danych](images/database.jpg)

---

##### Czym są relacyjne bazy danych?

---

### **<span style="color:salmon">S</span>tructured <span style="color:salmon">Q</span>uery <span style="color:salmon">L</span>anguage**

---

id | first_name | last_name    | birthdate
---|------------|--------------|-----------
1  | Szymon     | Kowalski     | 1999-02-03
2  | Krystian   | Nowak        | 1999-02-03
3  | Krystyna   | Kowal        | 1996-03-11
4  | Błażej     | Rudnicki     | 1998-12-03

---

* **SQL** został stworzony w latach 70 w IBM.
* W roku 1986 została wydana pierwsza wersja standardu **ANSI-SQL**.
* Najnowsza wersja standardu to **SQL:2016**.

---

SELECT <span class="crimson">*</span> FROM <span class="crimson">students</span></span>

SELECT <span class="crimson">id, first_name</span> FROM <span class="crimson">students</span></span>

---

SELECT * FROM students <span class="crimson">WHERE id = 9</span>

---

Do jednoznacznej identyfikacji wierszy stosuje klucz główny (ang. primary key), czyli jedną z kolumn lub ich grupę, których wartości są unikatowe w całej tabeli (dzięki czemu jednoznacznie identyfikują wiersz).

---

Tabela to wydzielony logicznie zbiór danych, zorganizowanych w formie tabeli składającej się z wierszy dzielonych na kolumny


---

### Czym są indeksy bazy danych?

Indeksy to dodatkowe strukty dazy danych definiowane dla konkretnych kolumn
poprawiające szybkość zapytań, które są o oparte o dane występujące w tej kolumnie.

---

##### Predykaty dostępne w *SQL* to:

`=`, `<>`, `>`, `>=`, `<`, `<=`, `IN`, `BETWEEN`, `LIKE`, `IS NULL` oraz `IS NOT NULL`

Predykaty mogą być łączone za pomocą `OR` albo `AND`.

---

##### Tablice hashy

* Są bardzo szybkie.
* Mogą działąć tylko na operatorze równości.

<br/>

##### Zrównoważone drzewa binarne

* Jest to domyślna struktura dla indeksu w większości przypadków.
* Pozwala wyszukiwać dane w czasie logarytniczmnym,
* Pozawala wyszukiwać dane używając operatorów porównania.

---

<div style="display: flex; justify-content: center; align-items: center;">
    ![Mail](images/mail.png)&nbsp;&nbsp;&nbsp;[krzysztof.atlasik@pm.me](mailto:krzysztof.atlasik@pm.me)
</div>
