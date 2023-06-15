import 'package:acmc/src/features/authentication/views/auth_decide/auth.dart';
import 'package:acmc/src/features/onboarding/views/onboard.dart';
import 'package:acmc/src/services/local_storage.dart';
import 'package:acmc/src/utils/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  var firstTime = await LocalStorage.instance.getFirstTime();
  runApp(ProviderScope(child: MyApp(firstTime: firstTime)));
}

class MyApp extends StatefulWidget {
  final bool firstTime;
  const MyApp({
    super.key,
    required this.firstTime,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onVerticalDragDown,
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) {
          return MaterialApp(
            title: 'ANSG IDM',
            debugShowCheckedModeBanner: false,
            
            darkTheme: IdTheme.darkTheme,
            themeMode: ThemeMode.light,
            theme: IdTheme.lightTheme,
            home: widget.firstTime ? const Onboard() : const Auth(),
          );
        },
      ),
    );
  }
}
