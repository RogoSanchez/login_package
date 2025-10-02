<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

Flutter Login App
Authentication app built with Flutter, Supabase, Bloc, and Formz

This project is a login and registration application developed in Flutter. It uses Supabase as the backend for authentication, Bloc for state management, and Formz for reactive form validation.


## Features

* Features
* Email and password login
* User registration
* Reactive form validation
* State management with Bloc
* Supabase integration
* Modern and responsive UI

## Getting started
Clone the repository:
* git clone https://github.com/RogoSanchez/login_package.git
* cd login_package
* flutter pub get

## Additional information

lib/
  data/
    repositories/         # Data access and authentication logic
  domain/
    entities/             # Entities and models
  Presentation/
    bloc/                 # Login and authentication blocs
    Screen/               # Main screens
    widgets/              # Reusable widgets

Technologies Used: 
- Flutter
- Supabase
- flutter_bloc
- formz

Customization:

Change colors and styles in the presentation files to match your branding.
You can add Google, Facebook, etc. authentication using Supabase methods.

Contributing:
Contributions are welcome! Open an issue or pull request for suggestions or improvements.

License
This project is licensed under the MIT License. See the LICENSE file for more information.

