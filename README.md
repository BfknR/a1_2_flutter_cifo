# Name Generator

A Flutter app that generates random person names. The list grows as you scroll, with no upper limit.

Built for Activity 1.2 of *Introducció a la programació amb Flutter* (Desenvolupament d'Aplicacions mòbils per iOS i Android amb Flutter).

## Features

- Infinite-scrolling list of random full names, generated with the `random_name_generator` package (Catalonia zone)
- Alternating row colours
- Tap a name to show it in a SnackBar. Tapping again replaces the previous SnackBar.

## Requirements

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Visual Studio Code (or any editor with Flutter support)
- One of: a physical Android or iOS device in developer mode, the iOS Simulator (requires Xcode), or an Android Emulator (requires Android Studio)

## Getting started

```bash
git clone [<repository-url>](https://github.com/BfknR/a1_2_flutter_cifo)
cd a1_2_flutter_cifo
flutter pub get
flutter run
```

## Project structure

```
lib/
├── main.dart          # App entry point: MaterialApp and Scaffold
└── people_list.dart   # StatefulWidget that holds the name list and scroll logic
```

## How it works

- `_suggestions` stores the generated names. It lives in the `State` object, so hot reload keeps the same names. A hot restart generates a new list.
- A `ScrollController` listens for scrolling. When the user is within 200 px of the bottom, 30 more names are added and the list rebuilds.
- `ListView.separated` draws a `Divider` between rows.

## Dependencies

- [random_name_generator](https://pub.dev/packages/random_name_generator) `^1.5.0`
