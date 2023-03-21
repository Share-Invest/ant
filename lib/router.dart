import 'package:ant/features/assets/views/assets_screen.dart';
import 'package:ant/features/authentication/repos/kakao_authentication_repo.dart';
import 'package:ant/features/authentication/views/login_screen.dart';
import 'package:ant/features/notifications/notifications_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: AssetsScreen.routeUrl,
    redirect: (context, state) async {
      final isLoggedIn = await ref.read(kakaoAuthRepo).isLoggedIn;

      return isLoggedIn ? null : LoginScreen.routeURL;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          ref.read(notificationsProvider(context));

          return child;
        },
        routes: [
          GoRoute(
            name: LoginScreen.routeName,
            path: LoginScreen.routeURL,
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: AssetsScreen.routeUrl,
            name: AssetsScreen.routeName,
            builder: (context, state) => const AssetsScreen(),
          )
        ],
      )
    ],
  ),
);
