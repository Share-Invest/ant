import 'package:ant/common/widgets/error_widget.dart';
import 'package:ant/common/widgets/loading_widget.dart';
import 'package:ant/features/assets/presenters/asset_presenter.dart';
import 'package:ant/features/assets/presenters/asset_trend_presenter.dart';
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
      .watch(assetTrendProvider)
      .when(
        error: (error, stackTrace) => ErrorText(
          error: error.toString(),
        ),
        loading: () => const CenterCircularProgressIndicator(),
        data: (asset) {
          final aggregate = asset.firstWhere(
            (e) => e.account == 'aggregate',
          );
          final spots = aggregate.toSpot();

          return Scaffold(
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
                      Positioned(
                        left: 0,
                        right: 0,
                        height: 256 + 128,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: LineChart(
                            LineChartData(
                              minX: aggregate.minX,
                              maxX: aggregate.maxX,
                              minY: aggregate.minY,
                              maxY: aggregate.maxY,
                              gridData: FlGridData(
                                show: false,
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  isCurved: true,
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.amber,
                                        Colors.orange,
                                      ].map((e) => e.withOpacity(0.5)).toList(),
                                    ),
                                  ),
                                  dotData: FlDotData(
                                    show: false,
                                  ),
                                  color: Colors.amber,
                                  barWidth: 0.1,
                                  spots: spots,
                                  /*
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.amber,
                                      Colors.orange,
                                    ],
                                  ),
                                  */
                                ),
                              ],
                              titlesData: FlTitlesData(
                                show: false,
                              ),
                            ),
                            swapAnimationDuration: const Duration(
                              milliseconds: 512,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 256 + 64,
                        left: 0,
                        right: 0,
                        height:
                            MediaQuery.of(context).size.height - 256 - 128 - 32,
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
        },
      );
  static String routeName = 'assets';
  static String routeUrl = '/assets';
}
