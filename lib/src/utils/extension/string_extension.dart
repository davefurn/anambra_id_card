import 'dart:ui';

import 'package:acmc/src/model/enums.dart';

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension HexColorExtension on String {
  Color toColor() {
    String hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}

extension AccessLevelExtension on String {
  AccessLevel toAccessLevel() {
    late AccessLevel accessLevel;
    switch (toLowerCase()) {
      case 'basic':
        accessLevel = AccessLevel.basic;
        break;
      case 'guest':
        accessLevel = AccessLevel.guest;
        break;
      case 'admin':
        accessLevel = AccessLevel.admin;
        break;
      case 'security':
        accessLevel = AccessLevel.security;
        break;
      case 'auditor':
        accessLevel = AccessLevel.auditor;
        break;
      default:
        accessLevel = AccessLevel.none;
    }
    return accessLevel;
  }
}
