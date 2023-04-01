import 'package:ant/features/assets/models/asset_chart_model.dart';
import 'package:ant/features/assets/models/asset_model.dart';
import 'package:ant/features/assets/providers/asset_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetRepository {
  Future<AssetChartModel> getAssetStatusTrendById(
    String scheme,
    String id,
    String key,
  ) async =>
      await _assetProvider.getAssetStatusTrendById(
        scheme,
        id,
        key,
      );
  Future<AssetModel?> getAssetById(
    String id,
    String key,
  ) async =>
      await _assetProvider.getAssetById(
        id,
        key,
      );
  final _assetProvider = AssetProvider();
}

final assetRepository = Provider(
  (ref) => AssetRepository(),
);
