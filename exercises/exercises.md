# Instalacja

 1. Dodaj [datasource](datasource.md) dla użytkownika root.
 2. Zainstaluj skrypt [init.sql](../db_scripts/init.sql). 
 3. Dodaj następny datasource dla następujących danych:
   
   |Pole     |Wartość                              |
   |:-------:|:-----------------------------------:|
   |username |school_user                          |
   |password |pass                                 |
   |database |school                               | 
   |URL      |jdbc:mysql://localhost:3306/school   | 
   
 4. Zainstaluj [data.sql](../db_scripts/data.sql) dla datasource użytkownika **school_user**.

# Struktura danych

![struktura](../images/structure.png)

# Zadania

## Data Query Language

### Pobieranie danych
 
 1. Pobierz wszyskie dane z tabeli students.
 2. Wyszukaj tylko imiona i nazwiska uczniów w tabeli students.
 3. Wyszukaj id oraz imiona i nazwiska nauczycieli w tabeli **teachers**.
 4. Wyszukaj nazwiska i imiona nauczycieli w tabeli **teachers** oraz posortuj wyniki alfabetycznie po nazwisku i imieniu.
 5. Wyszukaj imiona, nazwiska i datę urodzenia uczniów w tabeli **students** i posortuj wyniki narastająco po dacie urodzenia.
 6. Znajdź 5 najlepszych ocen i daty ich otrzymania z tabeli **student_notes**.
 7. Znajdź kolejne 5 najlepszych ocen i daty ich otrzymania z tabeli **student_notes**.
 8. Znajdź 5 najgorszych ocen i daty ich otrzymania z tabeli **student_notes**.
   
### Filtrowanie danych

 1. Wyszukaj dane w tabeli **students** ucznia, którego id to 3.
 2. Wyszukaj dane w tabeli **students**, tak aby pobrać tylko uczniów, których imię to Szymon.
 3. Wyszukaj dane w tabeli **students**, tak aby pobrać tylko uczniów, których imię to Szymon albo Krystyna.
 4. Wyszukaj dane w tabeli **students**, tak aby pobrać tylko uczniów urodzonych przed 1 stycznia 1999 roku.
 5. Wyszukaj dane w tabeli **students**, tak aby pobrać tylko uczniów urodzonych przed 1 stycznia 1999 roku, ale po 1 stycznia 1998 roku.
 6. Znajdź imiona 3 nastarszych uczniów w tabeli **students** urodzonych po 1997 roku.
 7. Znajdź uczniów, których nazwiska zaczynają się do *Ko*.
 8. Znajdź uczniów, których nazwiska kończą się się do *ski*.
 9. Znajdź uczniów, których nazwiska zawierają *wal*. 
 
### Funkcje  
 
 1. Zwróć imiona i nazwiska uczniów jako jedną kolumnę o nazwie **name** z tabeli **students**.
 2. Zwróć inicjały uczniów jako kolumnę **shortcut**.
 3. Zwróć całe imiona nauczycieli napisane dużymi literami.
 4. Zwróć imię, nazwisko i rok urodzenia danego ucznia.
 5. Zwróć bieżącą datę.
 6. Stwórz zapytanie symulujące rzut kostką sześciościenną.
 7. Zwróć ilość dni do końca 2020 roku.
 8. Zwróć oceny uczniów razem z ilością dni jako upłynęła od ich otrzymania.
 9. Zwróć nazwę oraz opis przedmiotu z tabeli **school_classes**. Jeżeli nie istnieje opis to wyświetl *"brak opisu"*.
 10. Pobierz wartość oraz datę otrzymania oceny, ale jeżeli ocena została wystawiona przed 1 czerwca 2019,
        to przyjmij tą datę.
 11. Pobierz oceny i zastąp oceny 1,2 napisem `niska`, 3,4 `średnia` oraz 5,6 `wysoka`.
 12. Stwórz zapytanie zwracające imię i nazwisko 3 losowych uczniów.
            

