import 'package:ant/features/authentication/presenters/kakao_auth_presenter.dart';
import 'package:ant/util.dart';
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
    return ref.watch(kakaoAuthProvider).when(
          error: (error, stackTrace) => Center(
            child: Text(
              error.toString(),
              style: const TextStyle(
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
          loading: () => const CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation(
              Colors.deepPurpleAccent,
            ),
          ),
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
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 256 + 64,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
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
                            ),
                          ),
                          Text(
                            formatCurrency.format(537095135),
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 256 + 32,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.limeAccent,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                        color: Colors.lime,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
