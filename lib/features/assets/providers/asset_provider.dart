import 'package:ant/features/assets/models/asset_model.dart';
import 'package:ant/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

class AssetProvider {
  Future<AssetModel> getAssetById(
    String id,
    String key,
  ) async {
    final client = RetryClient(Client());

    try {
      final res = await client.get(
        Uri.parse(
          '$_baseUrl?id=$id&key=$key',
        ),
      );
      if (res.statusCode == 200) {
        return AssetModel.fromJson(
          fromJson(res.body),
        );
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
    throw ArgumentError(
      'no results found for $id.',
      key,
    );
  }

  final String _baseUrl =
      'https://${dotenv.env['BASE']}/${dotenv.env['ASSET']}';
}
