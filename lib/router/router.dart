import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/page/auth/login_page.dart';
import 'package:share_prompt/page/onbording/on_bording1_page.dart';
import 'package:share_prompt/page/auth/sign_up_page.dart';
import 'package:share_prompt/page/onbording/on_bording2_page.dart';
import 'package:share_prompt/page/onbording/on_bording3_page.dart';
import 'package:share_prompt/page/onbording/on_bording4_page.dart';

final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const OnBording1();
          }),
      GoRoute(
          path: '/onbording_2',
          builder: (BuildContext context, GoRouterState state) {
            return const OnBording2Page();
          }
      ),
      GoRoute(
          path: '/onbording_3',
          builder: (BuildContext context, GoRouterState state) {
            return const OnBording3Page();
          }
      ),
      GoRoute(
          path: '/onbording_4',
          builder: (BuildContext context, GoRouterState state) {
            return const OnBording4Page();
          }
      ),
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