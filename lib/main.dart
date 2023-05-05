import 'package:acmc/src/features/authentication/views/auth_decide/auth.dart';
import 'package:acmc/src/features/home/views/bottom_nav.dart';
import 'package:acmc/src/features/onboarding/view/onboard.dart';
import 'package:acmc/src/features/settings/views/settings_view.dart';
import 'package:acmc/src/router/router.dart';
import 'package:acmc/src/utils/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

// Future initialization(BuildContext? context) async {
//   ///load resources
//   await Future.delayed(Duration(seconds: 3));

// }

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //close the keypad whenever the user taps on an inactive widget
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: MaterialApp(
          restorationScopeId: 'app',
          title: 'acmc',
          debugShowCheckedModeBanner: false,
          darkTheme: IdTheme.darkTheme,
          themeMode: ThemeMode.light,
          theme: IdTheme.lightTheme,
          initialRoute: IdRoute.onboarding,
          onGenerateRoute: (RouteSettings settings) {
            return IdRoute.fadeThrough(settings, (context) {
              switch (settings.name) {
                case IdRoute.main:
                  return const HomeScreen();
                case IdRoute.onboarding:
                  return const Onboard();
                case IdRoute.auth:
                  return const Auth();

                default:
                  return const SettingsView();
              }
            });
          },
        ));
  }
}
