Wrappers and tools for composing Firebase Cloud Functions in the Dart language

## Features

### Legend

|     |                 |
| --- | --------------- |
| 🟥  | No interop      |
| 🟧  | Limited interop |
| 🟨  | Partial interop |
| 🟩  | Full interop    |

### Admin

| Service            | Status | Comment                                                   |
| ------------------ | ------ | --------------------------------------------------------- |
| App                | 🟩     |                                                           |
| App Check          | 🟥     | App Check enforcement for callable functions is supported |
| Auth               | 🟥     |                                                           |
| Credential         | 🟥     |                                                           |
| Database           | 🟥     |                                                           |
| Eventarc           | 🟥     |                                                           |
| Extensions         | 🟥     |                                                           |
| Firestore          | 🟩     |                                                           |
| Functions          | 🟥     |                                                           |
| Installations      | 🟥     |                                                           |
| Messaging          | 🟧     | Only message sending                                      |
| Project Management | 🟥     |                                                           |
| Remote Config      | 🟥     |                                                           |
| Security Rules     | 🟥     |                                                           |
| Storage            | 🟥     |                                                           |

## Functions

| Service        | Status |
| -------------- | ------ |
| Alerts         | 🟥     |
| Database       | 🟥     |
| Eventarc       | 🟥     |
| Firestore      | 🟩     |
| HTTPS          | 🟩     |
| Identity       | 🟩     |
| PubSub         | 🟥     |
| Remote Config  | 🟥     |
| Scheduler      | 🟥     |
| Storage        | 🟥     |
| Tasks          | 🟥     |
| Test Lab       | 🟥     |
| Global Options | 🟥     |
| onInit         | 🟥     |

## Future

Interop with the following packages is planned, but not yet implemented:

- [rules-unit-testing](https://github.com/firebase/firebase-js-sdk/tree/main/packages/rules-unit-testing)
- [firebase-functions-test](https://github.com/firebase/firebase-functions-test)

## Getting started

Install the firebase tools

## Usage

### Project structure

Create the following dart/flutter packages:

| Package                   | Purpose                          |
| ------------------------- | -------------------------------- |
| {app}                     | Flutter app                      |
| {app}\_core               | Base core package                |
| {app}\_core_flutter       | Core package for Flutter app     |
| {app}\_core_js_interop    | Core package for Cloud Functions |
| {app}\_firebase/functions | Firebase Cloud Functions         |

The purpose of the three core packages is as follows:

- Flutter apps (besides the web platform) cannot import js_interop code
- Transpiled dart2js code cannot transitively depend on Flutter

This means the base `{app}_core` package _cannot_ depend on anything that depends on Flutter. Those dependencies should be used in `{app}_core_flutter` instead.

### Create the Firebase project

Run `firebase init` in `{app}_firebase`. Choose javascript as the language for Cloud Functions.

### Set up FCF for Dart

Make the following modifications to files in `{app}_firebase`:

#### firebase.json

Add the following ignores

```json
{
  "functions": [
    {
      "ignore": [
        "pubspec.*",
        "src",
        "tool",
        "analysis_options.yaml",
        ".dart_tool"
      ]
    }
  ]
}
```

#### functions/.gitignore

```
# Compiled JavaScript files
lib/**

# https://dart.dev/guides/libraries/private-files
# Created by `dart pub`
.dart_tool/
```

#### functions/package.json

```json
{
  "scripts": {
    "lint": "dart analyze --fatal-infos",
    "build": "dart run tool/build.dart"
  },
  "main": "lib/index.js"
}
```

#### functions/pubspec.yaml

```yaml
dependencies:
  {app}_core_js_interop:
    path: ../../{app}_core_js_interop
  firebase_js_interop: latest
```

#### functions/src/index.dart

This is where the Dart Cloud Functions code lives. See below for an example.

#### functions/tool/build.dart

This is what compiles `index.dart` into an `index.js` file that can run on Cloud Functions

<!-- embedme example/fji_example_firebase/functions/tool/build.dart -->

```dart
import 'package:firebase_js_interop/build.dart';

void main() async {
  await buildCloudFunctions();
}

```

### Writing models

Create the base models in `{app}_core`, then augment them with json serialization in `{app}_core_flutter` and `{app}_core_js_interop`. See the example project for more details on how to use json serialization with both `firebase_js_interop` and `cloud_firestore_odm`.

### Writing Cloud Functions

Writing Cloud Functions in Dart is very similar to writing them in TypeScript:

<!-- embedme readme/hello_world.dart -->

```dart
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:firebase_js_interop/functions.dart';
import 'package:firebase_js_interop/node.dart';
import 'package:firebase_js_interop/express.dart' as express;

void main() {
  exports['helloWorld'] = FirebaseFunctions.https.onRequest(
    (Request request, express.Response response) {
      return response.send('Hello from Firebase!'.toJS);
    }.toJS,
  );
}

```

Make sure to return promises for async operations:

<!-- embedme readme/async_function.dart -->

```dart
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:firebase_js_interop/functions.dart';
import 'package:firebase_js_interop/js.dart';
import 'package:firebase_js_interop/node.dart';
import 'package:firebase_js_interop/admin.dart';

void main() {
  exports['onMessageCreated'] = FirebaseFunctions.firestore.onDocumentCreated(
    '/chats/{chatId}/messages/{messageId}'.toJS,
    (FirestoreEvent<DocumentSnapshot> event) {
      return promise(() async {
        await Future.delayed(const Duration(seconds: 1));
      });
    }.toJS,
  );
}

```

### Deploying Cloud Functions

1. `dart run tool/build.dart`
2. `firebase deploy --only functions`

The compiled JS will also work in the Firebase emulators

## Additional information

See [firebase_rules](https://pub.dev/packages/firebase_rules) for writing Firebase security rules in Dart.

## Contributing

There are many unimplemented features. Please feel free to contribute if any necessary components are missing.

See [CONTRIBUTING.md](CONTRIBUTING.md) for details
