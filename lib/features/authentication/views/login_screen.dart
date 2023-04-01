import 'package:ant/common/widgets/loading_widget.dart';
import 'package:ant/features/authentication/presenters/kakao_auth_presenter.dart';
import 'package:ant/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({
    super.key,
  });
  static String routeName = "login";
  static String routeURL = "/login";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: ref.watch(kakaoAuthProvider).isLoading,
        progressIndicator: const CenterCircularProgressIndicator(),
        child: Padding(
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
                      print('KakaoTalk');
                    }
                    setString(
                      'KakaoTalk',
                    );
                    ref.read(kakaoAuthProvider.notifier).kakaoSignIn(context);
                  },
                  splashColor: Theme.of(context).primaryColor,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.yellow,
                      ),
                    ),
                    child: Image.network(
                      'https://${dotenv.env['BASE']}/images/buttons/kakao_login_medium_wide.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
