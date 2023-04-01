import 'package:ant/features/assets/models/asset_model.dart';
import 'package:ant/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountCard extends ConsumerWidget {
  const AccountCard({
    required this.model,
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) => Align(
        heightFactor: 0.85,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12,
            ),
            color: color,
            border: Border.all(
              style: BorderStyle.solid,
              color: const Color(0xFF686868),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      model.name ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFD700),
                      ),
                    ),
                    Gaps.h4,
                    Text(
                      getAccount(model.acc),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFFA9A9A9),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        markTimeAgo(model.ticks),
                        style: const TextStyle(
                          fontSize: 12,
                          wordSpacing: -1.25,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                Text(
                  formatCurrency.format(model.asset),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Gaps.h96,
                    SizedBox(
                      height: 64,
                      child: Image.asset(
                        'assets/kiwoom_logo.png',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
  final Account model;
}
