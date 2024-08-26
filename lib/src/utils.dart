import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:firebase_js_interop/node.dart';

/// Access to static members on [clazz] through node access to [module]
T staticAccess<T extends JSObject>(String module, String clazz) =>
    require(module)[clazz] as T;
