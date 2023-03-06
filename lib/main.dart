import 'package:ant/screens/balances_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(
    fileName: '.env',
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.textScaleFactorOf(context);

    return MaterialApp(
      themeMode: ThemeMode.system,
      title: 'Algorithmic-Trading',
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
          centerTitle: true,
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
      home: const BalancesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
