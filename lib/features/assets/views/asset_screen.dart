import 'package:ant/common/widgets/error_widget.dart';
import 'package:ant/common/widgets/loading_widget.dart';
import 'package:ant/features/assets/presenters/asset_presenter.dart';
import 'package:ant/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetScreen extends ConsumerWidget {
  const AssetScreen({
    super.key,
  });
  static String routeName = 'assets';
  static String routeUrl = '/assets';

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) =>
      ref.watch(assetProvider).when(
            error: (error, stackTrace) => ErrorText(
              error: error.toString(),
            ),
            loading: () => const CenterCircularProgressIndicator(),
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
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 256 + 64,
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
                            formatCurrency.format(
                              data.total,
                            ),
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 28,
                        horizontal: 32,
                      ),
                      itemCount:
                          data.account != null ? data.account!.length : 0,
                      itemBuilder: (context, index) => Align(
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
                                color: const Color(0xFF686868)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getAccount(
                                    data.account?[index].acc,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFA9A9A9),
                                  ),
                                ),
                                Text(
                                  formatCurrency.format(
                                    data.account?[index].asset,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gaps.v24,
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    data.account?[index].date ?? '',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  String getAccount(String? account) {
    switch (account?.length) {
      case 10:
        return '${account!.substring(0, 4)}-${account.substring(4, 8)}';
    }
    return '';
  }

  Color get color {
    switch (prefs.getString('loginProvider')) {
      case 'KakaoTalk':
        return Colors.yellow;
    }
    return const Color(0xFF363636);
  }
}
