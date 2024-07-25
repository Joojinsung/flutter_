import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:wadiz_clone/views/home/home_page.dart';
import 'package:wadiz_clone/views/widiz_app_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: "/home",
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return WidizAppShell(
              currentIndex: 0,
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: "/home",
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) {
                return HomePage();
              },
            ),
          ])
    ]);
