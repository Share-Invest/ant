import 'package:ant/models/balance_model.dart';
import 'package:flutter/material.dart';

class Balance extends StatelessWidget {
  const Balance({
    super.key,
    required this.bm,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [],
    );
  }

  final BalanceModel bm;
}
