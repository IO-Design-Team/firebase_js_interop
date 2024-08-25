// The MIT License (MIT)
//
// Copyright (c) 2022 Firebase
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'dart:js_interop';

export 'package:firebase_js_interop/src/functions/common/providers/identity.dart';

/// All function options plus idToken, accessToken, and refreshToken.
extension type BlockingOptions._(JSObject _) implements JSObject {
  /// Pass the ID Token credential to the function.
  external bool? idToken;

  /// Pass the Access Token credential to the function.
  external bool? accessToken;

  /// Pass the Refresh Token credential to the function.
  external bool? refreshToken;

  /// If true, do not deploy or emulate this function.
  external JSAny? get omit;

  /// Region where functions should be deployed.
  external JSAny? get region;

  /// Amount of memory to allocate to a function.
  external JSAny? get memory;

  /// Timeout for the function in seconds, possible values are 0 to 540.
  /// HTTPS functions can specify a higher timeout.
  ///
  /// @remarks
  /// The minimum timeout for a gen 2 function is 1s. The maximum timeout for a
  /// function depends on the type of function: Event handling functions have a
  /// maximum timeout of 540s (9 minutes). HTTPS and callable functions have a
  /// maximum timeout of 36,00s (1 hour). Task queue functions have a maximum
  /// timeout of 1,800s (30 minutes)
  external JSAny? get timeoutSeconds;

  /// Min number of actual instances to be running at a given time.
  ///
  /// @remarks
  /// Instances will be billed for memory allocation and 10% of CPU allocation
  /// while idle.
  external JSAny? get minInstances;

  /// Max number of instances to be running in parallel.
  external JSAny? get maxInstances;

  /// Number of requests a function can serve at once.
  ///
  /// @remarks
  /// Can only be applied to functions running on Cloud Functions v2.
  /// A value of null restores the default concurrency (80 when CPU >= 1, 1 otherwise).
  /// Concurrency cannot be set to any value other than 1 if `cpu` is less than 1.
  /// The maximum value for concurrency is 1,000.
  external JSAny? get concurrency;

  /// Fractional number of CPUs to allocate to a function.
  ///
  /// @remarks
  /// Defaults to 1 for functions with <= 2GB RAM and increases for larger memory sizes.
  /// This is different from the defaults when using the gcloud utility and is different from
  /// the fixed amount assigned in Google Cloud Functions generation 1.
  /// To revert to the CPU amounts used in gcloud or in Cloud Functions generation 1, set this
  /// to the value "gcf_gen1"
  external JSAny? get cpu;

  /// Connect cloud function to specified VPC connector.
  external JSAny? get vpcConnector;

  /// Egress settings for VPC connector.
  external JSAny? get vpcConnectorEgressSettings;

  /// Specific service account for the function to run as.
  external JSAny? get serviceAccount;

  /// Ingress settings which control where this function can be called from.
  external JSAny? get ingressSettings;

  /// User labels to set on the function.
  external JSAny? get labels;

  /// Secrets to bind to a function.
  external JSArray<JSAny>? get secrets;

  /// Constructor
  external BlockingOptions({
    bool? idToken,
    bool? accessToken,
    bool? refreshToken,
    JSAny? omit,
    JSAny? region,
    JSAny? memory,
    JSAny? timeoutSeconds,
    JSAny? minInstances,
    JSAny? maxInstances,
    JSAny? concurrency,
    JSAny? cpu,
    JSAny? vpcConnector,
    JSAny? vpcConnectorEgressSettings,
    JSAny? serviceAccount,
    JSAny? ingressSettings,
    JSAny? labels,
    JSArray<JSAny>? secrets,
  });
}

/// The Firebase Functions Identity namespace
extension type FirebaseFunctionsIdentity._(JSObject _) implements JSObject {
  /// Handles an event that is triggered before a user is created
  /// @param optsOrHandler - Either an object containing function options, or an event handler (run before user creation)
  /// @param handler? - If defined, an event handler which is run every time before a user is created
  external JSFunction beforeUserCreated(
    JSObject optsOrHandler, [
    // (AuthBlockingEvent event) => FutureOr<BeforeCreateResponse?>
    JSFunction handler,
  ]);

  /// Handles an event that is triggered before a user is signed in.
  /// @param optsOrHandler - Either an object containing function options, or an event handler (run before user signin)
  /// @param handler - Event handler which is run every time before a user is signed in
  external JSFunction beforeUserSignedIn(
    JSObject optsOrHandler, [
    // (AuthBlockingEvent event) => FutureOr<BeforeSignInResponse?>
    JSFunction handler,
  ]);
}
