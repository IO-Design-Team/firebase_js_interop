# firebase_js_interop (fji) example

The example project is split up into several packages

| Package                     | Purpose                 |
| --------------------------- | ----------------------- |
| fji_example                 | Flutter app             |
| fji_example_core            | Base core package       |
| fji_example_fore_flutter    | Flutter core package    |
| fji_example_core_js_interop | js_interop core package |
| fji_example_firebase        | Firebase project        |

## fji_example

A simple app that triggers the Cloud Functions

## fji_example_core

The data models for the project

## fji_example_core_flutter

Augments the models in `fji_example_core` with JSON serialization that is compatible with `cloud_firestore_odm`. Note that this serialization code is NOT compatible with js_interop environments.

## fji_example_core_js_interop

Augments the models in `fji_example_core` with JSON serialization that is compatible with js_interop environments. Note that this serialization code is NOT compatible with Flutter environments.

## fji_example_firebase

Where the Cloud Functions are defined. See [index.dart](fji_example_firebase/functions/src/index.dart) for the implementation.
