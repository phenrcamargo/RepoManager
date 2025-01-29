import 'package:flutter/material.dart';

extension BuildcontextExtension on BuildContext {
  Size get size => MediaQuery.of(this).size;

  ThemeData get theme => Theme.of(this);
}