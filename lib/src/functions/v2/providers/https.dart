// The MIT License (MIT)
//
// Copyright (c) 2021 Firebase
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

export 'package:firebase_js_interop/src/functions/common/providers/https.dart';

/// Options that can be set on an onRequest HTTPS function.
extension type HttpsOptions._(JSObject _) implements JSObject {
  /// If true, do not deploy or emulate this function.
  external JSAny? get omit;

  /// HTTP functions can override global options and can specify multiple regions to deploy to.
  external JSAny? get region;

  /// If true, allows CORS on requests to this function.
  /// If this is a `string` or `RegExp`, allows requests from domains that match the provided value.
  /// If this is an `Array`, allows requests from domains matching at least one entry of the array.
  /// Defaults to true for {@link https.CallableFunction} and false otherwise.
  external JSAny? get cors;

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
  external JSAny? get secrets;

  /// Invoker to set access control on https functions.
  external JSAny? get invoker;

  /// Constructor
  external HttpsOptions({
    JSAny? omit,
    JSAny? region,
    JSAny? cors,
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
    JSAny? secrets,
    JSAny? invoker,
  });
}

/// Options that can be set on a callable HTTPS function.
extension type CallableOptions._(JSObject _) implements HttpsOptions {
  /// Determines whether Firebase AppCheck is enforced.
  /// When true, requests with invalid tokens autorespond with a 401
  /// (Unauthorized) error.
  /// When false, requests with invalid tokens set event.app to undefiend.
  external bool? get enforceAppCheck;

  /// Determines whether Firebase App Check token is consumed on request. Defaults to false.
  ///
  /// @remarks
  /// Set this to true to enable the App Check replay protection feature by consuming the App Check token on callable
  /// request. Tokens that are found to be already consumed will have request.app.alreadyConsumed property set true.
  ///
  ///
  /// Tokens are only considered to be consumed if it is sent to the App Check service by setting this option to true.
  /// Other uses of the token do not consume it.
  ///
  /// This replay protection feature requires an additional network call to the App Check backend and forces the clients
  /// to obtain a fresh attestation from the chosen attestation providers. This can therefore negatively impact
  /// performance and can potentially deplete your attestation providers' quotas faster. Use this feature only for
  /// protecting low volume, security critical, or expensive operations.
  ///
  /// This option does not affect the enforceAppCheck option. Setting the latter to true will cause the callable function
  /// to automatically respond with a 401 Unauthorized status code when request includes an invalid App Check token.
  /// When request includes valid but consumed App Check tokens, requests will not be automatically rejected. Instead,
  /// the request.app.alreadyConsumed property will be set to true and pass the execution to the handler code for making
  /// further decisions, such as requiring additional security checks or rejecting the request.
  external bool? get consumeAppCheckToken;

  /// Constructor
  external CallableOptions({
    JSAny? omit,
    JSAny? region,
    JSAny? cors,
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
    JSAny? secrets,
    JSAny? invoker,
    JSAny? enforceAppCheck,
    JSAny? consumeAppCheckToken,
  });
}

/// The Firebase Functions HTTPS namespace
extension type FirebaseFunctionsHttps._(JSObject _) implements JSObject {
  /// Handles HTTPS requests.
  /// @param opts - Options to set on this function
  /// @param handler - A function that takes a {@link https.Request} and response object, same signature as an Express app.
  /// @returns A function that you can export and deploy.
  external JSFunction onRequest(
    JSObject optsOrHandler, [
    // (Request request, express.Response response) => FutureOr<void>
    JSFunction handler,
  ]);

  /// Declares a callable method for clients to call using a Firebase SDK.
  /// @param opts - Options to set on this function.
  /// @param handler - A function that takes a {@link https.CallableRequest}.
  /// @returns A function that you can export and deploy.
  external JSFunction onCall(
    JSObject optsOrHandler, [
    // (CallableRequest request) => FutureOr<dynamic>
    JSFunction handler,
  ]);
}
