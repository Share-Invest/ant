import 'dart:async';

import 'package:ant/features/authentication/repos/kakao_authentication_repo.dart';
import 'package:ant/features/authentication/views/login_screen.dart';
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
    state = await AsyncValue.guard(() async => {
          await _repository.accessKakaoTokenInfo(),
          await _repository.getUser(),
        });
    if (state.hasError) {
      _repository.hasError(state.error);
    }
    if (state.hasValue && context.mounted) {
      context.goNamed(LoginScreen.routeName);
    }
  }
}

final kakaoAuthProvider = AsyncNotifierProvider<KakaoAuthPresenter, void>(
  () => KakaoAuthPresenter(),
);
