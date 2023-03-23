import 'package:ant/features/authentication/presenters/kakao_auth_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class AssetsScreen extends ConsumerWidget {
  const AssetsScreen({
    super.key,
    required this.user,
  });
  final Account? user;
  static String routeName = 'assets';
  static String routeUrl = '/assets';

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return ref.watch(kakaoAuthProvider).when(
          error: (error, stackTrace) => Center(
            child: Text(
              error.toString(),
            ),
          ),
          loading: () => const CircularProgressIndicator.adaptive(),
          data: (data) => Scaffold(
            appBar: AppBar(
              title: Text(user == null ? '' : (user!.email ?? '')),
            ),
            body: Column(
              children: [
                Center(
                  child: Text(user == null ? '' : (user!.email ?? '')),
                ),
              ],
            ),
          ),
        );
  }
}
