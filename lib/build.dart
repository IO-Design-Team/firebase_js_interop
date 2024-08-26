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

const _beginPreamble = '/// BEGIN PREAMBLE';
const _endPreamble = '/// END PREAMBLE';
const _beginDart = '/// BEGIN DART';
const _endDart = '/// END DART';

/// A pre-built function to convert dart code into Functions-compatible JS
///
/// A dart file named `src/index.dart` is compiled to `lib/index.js`
/// which will be used by the Functions runtime
Future<void> buildCloudFunctions({
  OptimizationLevel optimization = OptimizationLevel.O2,
  String output = 'lib/index.js',
  String input = 'src/index.dart',
}) async {
  final build = await Process.start(
    'dart',
    ['compile', 'js', '-$optimization', '-o', output, input],
    mode: ProcessStartMode.inheritStdio,
  );

  final exitCode = await build.exitCode;
  if (exitCode != 0) {
    throw Exception('Build failed with exit code $exitCode');
  }

  final preamble =
      getPreamble(minified: optimization.index >= OptimizationLevel.O2.index);

  final out = File(output);
  final content = out.readAsStringSync();
  if (content.contains(_beginPreamble)) {
    print('Preamble already present. Skipping preamble injection.');
    return;
  }
  out.writeAsStringSync(
    '$_beginPreamble\n$preamble\n$_endPreamble\n\n$_beginDart\n$content\n$_endDart\n',
  );
}
