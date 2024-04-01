# Flutter Demo Chat Application

This chat application demonstrates a real-time messaging app built with Flutter, showcasing advanced state management with the BLoC pattern, reactive programming with streams and `BehaviorSubject`, and local persistence using SQLite.

## Project Structure

```
flutter_chat_app/
|-- android/
|-- ios/
|-- lib/
    |-- bloc/
        |-- chat_bloc.dart        # Business logic for chat operations.
        |-- chat_event.dart       # Defines events triggered in the app.
        |-- chat_state.dart       # Represents the state of the chat UI.
    |-- models/
        |-- chat_message.dart     # Chat message data model.
    |-- screens/
        |-- chat_screen.dart      # Main screen displaying chat messages.
    |-- services/
        |-- database_service.dart # Service for SQLite database operations.
    |-- main.dart                 # Entry point of the application.
|-- pubspec.yaml                  # Manages the assets and dependencies.
```

## Technologies and Packages Used

- **Flutter**: UI software development kit for building natively compiled applications.
- **flutter_bloc**: Library for implementing the BLoC (Business Logic Component) pattern.
- **rxdart**: Adds additional capabilities to Dart Streams and StreamControllers.
- **sqflite**: Flutter plugin for SQLite, a database engine.
- **path_provider**: A Flutter plugin for finding commonly used locations on the filesystem.

## Setup and Installation

1. Ensure you have Flutter installed on your machine (see Flutter's [official documentation](https://flutter.dev/docs/get-started/install) for guidance).
2. Clone this repository to your local machine.
3. Navigate to the project root and run `flutter pub get` to install the required dependencies.
4. Launch an emulator or connect a physical device.
5. Run `flutter run` to build and start the application.

## Application Overview

The chat application illustrates how users can send and receive messages in real-time, with a simple and intuitive interface. Messages are persisted locally using SQLite, ensuring that chat history is retained across sessions.

### Key Features

- **Real-Time Messaging**: Users can send and receive messages instantly.
- **Local Persistence**: Messages are stored in a local SQLite database, allowing users to access their chat history offline.
- **State Management**: Utilizes the BLoC pattern for clean and scalable state management.
- **Reactive Programming**: Employs streams and `BehaviorSubject` for real-time UI updates based on state changes.

### Implementation Details

- **BLoC (Business Logic Component)**: Manages the business logic of the chat application, separating it from the UI. This pattern ensures a clean separation of concerns and scalable codebase.
- **Database Service**: Handles all interactions with the local SQLite database, including initializing the database, inserting new messages, and retrieving chat history.
- **Chat Screen**: Displays the UI, including a list of messages and an input field for composing new messages. Uses `BlocBuilder` to reactively rebuild the messages list whenever the chat state changes.

