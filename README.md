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

Aplikacja w Go na frameworku echo. Jeden endpoint, jedna funkcję proxy, która pobiera dane o pogodzie z zewnętrznego API. Zapytania do endpointu można wysyłać w jako GET lub POST.  

✓ | **3.0** Kontroler Pogody pozwala na pobieranie danych o pogodzie | [Commit](https://github.com/KwintaJ/Object-Design/commit/356c3fc516a6de0563fe6d77f5479f2b901483ef)  
✓ | **3.5** Model Pogoda wykorzystując gorm, a dane załadować z listy przy uruchomieniu | [Commit](https://github.com/KwintaJ/Object-Design/commit/d5b5a395c8872eaf5993ab2b2b22d47632c387f3)  
✓ | **4.0** Klasa proxy, która pobierze dane z serwisu zewnętrznego podczas zapytania do kontrolera | [Commit](https://github.com/KwintaJ/Object-Design/commit/7771712f9481fb82def3b4a2d186b0e6536bc207)  
✓ | **4.5** Pobrane dane z zewnątrz zapisywane do bazy danych | [Commit](https://github.com/KwintaJ/Object-Design/commit/969c31421f028c445de4a26a63e9494916e5f5ce)  
✗ | **5.0** Rozszerzenie endpointa na więcej niż jedną lokalizację zwracając JSONa