### Agregacje
 1. Zwróć średni wiek uczniów liczony w latach.
 2. Policz wszystkich uczniów.
 3. Zwróć ilość wszystkich ocen (tabela **student_notes**) według stopni w kolejności od najlepszej.
 4. Zwróć ilość ocen w tabeli **student_notes** według miesięcy (bez względu na rok) w kolejności od stycznia.
 5. Znajdź długość najkrótszego nazwiska ucznia.
 6. Wyznacz najlepszą i najgorszą ocenę wystawioną w danym miesiącu.
 7. Wyznacz średnią ocenę wystawioną w danym miesiącu. Nie bierz pod uwagę ocen 1 oraz 6. Odrzuć średnie 
    poniżej 3.5. Sformatuj średnią, tak by miałą tylko 2 miejsca po przecinku.
 
### Podzapytania
 1. Znajdź imię i nazwisko uczniów, których wiek jest powyżej przeciętnego wieku.
 2. Znajdź daty wystawienia i  wartości ocen, które zostały wystawione pół roku później niż pierwsza ocena.
 3. Znajdź przedmioty, których średnia ocen jest wyższa niż średnia ocen dla wszystkich przedmiotów.
 4. Wyświetl uczniów, którzy otrzymali przynajmniej jedną szóstkę.
 5. Wyświetl przedmioty szkolne, których uczniowie dostali co najmniej 2 szóstki.
 6. Wyznacz różnicę między majlepszą, a najgorszą średnią ocen ucznia.
 7. Znajdź uczniów, którzy ze wszystkich przedmiotów dostali średnią powyżej 3.5.
 8. Znajdź uczniów, którzy przynajmniej z jednego przedmiotu dostatli średnią poniżej 2.5.
 
### Złączenia
 1. Wyświetl wszystkich nauczycieli oraz klasy, których uczą. Jeżeli nie uczą żadnej klasy, to wyświetl *"brak"*.
    Zwróć kolumny z imieniem i nazwiskiem oraz z nazwą przedmiotu.
 2. Wyświetl listę  uczniów razem z nazwami przedmiotów, których się uczą oraz nauczycieli uczących tych przedmiotów.
    Może występować wiele wierszy na ucznia.
    Nawet jeżeli uczeń nie uczy się w żadnej klasie powienien zostać wyświetlony. 
 3. Wyświetl listę uczniów wzraz z ocenami, datami otrzymania tych ocen oraz przedmiotami na których zostały otrzymane. 
    Posortuje dane alfebetycznie po imionach uczniów, a potem chronologicznie od najstarszej otrzymanej oceny. 
    Dodatkowo wyświetl ocenę jako ilość gwiazdek, na przykład `3` -> `***`.
    Może występować wiele wierszy na ucznia.
 4. Wyświetl listę nauczycieli wraz z listą wystawionych przez nich ocen wraz z datami. 
    Posortuj po nazwisku nauczyciela alfabetycznie, a potem od nastarszej oceny.
    Może występować wiele wierszy na nauczyciela. 
    Nauczyciel powienien występować na liście nawet jeżeli nie wystawił żadnej oceny.
 5. Stwórz listę meczów ligi tenisa stołowego pomiędzy uczniami w formacie każdy z każdym.
 6. Znajdź najlepszą ocenę jaką dostał uczeń. Zwróć dwie kolumny: uczeń i ocena. Jeżeli uczeń nie dostał żadnej oceny wyświetl *---*.
 7. Wyznacz średnią ocen każdego ucznia. Zaokrąglij średnią do jednego miejsca po przecinku. Wyświetl dane w formacie
    imię i nazwisko ucznia, średnia ocen.
 8. Wyznacz średnią ocen każdego ucznia, ale wyświetl tylko te wiersze w których średnia jest powyżej 3.5.
    Wyświetl dane w formacie imię i nazwisko ucznia, średnia ocen. Zaokrąglij średnią do jednego miejsca po przecinku.
 9. Znajdź uczniów których średnia ocen jest poniżej przeciętnej.
 10. Wyświetl listę przedmiotów z następującymi kolumnami: nazwa, opis (w przypadku braku opisu wyświetl *"---"*),
    ilość uczniów która uczęszcza na dany przedmiot, nauczyciel, który uczy danego przedmiotu, najlepsza i najgorsza ocena.
 11. Wyznacz ile ocen wystawił dany nauczyciel. Każdy nauczyciel powienien zostać wyświetlony, nawet jeżeli nie wystawił ocen.
 12. Wyświetl średnią uczniów osobno dla każdego przedmiotu w formacie uczeń (imię i nazwisko, przedmiot, średnia).
 13. Wyświetl średnią uczniów w formacie uczeń (imię i nazwisko, przedmiot, średnia).
     Średnią oblicz metodą średniej ważonej: matematyka 2, fizyka i chemia 1.5, WOS 1.
 14. Wyświetl imiona oraz nazwiska uczniów oraz najlepszą ocenę danego ucznia według przedmiotu i kiedy ją otrzymał. Jeżeli uczeń
        otrzymał najlepszą ocenę wielokrotnie to wyświetl wiele wierszy. Wyświetl też uczniów bez ocen. 
 15. Wyświetl najlepszego ucznia z danego przedmiotu według średniej. Kolumny: przedmiot, imię, nazwisko.
 16. Wyświetl nauczycieli oraz wszystkich uczniów, których uczą jako listę. Do zgrupowania uczniów użyć funkcji `GROUP_CONCAT`.
 17. Wyświetl najlepszego ucznia danego miesiąca według średniej. Kolumny: miesiąc, imię, nazwisko, średnia. 
    Miesiące, które nie mają ocen nie muszą być wyświetlane.   

