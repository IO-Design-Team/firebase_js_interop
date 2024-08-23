import 'dart:io';

import 'package:node_preamble/preamble.dart';

Future<void> build() async {
  final build = await Process.start(
    'dart',
    [
      'compile',
      'js',
      '-O2',
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

  final preamble = getPreamble();

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
