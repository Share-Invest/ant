import 'package:ant/common/widgets/error_widget.dart';
import 'package:ant/common/widgets/loading_widget.dart';
import 'package:ant/features/assets/presenters/asset_presenter.dart';
import 'package:ant/features/assets/views/widgets/account_card_widget.dart';
import 'package:ant/features/assets/views/widgets/total_asset_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetScreen extends ConsumerWidget {
  const AssetScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) => ref
      .watch(assetProvider)
      .when(
        error: (error, stackTrace) => ErrorText(
          error: error.toString(),
        ),
        loading: () => const CenterCircularProgressIndicator(),
        data: (data) => Scaffold(
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
          body: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                height: 256 + 64,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: 14,
                      maxY: 4,
                      minY: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 256,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height - 256 - 64 - 32 - 16,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 28,
                    horizontal: 32,
                  ),
                  itemCount: data.account != null ? data.account!.length : 0,
                  itemBuilder: (context, index) => data.account?[index] != null
                      ? AccountCard(model: data.account![index])
                      : null,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: TotalAsset(
                  model: data,
                ),
              ),
            ],
          ),
        ),
      );
  static String routeName = 'assets';
  static String routeUrl = '/assets';
}
