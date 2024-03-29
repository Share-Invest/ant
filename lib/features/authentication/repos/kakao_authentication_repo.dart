import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class KakaoAuthenticationRepository {
  Future<Account?> get user async {
    final acc = (await getUser())?.kakaoAccount;

    if (kDebugMode) {
      print(acc);

      return acc;
    }
    return acc;
  }

  Future<OAuthToken> _kakaoSignIn() async {
    final authToken = await isKakaoTalkInstalled()
        ? await _kakaoAuth.loginWithKakaoTalk()
        : await _kakaoAuth.loginWithKakaoAccount();

    if (kDebugMode) {
      print(authToken);
    }
    return authToken;
  }

  Future<AccessTokenInfo> accessKakaoTokenInfo() async {
    final hasToken = await AuthApi.instance.hasToken();

    if (hasToken == false) {
      await _kakaoSignIn();
    }
    final tokenInfo = await _kakaoAuth.accessTokenInfo();

    if (kDebugMode) {
      print(tokenInfo);
    }
    return tokenInfo;
  }

  Future<User?> getUser() async {
    if (await AuthApi.instance.hasToken()) {
      final user = await _kakaoAuth.me();

      if (kDebugMode) {
        print(user);
      }
      return user;
    }
    return null;
  }

  hasError(Object? error) async {
    if (kDebugMode) {
      if (error is PlatformException) {
        print(error);
      }
      if (error is KakaoAuthException) {
        print(error);
      }
      print(await KakaoSdk.origin);
    }
  }

  final _kakaoAuth = UserApi.instance;
}

final kakaoAuthRepository = Provider(
  (ref) => KakaoAuthenticationRepository(),
);
