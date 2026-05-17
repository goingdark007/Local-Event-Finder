# Local Event Finder App

A Flutter application designed to help users discover events happening in their local area. This project demonstrates the integration of Google Maps, state management with Provider, and a modern UI for event exploration.

## Features

- **Event Discovery**: Browse through a curated list of local events.
- **Detailed Information**: Access comprehensive event details including descriptions, schedules, and locations.
- **Interactive Maps**: Visualize event locations accurately using Google Maps integration.
- **Categorization**: Events are categorized with distinct visual identifiers for easy browsing.
- **Secure API Management**: Securely handles Google Maps API keys using `local.properties`.

## Screenshots

|  Splash Screen   |  Home Screen   |   Event Details   |
|:----------------:|:--------------:|:-----------------:|
| ![Splash Screen] | ![Home Screen] | ![Event Details]  |

> *Note: Create a `screenshots` directory in the root and place your images there, or update the paths accordingly.*

## Tech Stack

- **Framework:** [Flutter](https://flutter.dev/)
- **State Management:** [Provider](https://pub.dev/packages/provider)
- **Maps:** [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)
- **Icons:** Cupertino & Material Icons

## Getting Started

### Prerequisites

- Flutter SDK installed.
- An Android/iOS emulator or physical device.
- A Google Maps API Key from the [Google Cloud Console](https://console.cloud.google.com/).

### Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd of26_local_event_finder_app
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Configure Google Maps API Key:**
    For security, the API key is managed via `local.properties`.
    - Navigate to the `android/` directory.
    - Open (or create) the `local.properties` file.
    - Add your API key as follows:
      ```properties
      GOOGLE_MAPS_API_KEY=your_api_key_here
      ```

4.  **Run the application:**
    ```bash
    flutter run
    ```

## Project Status

This app currently uses **dummy data** to simulate a backend, making it fully functional for demonstration purposes. The integration with Google Maps uses real coordinates tied to the dummy events to provide a realistic user experience.
