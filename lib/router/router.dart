import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/page/login_page.dart';
import 'package:share_prompt/page/onbording/on_bording1_page.dart';
import 'package:share_prompt/page/sign_up_page.dart';

final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: <RouteBase>[
      GoRoute(
          path: '/on_bording_1',
          builder: (BuildContext context, GoRouterState state) {
            return const OnBording1();
          }),
      GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          }
      ),
      GoRoute(
          path: '/sign_up',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpPage();
          }
      )
    ]
);