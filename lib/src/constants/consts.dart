import 'package:async/async.dart';

class AppConstants {
  static List<String> role = [
    // Higher
    'executive',
    'admin',
    'auditor',
    'super_admin',
    'head_security',
    // Basic
    'basic',
    'security',
    'personal'
  ];

  static int logoutTime = 5;

  static RestartableTimer? timer;
}
