import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetsScreen extends ConsumerWidget {
  const AssetsScreen({
    super.key,
    required this.name,
  });
  final String name;

  static String routeName = 'assets';
  static String routeUrl = '/assets';

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: const [
          Center(
            child: Text('data'),
          ),
        ],
      ),
    );
  }
}
