import 'dart:async';

import 'package:ant/features/assets/models/asset_model.dart';
import 'package:ant/features/assets/repos/asset_repository.dart';
import 'package:ant/features/authentication/repos/kakao_authentication_repo.dart';
import 'package:ant/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetPresenter extends AsyncNotifier<AssetModel> {
  @override
  FutureOr<AssetModel> build() async {
    _assetRepository = ref.read(assetRepository);
    _kakaoRepository = ref.read(kakaoAuthRepository);

    final loginProvider = prefs.getString('LoginProvider');

    var id = '';

    switch (loginProvider) {
      case 'KakaoTalk':
        final info = await _kakaoRepository.getUser();

        if (info != null) {
          id = info.id.toString();
        }
        break;
    }
    if (kDebugMode) {
      final admin = dotenv.env['ADMIN'];

      if (id.isEmpty) {
        id = admin ?? '';
      }
      print(admin);
    }
    return await _assetRepository.getAssetById(
      id,
      loginProvider ?? 'KakaoTalk',
    );
  }

  late final KakaoAuthenticationRepository _kakaoRepository;
  late final AssetRepository _assetRepository;
}

final assetProvider = AsyncNotifierProvider<AssetPresenter, AssetModel>(
  () => AssetPresenter(),
);
