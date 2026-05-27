# Jan Kwinta | Projektowanie obiektowe  

## Zadanie 1 | Paradygmaty  
✓ | **3.0** Procedura do generowania 50 losowych liczb od 0 do 100 | [Commit](https://github.com/KwintaJ/Object-Design/blob/33c513ee5341f9d18cada9ddb11ecaed09b93d56/Zadanie-1/3_0/simpleGenerator.pas)  
✓ | **3.5** Procedura do sortowania bąbelkowego liczb | [Commit](https://github.com/KwintaJ/Object-Design/blob/3611fe35e7d4903ab8a745d07913054ca2df9ec4/Zadanie-1/3_5/bubbleSort.pas)  
✓ | **4.0** Dodanie parametrów do procedury losującej określającymi zakres losowania: od, do, ile | [Commit](https://github.com/KwintaJ/Object-Design/commit/6c11f9810906e3f6cc912c26b743639a24169de5)  
✓ | **4.5** 5 testów jednostkowych testujące procedury | [Commit](https://github.com/KwintaJ/Object-Design/commit/5642b4e60cb7fce2e91614d06ff7343b3b68a8df)  
✓ | **5.0** Skrypt w bashu do uruchamiania aplikacji w Pascalu via docker | [Docker image](https://hub.docker.com/repository/docker/jankwinta/object-design-01-5.0/general) | [Commit](https://github.com/KwintaJ/Object-Design/tree/4521628ae761165dc150bd6112d729f14dd1783f/Zadanie-1/5_0)  

## Zadanie 2 | PHP  
Aplikacja webowa na bazie frameworka Symfony, baza danych SQLite. | [Screen recording](https://github.com/KwintaJ/Object-Design/blob/main/Zadanie-2/Screen-recording.mov)  

✓ | **3.0** Jeden model z kontrolerem z produktami, zgodnie z CRUD | [Commit](https://github.com/KwintaJ/Object-Design/tree/7bc6a7150ad227467985973ce121a2102e42d5c4/Zadanie-2/src)  
✓ | **3.5** Skrypty do testów endpointów via curl | [Commit](https://github.com/KwintaJ/Object-Design/commit/e22ff4418a60038a243bf4b1c3f03e9f52ec4b95)  
✓ | **4.0** Dwa dodatkowe kontrolery wraz z modelami | [Commit](https://github.com/KwintaJ/Object-Design/tree/076d52f9b6a886ab34338c923abb87d83847b8ec/Zadanie-2/src)  
✓ | **4.5** Widoki do wszystkich kontrolerów | [Commit](https://github.com/KwintaJ/Object-Design/commit/9af6410020e4335873e98b0ab4e52be9b20572e2)  
✓ | **5.0** Panel administracyjny | [Commit](https://github.com/KwintaJ/Object-Design/commit/43e7ea5059e780a4074ed9f3a1c928ae00800172)  
  
## Zadanie 3 | Kotlin  
Prosty serwis do autoryzacji, który symuluje autoryzację użytkownika za pomocą przesłanej nazwy użytkownika oraz hasła. Aplikacja w języku Kotlin zawiera jeden kontroler. Oparta na frameworku Spring Boot.  

✓ | **3.0** Jeden kontroler wraz z danymi wyświetlanymi z listy na endpoint’cie w formacie JSON | [Commit](https://github.com/KwintaJ/Object-Design/commit/abe5fd9e63497eb355bb0f1679d10583262d0e2d)  
✓ | **3.5** Klasa do autoryzacji (mock) jako Singleton w formie eager | [Commit](https://github.com/KwintaJ/Object-Design/commit/6d36a60919e0f7dd0867f5c3979ab35bd196222c)  
✓ | **4.0** Obsługa danych autoryzacji przekazywanych przez użytkownika | [Commit](https://github.com/KwintaJ/Object-Design/commit/175c5c7d438424843a68383fc8dae149652d3fb4)  
✓ | **4.5** Constructor injection singletonu do głównej klasy via @Autowired | [Commit](https://github.com/KwintaJ/Object-Design/commit/e33ced2f66953c9f6504793f6cbe058590292400)  
✓ | **5.0** Obok wersji Eager do wyboru wersja Singletona w wersji lazy | [Commit](https://github.com/KwintaJ/Object-Design/commit/43d8fdce5c11c702d8ac26a884b58ca6952d8a90)  

## Zadanie 4 | Go  

Aplikacja w Go na frameworku echo. Jeden endpoint, jedna funkcję proxy, która pobiera dane o pogodzie z zewnętrznego API. Zapytania do endpointu można wysyłać w jako GET lub POST. | [Screen recording](https://github.com/KwintaJ/Object-Design/blob/main/Zadanie-4/Screen%20Recording.mov)  

✓ | **3.0** Kontroler Pogody pozwala na pobieranie danych o pogodzie | [Commit](https://github.com/KwintaJ/Object-Design/commit/356c3fc516a6de0563fe6d77f5479f2b901483ef)  
✓ | **3.5** Model Pogoda wykorzystując gorm, a dane załadować z listy przy uruchomieniu | [Commit](https://github.com/KwintaJ/Object-Design/commit/d5b5a395c8872eaf5993ab2b2b22d47632c387f3)  
✓ | **4.0** Klasa proxy, która pobierze dane z serwisu zewnętrznego podczas zapytania do kontrolera | [Commit](https://github.com/KwintaJ/Object-Design/commit/7771712f9481fb82def3b4a2d186b0e6536bc207)  
✓ | **4.5** Pobrane dane z zewnątrz zapisywane do bazy danych | [Commit](https://github.com/KwintaJ/Object-Design/commit/969c31421f028c445de4a26a63e9494916e5f5ce)  
✓ | **5.0** Rozszerzenie endpointa na więcej niż jedną lokalizację zwracając JSONa | [Commit](https://github.com/KwintaJ/Object-Design/commit/b95f29cfe6653629cc87efc0b2c023c1d26d7bdf)

## Zadanie 5 | Wzorce behawioralne  

Aplikacja React | [Screen recording](https://github.com/KwintaJ/Object-Design/blob/main/Zadanie-5/Screen-recording.mov)  

✓ | **3.0** Komponenty Produkty oraz Płatności; komponent Produkty pobiera listę produktów z aplikacji serwerowej, komponent Płatności wysyła dane płatności do aplikacji serwerowej | [Commit](https://github.com/KwintaJ/Object-Design/commit/79d5ea44fc834c83c80def0cce727846f86e8f0f)  
✓ | **3.5** Komponent Koszyk wraz z osobnym widokiem; aplikacja umożliwia przechodzenie pomiędzy widokami przy użyciu routingu | [Commit](https://github.com/KwintaJ/Object-Design/commit/09e0b67437da9ad544355dfe391501cde7304605)  
✓ | **4.0** Dane pomiędzy komponentami, takimi jak Produkty, Koszyk i Płatności przekazywane z wykorzystaniem React hooks | [Commit](https://github.com/KwintaJ/Object-Design/commit/53b14cb886d7d8764c8960b02744425c6d0e25b9)  
✓ | **4.5** Uruchomienie aplikacji klienckiej oraz serwerowej w kontenerach Docker za pomocą docker-compose | [Commit](https://github.com/KwintaJ/Object-Design/commit/5c0681569eb960bf011e8beb2643887db6236cab)  
✓ | **5.0** Axios + CORS | [Commit](https://github.com/KwintaJ/Object-Design/commit/be73b72aa405a12f8c6f25119e5e73847e9b78d0)  

## Zadanie 6 | Code smells  

Sprawdzanie kodów projektów Kotlin (Zadanie 3), Go+JS (Zadanie 5).  

✓ | **3.0** Husky + lint-staged skonfigurowane uruchamianie lintowania przed commitem (Zadanie 5) | [Commit](https://github.com/KwintaJ/Object-Design/commit/8b193f94b9e49da3bd5ec9d6fde288271bcd3036)  
✓ | **3.5** Wyeliminowane wszystkie bugi w Sonarze (kod aplikacji klienckiej) | [Commit 1](https://github.com/KwintaJ/Object-Design/commit/81fc7d9ba072dc500e7e9319f4d74a5f00a1ac1d) | [Commit 2](https://github.com/KwintaJ/Object-Design/commit/48b7647dbb28e735f20215a650a752650cf1a27c) | [Commit 3](https://github.com/KwintaJ/Object-Design/commit/423cff417f2f5db6621ae6d2b650757c59228348) | [Commit 4](https://github.com/KwintaJ/Object-Design/commit/e837c7dde1067f1d7e06ba79918f0124a4afb3e5)  
✓ | **4.0** Przeskanowanie i naprawienie [projektu open source](https://github.com/KwintaJ/udara885-todo-app-fork) narzędziem CodeQL | [Commit](https://github.com/KwintaJ/udara885-todo-app-fork/commit/7083e6bd1e67cbc6a6c093c8e739b11107d59a45)  
✓ | **4.5** Wyeliminowane wszystkich code smells w Sonarze (kotlin, go, js) | [Commit 1](https://github.com/KwintaJ/Object-Design/commit/d63298118aa607bbf1c11f7d65f59c3c0b1011c3) | [Commit 2](https://github.com/KwintaJ/Object-Design/commit/448aee629590fb6c4eda14e14914068f89daa54f)  
✓ | **5.0** Skonfigurowane Github Actions z linterem oraz CodeQL | [Commit 1](https://github.com/KwintaJ/udara885-todo-app-fork/commit/8461a96a335f9e4e2f6114f17d15fe03dd358832) | [Commit 2](https://github.com/KwintaJ/udara885-todo-app-fork/commit/5b22b47af3345b922e68d5d61bef2225bb5c75fa)  

Badge Sonara:  
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=KwintaJ_Object-Design&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=KwintaJ_Object-Design)  
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=KwintaJ_Object-Design&metric=bugs)](https://sonarcloud.io/summary/new_code?id=KwintaJ_Object-Design)  
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=KwintaJ_Object-Design&metric=code_smells)](https://sonarcloud.io/summary/new_code?id=KwintaJ_Object-Design)  

## Zadanie 7 | Vapor  

Prosta aplikacja w Vaporze, wykorzystująca Leaf jako silnik szablonów i Fluent jako ORM. Trzy modele oraz CRUD dla każdego z nich, minimum jedna relacja. CRUD ma odzwierciedlenie w szablonach.  

✓ | **3.0** Kontroler wraz z modelem Produktów zgodny z CRUD w ORM Fluent | [Commit](https://github.com/KwintaJ/Object-Design/commit/5eb0ea6c6c0f033575a2a0cce71d83a74c95bcd5)  
✓ | **3.5** Szablony w Leaf | [Commit](https://github.com/KwintaJ/Object-Design/commit/2d41a8e4f0a2bd55527b43303436cebca922509b)  
✓ | **4.0** Drugi model oraz kontroler Kategorii wraz z relacją | [Commit](https://github.com/KwintaJ/Object-Design/commit/9d47977de64116cd0e6b6e0646dd03b250fe472f)  
✓ | **4.5** Redis do przechowywania danych | [Commit](https://github.com/KwintaJ/Object-Design/commit/f6962d7c6f93a71b98e016946b0dd6a30d809268)  
✗ | **5.0** Aplikacja na Heroku  

## Zadanie  8 | Testy  

Testowanie Kotlin, Python, Java, JS, Go, Scala w Selenium/Webdriver i Playwright  

✗ | **3.0** Testowanie formularza rejestracji użytkownika pod kątem walidacji pól obowiązkowych oraz zachowania aplikacji po wprowadzeniu niepoprawnego formatu adresu e-mail  
✗ | **3.5** Testowanie bezpieczeństwa typu Cross-Site Scripting (XSS), próbując wstrzyknąć złośliwy kod JavaScript w aplikacji z Reactem  
✗ | **4.0** Testowanie działania koszyka zakupowego przy jednoczesnym otwarciu aplikacji w kilku osobnych kartach tej samej przeglądarki, sprawdzając spójność stanów zamówienia (aplikacja z zadania z React'em)  
✗ | **4.5** Do zadania z React'a dodanie formularz logowania. Następnie przetestowanie podatności na ataki typu Cross-Site Request Forgery (CSRF), próbując wymusić nieautoryzowaną zmianę ustawień konta spreparowanym linkiem, podczas gdy użytkownik posiada aktywną sesję w innej karcie.  
✗ | **5.0** Stworzenie scenariusz End-to-End w Playwright (minimum 50 asercji)  
