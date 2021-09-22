library better_print;

import 'package:flutter/widgets.dart';

/// A better way to show print message
///
/// [maxLine] to control number of line to show.
void betterPrint(dynamic message, [int maxLine = 0]) {
  if (message.runtimeType != String) message = message.toString();
  final stackTrace = StackTrace.current;
  Iterable<String> lines = stackTrace.toString().trimRight().split('\n');
  // removing [betterPrint] from stack
  String line = lines.toList()[1];
  final i = line.indexOf('package:');
  if (maxLine > 0) {
    lines = lines.take(maxLine + (i < 0 ? 2 : 1));
    debugPrint(
      FlutterError.defaultStackFilter(lines.toList()..removeRange(0, i < 0 ? 2 : 1))
          .join('\n')
          .replaceAll('packages/', 'package:')
          .replaceRange(0, 2, message),
    );
  } else {
    final list = line.split(" ");
    debugPrint('$message ${list.last}s');
  }
}
