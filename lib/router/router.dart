import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:share_prompt/page/auth/login_page.dart';
import 'package:share_prompt/page/auth/sign_up_page.dart';

import 'package:share_prompt/page/onbording/on_bording1_page.dart';
import 'package:share_prompt/page/onbording/on_bording2_page.dart';
import 'package:share_prompt/page/onbording/on_bording3_page.dart';
import 'package:share_prompt/page/onbording/on_bording4_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',

  routes: <RouteBase>[
    GoRoute(
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBording1();
      },
      routes: [
        GoRoute(
          path: '2',
          builder: (BuildContext context, GoRouterState state) {
            return const OnBording2Page();
          },
        ),
        GoRoute(
          path: '3',
          builder: (BuildContext context, GoRouterState state) {
            return const OnBording3Page();
          },
        ),
        GoRoute(
          path: '4',
          builder: (BuildContext context, GoRouterState state) {
            return const OnBording4Page();
          },
        ),
      ],
    ),

    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),

    GoRoute(
      path: '/sign_up',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpPage();
      },
    ),
  ],
);