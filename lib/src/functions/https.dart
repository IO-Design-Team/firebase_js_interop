import 'dart:js_interop';

/// Options that can be set on an onRequest HTTPS function.
extension type HttpsOptions._(JSObject _) implements JSObject {
  /// If true, do not deploy or emulate this function.
  external bool? get omit;

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
  external factory HttpsOptions({
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

/// The Firebase Functions HTTPS namespace.
extension type FirebaseFunctionsHttps._(JSObject _) implements JSObject {
  /// Handles HTTPS requests.
  /// @param opts - Options to set on this function
  /// @param handler - A function that takes a {@link https.Request} and response object, same signature as an Express app.
  /// @returns A function that you can export and deploy.
  external JSFunction onRequest([
    JSObject optsOrHandler,
    JSFunction? handler,
  ]);
}
