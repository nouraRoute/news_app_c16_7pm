import 'package:flutter/material.dart';

extension ThemeExtention on BuildContext {
  ThemeData get getTheme => Theme.of(this);
  TextTheme get getTextTheme => Theme.of(this).textTheme;
}
