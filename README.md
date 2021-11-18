# better_print

A better way to print.

Often time we use print for quick debug. Although modern IDE is better equipped for debugging, sometimes it's okay to do some dumb print to console. But you always need to do a cleanup afterward and it can be tedious to do so. this plugin can make it easier to navigate using the same modern IDE. 

![](https://github.com/sanihaq/better_print/blob/master/assets/example.png)

## Getting Started

Add `better_print` to your project.
```
    better_print: ^1.3.2
```

run `flutter packages get` and import `better_print`
```dart
import 'package:better_print/better_print.dart';
```

## How to use

```dart
  betterPrint('message');
```
