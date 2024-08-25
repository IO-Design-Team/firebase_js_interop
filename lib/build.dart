import 'dart:io';

import 'package:node_preamble/preamble.dart';

/// The optimization level for the dart2js compiler
enum OptimizationLevel {
  /// No optimizations (only meant for debugging the compiler).
  // ignore: constant_identifier_names
  O0,

  /// Default (includes whole program analyses and inlining).
  // ignore: constant_identifier_names
  O1,

  /// Safe production-oriented optimizations (like minification).
  // ignore: constant_identifier_names
  O2,

  /// Potentially unsafe optimizations (see -h -v for details).
  // ignore: constant_identifier_names
  O3,

  /// More agressive unsafe optimizations (see -h -v for details).
  // ignore: constant_identifier_names
  O4;

  @override
  String toString() => name;
}

/// A pre-built function to convert dart code into Functions-compatible JS
///
/// A dart file named `src/index.dart` is compiled to `lib/index.js`
/// which will be used by the Functions runtime
Future<void> build({
  OptimizationLevel optimization = OptimizationLevel.O2,
}) async {
  final build = await Process.start(
    'dart',
    [
      'compile',
      'js',
      '-$optimization',
      '-o',
      'lib/index.js',
      'src/index.dart',
    ],
    mode: ProcessStartMode.inheritStdio,
  );

  final exitCode = await build.exitCode;
  if (exitCode != 0) {
    throw Exception('Build failed with exit code $exitCode');
  }

  final preamble =
      getPreamble(minified: optimization.index >= OptimizationLevel.O2.index);

  final out = File('lib/index.js');
  final content = out.readAsStringSync();
  if (content.contains('/// BEGIN PREAMBLE')) {
    // Build did not change
    return;
  }
  out.writeAsStringSync('''
/// BEGIN PREAMBLE
$preamble
/// END PREAMBLE

/// BEGIN DART
$content
/// END DART''');
}
