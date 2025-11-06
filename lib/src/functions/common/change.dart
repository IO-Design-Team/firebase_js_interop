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


// This is coped verbatim from the JS SDK
// ignore_for_file: doc_directive_unknown

import 'dart:js_interop';


/// The Cloud Functions interface for events that change state, such as
/// Realtime Database or Cloud Firestore `onWrite` and `onUpdate` events.
///
/// For more information about the format used to construct `Change` objects, see
/// {@link ChangeJson} below.
extension type Change<T extends JSObject>._(JSObject _) implements JSObject {
  /// Key-value pairs representing state of data after the change.
  external T? get after;

  /// Key-value pairs representing state of data before the change. If
  /// `fieldMask` is set, then only fields that changed are present in `before`.
  external T? get before;
}
