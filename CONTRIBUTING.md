# Contributing

## Overview

The `firebase_js_interop` package provides direct access to the Firebase JS SDKs. The goal is to provide a familiar experience to developers who know the JS SDKs, while also following Dart best practices.

## Adding New Interop Code

The process for adding new interop code is as follows:

1. Find the relevant code in the [JS SDK](https://github.com/firebase/firebase-functions/tree/master/src)
2. Create any necessary intermediary folders in `firebase_js_interop`. Implementations live in `lib/src/{js_sdk}/**`.
3. Create a dart file with the same name as the typescript file, replacing `.ts` with `.dart`
4. Copy the license text from the typescript file to the dart file
5. Translate the typescript code to dart as faithfully as possible. However, do modify code to follow Dart conventions where reasonable.

## Style

- Only write interop for classes and functions that are public, non-deprecated, and meant for external use
- Maintain the same declaration order as the JS SDK
- Doc comments should be verbatim copied from the JS SDK, however convert them from `*` to `///`
- Comment the expected signature of `JSFunction`s. See existing interop code for examples.
- If there are multiple function definitions with the same name, choose the most flexible one
- File and folder names should be converted to `snake_case`
- All identifiers should be strict `camelCase` or `PascalCase` unless doing so affects readability. For example, `photoURL` in JS should be changed to `photoUrl` in dart with an `@JS('photoURL')` annotation.
- Adding lint ignores is fine in cases where fixing the lint would make code or comments less faithful to the source material
