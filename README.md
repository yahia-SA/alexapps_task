# AlexApps Task

A AlexApps Task Flutter application developed by **Yahia Samir**, demonstrating modern mobile development practices, Clean Architecture, and responsive design.

## App Video

<video src="screens/Simulator%20Screen%20Recording%20-%20iPhone%2016%20Plus%20-%202025-12-14%20at%2016.14.35.mp4" controls autoplay loop muted></video>

## Project Overview

This project is a functional mobile application featuring an e-commerce interface. It allows users to browse products, view details, manage a shopping cart, and mock the checkout process. The app is built with a focus on scalability, maintainability, and user experience.

### Key Features
-   **Responsive UI**: Optimized for various screen sizes using `flutter_screenutil`.
-   **E-commerce Logic**: functionality to add items to cart, update quantities, and calculate totals dynamically.
-   **Favorites System**: Toggle product favorites with persistence using local storage.
-   **Navigation**: Structured routing between Home, Product Details, and Cart pages.
-   **Optimistic UI Updates**: Instant feedback for user actions like updating cart quantities.

## Architecture

The project follows **Clean Architecture** principles to separate concerns and ensure testability.

### Layers
1.  **Presentation Layer**:
    -   **Widgets**: UI components built with Flutter.
    -   **State Management**: Uses `flutter_bloc` (Cubits) to manage UI state and handle user interactions.
2.  **Domain Layer**:
    -   **Entities**: Pure Dart business objects (e.g., `Product`, `CartItem`).
    -   **Repositories (Interfaces)**: Abstract definitions of data operations.
    -   **Use Cases**: Encapsulate specific business logic (e.g., `AddCartItem`, `GetPopularProducts`).
3.  **Data Layer**:
    -   **Models**: Data transfer objects (DTOs) that extend entities.
    -   **Data Sources**: Implementations for local data fetching (Mock data simulation).
    -   **Repositories (Implementations)**: Coordinators between data sources and the domain layer.

### Dependency Injection
-   **GetIt**: Used for Service Locator pattern to manage dependencies and inject them where needed (Repositories, Use Cases, Cubits).

## State Management

-   **Flutter Bloc (Cubit)**: The application uses Cubits for lightweight and predictable state management.
    -   `CartCubit`: Manages cart items, totals, and persistence operations.
    -   `HomeCubit`: Handles fetching and displaying home screen data.
    -   `FavoriteCubit`: Manages the favorite status of individual products.
    -   `NavBarCubit`: Controls bottom navigation state.

## Tech Stack

-   **Framework**: Flutter
-   **Language**: Dart
-   **Packages**:
    -   `flutter_bloc`: State management.
    -   `get_it`: Dependency injection.
    -   `dartz`: Functional programming (Either type for error handling).
    -   `equatable`: Value equality for classes.
    -   `shared_preferences`: Local persistent storage.
    -   `flutter_screenutil`: Screen adaptation.
    -   `flutter_svg`: SVG rendering.

---
*Created by Yahia Samir*
