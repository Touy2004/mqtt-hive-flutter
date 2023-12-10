import 'package:go_router/go_router.dart';
import 'package:hack_vt/package.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const ControllerPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'notification',
          builder: (BuildContext context, GoRouterState state) {
            return const NotificationPage();
          },
        ),
      ],
    ),
  ],
);