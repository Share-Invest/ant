import 'package:ant/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(
    fileName: '.env',
  );
  KakaoSdk.init(
    nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY'],
  );
  runApp(
    const ProviderScope(
      overrides: [],
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final textScale = MediaQuery.textScaleFactorOf(context);

    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      themeMode: ThemeMode.system,
      title: 'Algorithmic-Trading',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          titleTextStyle: TextStyle(
            fontSize: textScale * 8 * 3,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: textScale * 8 * 3,
            fontWeight: FontWeight.bold,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: textScale * 8 * 3,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: textScale * 8 * 4,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: textScale * 8 * 5,
            fontWeight: FontWeight.w900,
          ),
        ),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}
