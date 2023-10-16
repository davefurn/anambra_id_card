import 'package:acmc/src/features/authentication/login/login.dart';
import 'package:acmc/src/features/onboarding/views/onboard.dart';
import 'package:acmc/src/riverpod/providers.dart';
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

class MyApp extends ConsumerStatefulWidget {
  final bool firstTime;
  const MyApp({
    super.key,
    required this.firstTime,
  });

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onVerticalDragStart,
          ],
          child: Listener(
            onPointerDown: (event) {
              ref.read(appSessionServiceProvider.notifier).resetTimerState();
            },
            child: MaterialApp(
              title: 'ANSG IDM',
              debugShowCheckedModeBanner: false,
              darkTheme: IdTheme.darkTheme,
              themeMode: ThemeMode.light,
              theme: IdTheme.lightTheme,
              home: widget.firstTime ? const Onboard() : const Login(),
            ),
          ),
        );
      },
    );
  }
}
