import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Balances extends StatelessWidget {
  const Balances({
    super.key,
    required this.name,
    required this.id,
    required this.token,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 3,
          child: AutoSizeText(
            id.toString(),
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  final String? name, token;
  final int? id;
}
