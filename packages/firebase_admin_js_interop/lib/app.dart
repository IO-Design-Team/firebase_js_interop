@JS('firebase-admin.app')
library;

import 'dart:js_interop';

export 'src/app/core.dart'
    show App, AppOptions, FirebaseArrayIndexError, FirebaseError;
export 'src/app/lifecycle.dart' show initializeApp, getApp, getApps, deleteApp;

export 'src/app/credential.dart'
    show Credential, ServiceAccount, GoogleOAuthAccessToken;

// TODO: The rest of them
