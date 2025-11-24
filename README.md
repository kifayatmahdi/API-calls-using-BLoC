# Flutter BLoC API Example
This project demonstrates how to integrate **API calls using BLoC (Business Logic Component)** in 
Flutter. It follows clean architecture with a clear separation of concerns.

## This project shows:
- Using StreamController inside a BLoC
- Calling a REST API
- Managing states (Loading, Data, Error)
- Updating UI using StreamBuilder

## 1. API Service
Handles the actual HTTP request.

## 2. BLoC
Uses Streams and Sinks to manage events and states.

## 3. Model
Represents API data.

## 4. UI (main.dart)
Displays loading, data, or error from StreamBuilder.

## How BLoC Works Here
- UI calls `bloc.fetchPosts()`
- BLoC emits `LoadingState()` → UI shows CircularProgressIndicator
- BLoC fetches data from API
- BLoC emits `DataState(posts)` → UI displays list
- If error: emits `ErrorState(message)` → UI shows error

## API Used
**Fetching from:**
```sh
   https://jsonplaceholder.typicode.com/posts/1
```

## How to Run
**1. Clone the project:**
   ```sh
   git remote add origin https://github.com/kifayatmahdi/API-calls-using-BLoC.git
   ```
**2. Install dependencies:**
    ```sh
   flutter pub get
   ```
**3. Run the app:**
    ```sh
   flutter run
   ```
## Dependencies
**Add in `pubspec.yaml`:**
```sh
    http: ^1.2.0
```
