import 'package:ant/common/widgets/error_widget.dart';
import 'package:ant/common/widgets/loading_widget.dart';
import 'package:ant/features/assets/presenters/asset_presenter.dart';
import 'package:ant/features/assets/views/widgets/account_card_widget.dart';
import 'package:ant/features/assets/views/widgets/total_asset_chart_widget.dart';
import 'package:ant/features/assets/views/widgets/total_asset_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetScreen extends ConsumerWidget {
  const AssetScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Text(
                  'by Stock',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: ref.watch(assetProvider).when(
              loading: () => const CenterCircularProgressIndicator(),
              error: (error, stackTrace) => ErrorText(
                error: error.toString(),
              ),
              data: (model) => Stack(
                children: [
                  const Positioned(
                    left: 0,
                    right: 0,
                    height: 256 + 128,
                    child: TotalAssetChart(),
                  ),
                  Positioned(
                    top: 256 + 64,
                    left: 0,
                    right: 0,
                    height: MediaQuery.of(context).size.height - 256 - 128 - 32,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 28,
                        horizontal: 32,
                      ),
                      itemCount:
                          model.account != null ? model.account!.length : 0,
                      itemBuilder: (context, index) =>
                          model.account?[index] != null
                              ? AccountCard(model: model.account![index])
                              : null,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: TotalAsset(
                      model: model,
                    ),
                  ),
                ],
              ),
            ),
      );
  static String routeName = 'assets';
  static String routeUrl = '/assets';
}
