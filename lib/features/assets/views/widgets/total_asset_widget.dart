import 'package:ant/features/assets/models/asset_model.dart';
import 'package:ant/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalAsset extends ConsumerWidget {
  const TotalAsset({
    super.key,
    required this.model,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 36,
          horizontal: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Balance',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              formatCurrency.format(
                model.total,
              ),
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      );
  final AssetModel model;
}
