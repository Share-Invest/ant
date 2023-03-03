import 'package:ant/services/user_service.dart';
import 'package:flutter/material.dart';

class BalancesScreen extends StatelessWidget {
  const BalancesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: User.isLogin(context),
        builder: (_, snapshot) => snapshot.hasData
            ? snapshot.data!
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
