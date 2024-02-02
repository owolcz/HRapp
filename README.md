# Aplikacje Systemu HR w PHP
Opis krótki projektu lub aplikacji.

## Wprowadzenie
Opis krótki lub wprowadzenie do projektu.

## Wymagania

- Docker
- Docker Compose

## Uruchamianie Projektu

Oto kroki, które musisz podjąć, aby uruchomić projekt na swoim komputerze:

1. **Sklonuj repozytorium:** Sklonuj to repozytorium na swoim komputerze za pomocą polecenia:

   ```bash
   git clone https://github.com/owolcz/HRapp.git

## Konfiguracja

Aby uruchomić projekt lokalnie, musisz utworzyć plik `.env` w głównym katalogu projektu i dodać do niego następujące zmienne środowiskowe:

```plaintext
MYSQL_ROOT_PASSWORD=twoje_haslo
MYSQL_DATABASE=twoja_baza_danych
```

## Uruchom projekt 
Po utworzeniu pliku .env, uruchom projekt za pomocą Docker Compose, używając polecenia:

```
docker-compose up --build
```
To polecenie zbuduje i uruchomi kontenery na podstawie pliku docker-compose.yml. Jeśli są dostępne obrazy kontenerów, zostaną one pobrane i uruchomione.

## Dostęp do aplikacji
Po zakończeniu powyższych kroków, aplikacja będzie dostępna w przeglądarce pod adresem http://localhost. Możesz przeglądać i testować projekt lokalnie.





## Uruchomienie projektu po przerwie w pracy
Przejdź do katalogu projektu na swoim komputerze.
Uruchom projekt za pomocą polecenia 
````
docker-compose up --build
````
Aplikacja będzie dostępna pod adresem http://localhost.
## Zatrzymanie projektu po pracy
Przejdź do katalogu projektu na swoim komputerze.
Zatrzymaj projekt za pomocą polecenia 
````
docker-compose down
````