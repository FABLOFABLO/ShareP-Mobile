import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:share_prompt/page/auth/login_page.dart';
import 'package:share_prompt/page/auth/sign_up_page.dart';
import 'package:share_prompt/page/home/home_page.dart';
import 'package:share_prompt/page/main/main_shell_page.dart';
import 'package:share_prompt/page/my/my_page.dart';
import 'package:share_prompt/page/onboarding/onboarding1_page.dart';
import 'package:share_prompt/page/onboarding/onboarding2_page.dart';
import 'package:share_prompt/page/onboarding/onboarding3_page.dart';
import 'package:share_prompt/page/onboarding/onboarding4_page.dart';
import 'package:share_prompt/page/search/search_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',

  routes: <RouteBase>[
    GoRoute(
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoarding1Page();
      },
      routes: [
        GoRoute(
          path: '2',
          builder: (BuildContext context, GoRouterState state) {
            return const OnBoarding2Page();
          },
        ),
        GoRoute(
          path: '3',
          builder: (BuildContext context, GoRouterState state) {
            return const OnBoarding3Page();
          },
        ),
        GoRoute(
          path: '4',
          builder: (BuildContext context, GoRouterState state) {
            return const OnBoarding4Page();
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

    StatefulShellRoute.indexedStack(
      builder: (_, _, navigationShell) =>
          MainShellPage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/search', builder: (_, _) => const SearchPage()),
          ],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/home', builder: (_, _) => const HomePage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/my', builder: (_, _) => const MyPage())],
        ),
      ],
    ),
  ],
);
