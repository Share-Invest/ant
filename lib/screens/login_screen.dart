import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(
                      2.5,
                      2.5,
                    ),
                    color: Theme.of(context).primaryColor.withOpacity(0.75),
                  ),
                ],
              ),
              child: Image.network(
                  fit: BoxFit.fill,
                  'https://${dotenv.env['BASE_URL']}/images/buttons/kakao_login_medium_wide.png'),
            ),
          ),
        ),
      ],
    );
  }
}
