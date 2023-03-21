import 'package:ant/features/authentication/presenters/kakao_auth_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetsScreen extends ConsumerWidget {
  const AssetsScreen({
    super.key,
  });
  static String routeName = 'assets';
  static String routeUrl = '/assets';

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('loading. . .'),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
