import 'package:ant/common/widgets/error_widget.dart';
import 'package:ant/common/widgets/loading_widget.dart';
import 'package:ant/features/assets/presenters/asset_trend_presenter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalAssetChart extends ConsumerWidget {
  const TotalAssetChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: ref.watch(assetTrendProvider).when(
              error: (error, stackTrace) => ErrorText(
                error: error.toString(),
              ),
              loading: () => const CenterCircularProgressIndicator(),
              data: (aggregate) => LineChart(
                LineChartData(
                  minX: aggregate.minX?.toDouble(),
                  maxX: aggregate.maxX?.toDouble(),
                  minY: 0.9 * (aggregate.minY ?? 0),
                  maxY: 1.1 * (aggregate.maxY ?? 0),
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
                            const Color(0xFF00BFFF),
                            const Color(0xFF000080),
                          ]
                              .map(
                                (e) => e.withOpacity(0.75),
                              )
                              .toList(),
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      dotData: FlDotData(
                        show: false,
                      ),
                      color: const Color(0xFF000080),
                      barWidth: 0.5,
                      spots: aggregate.toPreviousSpot(),
                    ),
                    LineChartBarData(
                      isCurved: true,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xFF800000),
                            Colors.red,
                          ],
                        ),
                      ),
                      dotData: FlDotData(
                        show: false,
                      ),
                      color: const Color(0xFF800000),
                      barWidth: 0.5,
                      spots: aggregate.toPresentSpot(),
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
      );
}
