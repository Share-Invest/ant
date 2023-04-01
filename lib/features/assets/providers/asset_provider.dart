import 'package:ant/features/assets/models/asset_model.dart';
import 'package:ant/features/assets/models/asset_status_trend_model.dart';
import 'package:ant/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

class AssetProvider {
  Future<List<AssetStatusTrendModel>> getAssetStatusTrendById(
    String id,
    String key,
  ) async {
    final map = fromJsonArr(
      await get(
        Uri.parse(
          '$_baseUrl/trend?id=$id&key=$key',
        ),
      ),
    );
    List<AssetStatusTrendModel> list = [];

    for (final e in map) {
      list.add(
        AssetStatusTrendModel.fromJson(e),
      );
    }
    return list;
  }

  Future<AssetModel?> getAssetById(
    String id,
    String key,
  ) async {
    final map = fromJson(
      await get(
        Uri.parse(
          '$_baseUrl?id=$id&key=$key',
        ),
      ),
    );
    return map.isNotEmpty ? AssetModel.fromJson(map) : null;
  }

  Future<String?> get(Uri uri) async {
    final client = RetryClient(Client());

    try {
      final res = await client.get(uri);

      if (res.statusCode == 200) {
        return res.body;
      }
      if (kDebugMode) {
        print(res.statusCode);
      }
    } catch (exception) {
      if (kDebugMode) {
        print({
          exception,
        });
      }
    } finally {
      client.close();
    }
    return null;
  }

  final String _baseUrl =
      'https://${dotenv.env['BASE']}/${dotenv.env['ASSET']}';
}