### Unie
 1. Zwróć listę imion i nazwisk uczniów i nauczycieli. Kolumny nazwij **imię** i **nazwisko**.
 2. Zwróć listę nazwisk uczniów i nauczycieli  w jednej kolumnie a w drugiej to jak często występują.
 3. Stwórz listę pierwszych dni miesiąca od 1 stycznia 2010 do 1 stycznia 2020.
 4. Stwórz ranking zawierający najlepszą ocenę oraz ucznia który ją uzyskał według miesiąca. Nawet jeżeli dla danego
     miesiąca nie ma żadnych ocen to miesiąc powinien zostać wyświetlony.
 5. Narysuj choinkę:   
    ``` 
             **         
            ****        
           ******       
          ********      
         **********     
             **         
            ****        
           ******       
          ********      
         **********     
             **         
            ****        
           ******       
          ********      
         **********
    ```

### Window functions 
 1. Oblicz średnią każdego ucznia. Wyświetl rożnicę między średnią danego ucznia, a następnego. Wyświetl imię,
    nazwisko, średnią i różnicę.
 2. Stwórz ranking trzech pierwszych uczniów z najwyższą średnią według przedmiotu.
 3. Znajdź drugą chronologicznie wystawioną ocenę z danego przedmiotu. Wyświetl w formacie przedmiot, ocena, data.

## Data Manipulation Language

 1. Dodaj rekord  do tabeli **students**. 
 2. Zaktualizuj rekord w tabeli **students** zmieniając imię jednego ucznia.
 3. Zamień imię i nazwisko wszystkim uczniom urodzonym po 1997 roku.
 4. Zmień wszystkie nazwiska nauczycieli na pierwszą literę nazwiska oraz kropkę. Na przykład `Nowak` na `N.`.
 5. Usuń z tabeli **teachers** nauczyciela o id 2. 
    Następnie usuń nauczyciela o id 6. 
    Sprawdź czy jest możliwe usunięcie rekordu, który jest kluczem obcym w innych tabelach.
 6. Spróbuj usunąć wszystkie rekordy z tabeli **student_notes**.
 7. Pobierz wszystkie imiona i nazwiska nauczycieli i dodaj je do tabeli **students**.
    Urodziny wpisz na stałe `1980-01-01` (trudniejsze: wygeneruj urodziny jako losową datę w wybranym przez siebie zakresie).
 8. Wszystkich uczniów, którzy urodzili się przed 1 stycznia 1997 roku dodaj do tabeli **teachers**.

