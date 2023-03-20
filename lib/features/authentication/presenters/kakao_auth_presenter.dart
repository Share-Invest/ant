import 'dart:async';

import 'package:ant/features/authentication/repos/kakao_authentication_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class KakaoAuthPresenter extends AsyncNotifier<void> {
  late final KakaoAuthenticationRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(kakaoAuthRepo);
  }

  Future<void> kakaoSignIn(BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _repository.kakaoSignIn(),
    );
    if (state.hasError) {
      if (kDebugMode) {
        print(state.error);
      }
      /*  OAuthToken? auth;

        if ((await AuthApi.instance.hasToken()) == false) {
          try {
           
          } catch (e) {
            if (kDebugMode) {
              switch (e.runtimeType) {
                case PlatformException:
                  final p = e as PlatformException;
                  print(
                    {
                      p.code,
                      p.details,
                      p.message,
                      p.stacktrace,
                    },
                  );
                  break;

                case KakaoAuthException:
                  final ka = e as KakaoAuthException;
                  print(
                    {
                      ka.error,
                      ka.errorDescription,
                      ka.message,
                      await KakaoSdk.origin,
                    },
                  );
                  break;
              }
            }
          }
        }
        final info = await UserApi.instance.accessTokenInfo();
        final user = await UserApi.instance.me();
 */
      return;
    }
    if (context.mounted) {
      context.go('/');
    }
  }
}

final kakaoAuthProvider = AsyncNotifierProvider<KakaoAuthPresenter, void>(
  () => KakaoAuthPresenter(),
);
