import 'package:flutter/material.dart';

extension BuildcontextExtension on BuildContext {
  Size get getSize => MediaQuery.of(this).size;

  ThemeData get theme => Theme.of(this);
}