## Data Definition Language oraz Data Control Language

 1. Stwórz nową bazę danych **shop**.
 2. Stwórz nową tabelę **orders**:
 
   | Kolumna          | Typ danych |
   |------------------|:----------:|
   |id                | Integer    |
   |order_number      | Varchar    |
   |purchased_item_id | Integer    |
   |customer_name     | Varchar    |
   |shipping_address  | Varchar    |
   |sent_on           | DateTime   |
   |archived_on       | DateTime   |
  
   Dodaj przykładowe dane do tabeli **orders**.

   ```sql
   CREATE TABLE orders(
      id INT AUTO_INCREMENT PRIMARY KEY,
      order_number VARCHAR(255) NOT NULL,
      customer_name VARCHAR(1000) NOT NULL,
      shipping_address TEXT NOT NULL,
      sent_on DATE NOT NULL,
      archived_on DATE NULL
   );
   ```
 3. Stwórz nową tabelę **items**:
 
   | Kolumna          | Typ danych |
   |------------------|:----------:|
   | id               | Integer    |
   | name             | Varchar    |
   | price            | Decimal    |
   
   Dodaj przykładowe dane do tabeli **items**.

   ```sql
   CREATE TABLE items(
      id INT AUTO_INCREMENT PRIMARY KEY ,
      name VARCHAR(255) NOT NULL,
      price DECIMAL(10,2),
      order_id INT REFERENCES orders(id)
   );
   ```
    
 4. Dodaj nową kolumnę typu **date** o nazwie **updated_on** dla tabeli **orders**.
 5. Dodaj trigger uaktualniający kolumnę **updated_on** zawsze gdy tabela **orders** jest edytowana.
   ```sql
   CREATE TRIGGER orders_update_trg BEFORE UPDATE ON orders
       FOR EACH ROW
   BEGIN
        new.updated_on = CURRENT_TIMESTAMP
   END;
   ```
 6. Dodaj nową kolumnę **created_on** dla tabeli **items** i ustaw domyślną wartość na bieżący czas.
    Zrób analogiczną operację dla tabeli **orders**.
 7. Zmień nazwę tabeli **items** na **purchased_items**.
 8. Zmień nazwę kolumn **created_on** w  **orders** na **ordered_on**.
 9. Dodaj nową kolumnę **shipping_country** do tabeli **orders** z domyślną wartością "Polska".
 10. Stwórz indeks pozwalający łatwo wyszukiwać przedmioty po nazwie.
 11. Stwórz fukcję `dayspassed` zwracająca ilość dni od kiedy przedmiot został zamówiony.
 12. Stwórz funkcję `initcap` powodującą, że każde słowo zaczyna się od dużej litery, a reszta jego liter staje się mała.
 13. Stwórz procedurę ustawiającą **achived_on** dla wszystkich zamówień starszych od 90 dni.
 14. Stwórz procedurę drukującą na standardowe wyjście listę etykiet z adresem w formacie: **{order_number}-{customer_name}-{shipping_address}**.
 15. Stwórz procedurę wyszukująca zamówienia wysłane w ciągu 24 godzin.
 16. Stwórz widok pozwalajacy zobaczyć wszystkie zamówienia, które nie zostały jeszcze wysłane, ani zarchiwizowane.
 17. Stwórz zmaterializowany widok, który pozwala zobaczyć ile razy został zamówiony dany przedmiot.
 18. Stwórz użytkowników bazy danych: **admin** mający pełny dostęp oraz **stats** który ma dostęp tylko do odczytu dla widoków.

 
