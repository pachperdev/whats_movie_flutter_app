import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,
      // pageTransitionsTheme: const PageTransitionsTheme(
      //   builders: {
      //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      //   },
      // ),
    );
  }
}
