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

export 'package:firebase_js_interop/src/functions/common/providers/https.dart';

/// Options that can be set on a schedule function.
extension type ScheduleOptions._(JSObject _) implements JSObject {
  /// The schedule in Unix Crontab or AppEngine syntax.
  external JSAny? get schedule;

  /// The timezone that the schedule executes in.
  external JSAny? get timeZone;

  /// The number of retry attempts for a failed run.
  external JSAny? get retryCount;

  /// The time limit for retrying.
  external JSAny? get maxRetrySeconds;

  /// The minimum time to wait before retrying.
  external JSAny? get minBackoffSeconds;

  /// The maximum time to wait before retrying.
  external JSAny? get maxBackoffSeconds;

  /// The time between retries will double maxDoublings times.
  external JSAny? get maxDoublings;

  /// Constructor
  external ScheduleOptions({
    JSAny? schedule,
    JSAny? timeZone,
    JSAny? retryCount,
    JSAny? maxRetrySeconds,
    JSAny? minBackoffSeconds,
    JSAny? maxBackoffSeconds,
    JSAny? maxDoublings,
  });
}

/// Event passed to a scheduled function handler.
extension type ScheduledEvent._(JSObject _) implements JSObject {
  /// The Cloud Scheduler job name.
  external String? get jobName;

  /// The schedule time in RFC3339 UTC "Zulu" format.
  external String get scheduleTime;

  /// Constructor
  external ScheduledEvent({
    String? jobName,
    String? scheduleTime,
  });
}

/// The Cloud Function type for Schedule triggers.
extension type ScheduleFunction._(JSObject _) implements JSObject {
  external JSObject get requiredAPIs;
  external JSFunction run(ScheduledEvent event);

  /// Constructor
  external ScheduleFunction({
    JSObject requiredAPIs,
    JSFunction? run,
  });
}

/// The Firebase Functions Schedule namespace
extension type FirebaseFunctionsSchedule._(JSObject _) implements JSObject {
  /// Handles scheduled function invocations.
  /// @param options - Options to set on the schedule function
  /// @param handler - A function to execute when triggered
  /// @returns A function that you can export and deploy
  external JSFunction onSchedule(
    JSObject optionsOrSchedule, [
    // (ScheduledEvent event) => FutureOr<void>
    JSFunction handler,
  ]);
}
