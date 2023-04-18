import 'package:acmc/src/features/home/views/home.dart';
import 'package:acmc/src/features/settings/controller/set_controller.dart';
import 'package:acmc/src/features/settings/services/settings_service.dart';
import 'package:acmc/src/features/settings/views/settings_view.dart';
import 'package:acmc/src/router/router.dart';
import 'package:acmc/src/utils/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'src/features/settings/models/settings_models.dart';

void main() async {
  runApp(ProviderScope(
    child: MyApp(
      navigatorKey: navigatorKey,
    ),
  ));
}

// Future initialization(BuildContext? context) async {
//   ///load resources
//   await Future.delayed(Duration(seconds: 3));

// }

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const MyApp({super.key, required this.navigatorKey});

  // This widget is the root of your application.
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
      child: AnimatedBuilder(
          animation: settingsViewModel,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              restorationScopeId: 'app',
              title: 'Kuro Bookkeeping',
              debugShowCheckedModeBanner: false,
              darkTheme: IdTheme.darkTheme,
              themeMode: ThemeMode.system,
              theme: IdTheme.lightTheme,
              initialRoute: IdRoute.main,
              onGenerateRoute: (RouteSettings settings) {
                return IdRoute.fadeThrough(settings, (context) {
                  switch (settings.name) {
                    case IdRoute.main:
                      return const Home();

                    default:
                      return SettingsView(
                        viewModel: settingsViewModel,
                        navigatorKey: navigatorKey,
                      );
                  }
                });
              },
            );
          }),
    );
  }
}
