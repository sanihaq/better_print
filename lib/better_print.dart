library better_print;

import 'package:flutter/widgets.dart';

/// A better way to show print message
///
/// [maxLine] to control number of line to show.
betterPrint(dynamic message, [int maxLine = 0]) {
  if (message.runtimeType != String) message = message.toString();
  final stackTrace = StackTrace.current;
  Iterable<String> lines = stackTrace.toString().trimRight().split('\n');
  final line = lines.toList()[1];
  final file = line.substring(line.indexOf('package:'));
  if (maxLine > 0) {
    lines = lines.take(maxLine + 1);
    debugPrint(
        '$message \n${FlutterError.defaultStackFilter(lines.toList()..removeAt(0)).join('\n')}');
  } else {
    debugPrint('$message \n $file');
  }
}
