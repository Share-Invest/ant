import 'package:ant/services/user_service.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BalancesScreen extends StatelessWidget {
  const BalancesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLogin = User.isLogin(context);

    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: isLogin,
          builder: (_, snapshot) => snapshot.hasData
              ? AutoSizeText(
                  snapshot.data!.name ?? '',
                )
              : CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).primaryColor,
                  ),
                ),
        ),
      ),
      body: FutureBuilder(
        future: isLogin,
        builder: (_, snapshot) => snapshot.hasData
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    snapshot.data!.id.toString(),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
      ),
    );
  }
}
