# KeepNotes

KeepNotes is a simple and intuitive note-taking app that provides users with a range of useful features. Built using Flutter and Firebase, the app is fast and responsive, with a clean and modern design. KeepNotes allows users to save notes locally and in the cloud, sign in with their Google account, and easily manage their notes with features like pinning and archiving.

This is a practice project that I created by following a tutorial from [YouTube](https://youtube.com/playlist?list=PLlvhNpz1tBvGIyUU_THbJfuJhbRk2GOku). The tutorial helped me to fix some errors and taught me about Flutter.

## Features

- Sign in with Google using the profile picture button
- Local and Cloud Storage
- Pin Notes
- Archive Notes
- Add, Arrange, Delete, and Update Notes
- Toast message notification for sign-in/sign-out events
- Sync button for remote note storage (turned off by default)

## Some changes

In the latest version of KeepNotes, I have removed the home page and moved the sign-in functionality into the profile picture button. This means that users can sign in by tapping on their profile picture, or sign out if they are already signed in. A toast message will be displayed to notify the user about the sign-in/sign-out event.

Additionally, the sync button for remote note storage is turned off by default

## Technologies Used

KeepNotes uses the following packages to provide its functionality:

- `flutter_staggered_grid_view: ^0.4.0`: A Flutter package that provides a staggered grid view for displaying items in a grid. This package is used in KeepNotes to display notes in a visually appealing way.

- `sqflite: ^2.2.8+1`: A Flutter package that provides a simple way to interact with SQLite databases. This package is used in KeepNotes to store notes locally on the user's device.

- `firebase_auth: ^4.5.0`: A Flutter package that provides authentication using Firebase Authentication. This package is used in KeepNotes to allow users to sign in with their Google account.

- `google_sign_in: ^6.1.0`: A Flutter package that provides a way to sign in with Google. This package is used in KeepNotes to allow users to sign in with their Google account.

- `flutter_signin_button`: A Flutter package that provides a set of sign-in buttons for various services. This package is used in KeepNotes to provide a sign-in button for Google.

- `shared_preferences: ^2.1.0`: A Flutter package that provides a way to store data on the user's device. This package is used in KeepNotes to store user preferences, such as the user's preferred theme.

- `firebase_core: ^2.11.0`: A Flutter package that provides the core functionality for Firebase services. This package is used in KeepNotes to initialize Firebase services.

- `cloud_firestore: ^2.5.2`: A Flutter package that provides a way to interact with Firestore, a NoSQL cloud database from Firebase. This package is used in KeepNotes to store notes in the cloud.

- `uuid: ^3.0.7`: A Flutter package that provides a way to generate unique identifiers. This package is used in KeepNotes to generate unique IDs for each note.

## Getting Started

To get started with KeepNotes, follow these steps:

1. Clone the repository to your local machine.
2. Set up Firebase Authentication and Firestore for your project.
3. Update the Firebase configuration in `lib/main.dart`.
4. Run the app on your device or emulator.


