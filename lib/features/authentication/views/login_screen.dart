import 'package:ant/features/authentication/presenters/kakao_auth_presenter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({
    super.key,
  });
  static String routeName = "login";
  static String routeURL = "/login";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  if (kDebugMode) {
                    print('kakao');
                  }
                  ref.read(kakaoAuthProvider.notifier).kakaoSignIn(context);
                },
                splashColor: Theme.of(context).primaryColor,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Theme.of(context).primaryColor.withOpacity(0.35),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  child: Image.network(
                    'https://${dotenv.env['BASE_URL']}/images/buttons/kakao_login_medium_wide.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
