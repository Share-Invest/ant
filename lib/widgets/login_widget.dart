import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    side: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              onPressed: () async => await onPressed('kakao')
                  ? Navigator.pop(context)
                  : await onPressed('kakao'),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(
                        5,
                        5,
                      ),
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                    ),
                  ],
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).primaryColor,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                    fit: BoxFit.fill,
                    'https://${dotenv.env['BASE_URL']}/images/buttons/kakao_login_medium_wide.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> onPressed(String login) async {
    final prefs = await SharedPreferences.getInstance();

    return await prefs.setString('login', login);
  }
}
