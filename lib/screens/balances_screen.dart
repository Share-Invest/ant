import 'package:ant/screens/login_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalancesScreen extends StatelessWidget {
  const BalancesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: isLogin(),
        builder: (_, snapshot) => snapshot.hasData
            ? snapshot.data!
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Future<Widget> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final login = prefs.getString('login');

    if (login?.isEmpty ?? true) return const LoginScreen();

    switch (login) {
      case 'kakao':
        KakaoSdk.init(
          nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY'],
        );
        final info = await UserApi.instance.accessTokenInfo();
        final user = await UserApi.instance.me();

        if (kDebugMode) {
          print(
            {
              info.id,
              info.appId,
              info.expiresIn,
              user.kakaoAccount?.email,
            },
          );
        }
        return const AutoSizeText('balances');
    }
    return const LoginScreen();
  }
}
