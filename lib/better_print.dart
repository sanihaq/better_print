library better_print;

import 'package:flutter/widgets.dart';

/// A better way to show print message
///
/// set [printAll] to true to show the full debug log,
/// [maxLine] to control number of line in debug log. (only when [printAll] is true).
betterPrint(dynamic message, [printAll = false, int? maxLine]) {
  if (message.runtimeType != String) message = message.toString();
  final stackTrace = StackTrace.current;
  Iterable<String> lines = stackTrace.toString().trimRight().split('\n');
  final line = lines.toList()[1];
  final file = line.substring(line.indexOf('package:'));
  if (printAll) {
    if (maxLine != null) lines = lines.take(maxLine);
    debugPrint(
        '$message \n $file\n ${FlutterError.defaultStackFilter(lines.toList()).join('\n')}');
  } else {
    debugPrint('$message \n $file');
  }
}
