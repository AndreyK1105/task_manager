import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/calendar/presentation/screens/calendar.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../main/botom_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) =>
            HomeScreenBotomBar(
              child: child,
            ),
        routes: <RouteBase>[
          GoRoute(
            path: '/home',
            builder: ((context, state) => const HomeScreen()),
            routes: const <RouteBase>[
              /// routes nested
            ],
          ),
          GoRoute(
            path: '/calendar',
            builder: (context, state) => const Calendar(),
          )
        ]),
  ],
);
