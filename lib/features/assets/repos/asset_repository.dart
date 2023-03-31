import 'package:ant/features/assets/models/asset_model.dart';
import 'package:ant/features/assets/providers/asset_provider.dart';

class AssetRepository {
  Future<AssetModel> getAssetById(
    String id,
    String key,
  ) async =>
      await _assetProvider.getAssetById(
        id,
        key,
      );
  final _assetProvider = AssetProvider();
}
