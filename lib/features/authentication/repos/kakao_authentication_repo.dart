import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class KakaoAuthenticationRepository {
  Future<OAuthToken> kakaoSignIn() async => await isKakaoTalkInstalled()
      ? await _kakaoAuth.loginWithKakaoTalk()
      : await _kakaoAuth.loginWithKakaoAccount();

  final _kakaoAuth = UserApi.instance;
}

final kakaoAuthRepo = Provider(
  (ref) => KakaoAuthenticationRepository(),
);
