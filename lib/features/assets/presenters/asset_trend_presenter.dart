import 'dart:async';

import 'package:ant/features/assets/models/asset_status_trend_model.dart';
import 'package:ant/features/assets/repos/asset_repository.dart';
import 'package:ant/features/authentication/repos/kakao_authentication_repo.dart';
import 'package:ant/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetTrendPresenter extends AsyncNotifier<List<AssetStatusTrendModel>> {
  @override
  FutureOr<List<AssetStatusTrendModel>> build() async {
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
    }
    final result = await _assetRepository.getAssetStatusTrendById(
      id,
      loginProvider ?? 'KakaoTalk',
    );
    return result.isNotEmpty
        ? result
        : throw ArgumentError(
            "no results found for $loginProvider.",
            id,
          );
  }

  late final KakaoAuthenticationRepository _kakaoRepository;
  late final AssetRepository _assetRepository;
}

final assetTrendProvider =
    AsyncNotifierProvider<AssetTrendPresenter, List<AssetStatusTrendModel>>(
  () => AssetTrendPresenter(),
);
