import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_gorouter_wh_button/button_class.dart';
import 'package:task_gorouter_wh_button/screens/call_screen.dart';
import 'package:task_gorouter_wh_button/screens/groups_screen.dart';
import 'package:task_gorouter_wh_button/screens/messages_screen.dart';
import 'package:task_gorouter_wh_button/screens/status_screen.dart';

enum Screens {
  message,
  status,
  group,
  call,
}

//her we are creating the object and assigning to a variable
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  //we are we assning the _rootNavigatorKey as key
  navigatorKey: _rootNavigatorKey,
  routes: [
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    builder: (context, state, child) => ButtonClass(child: child),
    routes: [
      // This screen is displayed on the ShellRoute's Navigator.
      GoRoute(
        path: '/',
        name: Screens.message.name, 
        parentNavigatorKey: _shellNavigatorKey,
        builder: (context, state) => const MessageScreen(),
      ),
      GoRoute(
        path: '/status',
        name: Screens.status.name,
        parentNavigatorKey: _shellNavigatorKey,
        builder: (context, state) => const StatusScreen(),
      ),
      GoRoute(
        path: '/group',
        name: Screens.group.name,
        parentNavigatorKey: _shellNavigatorKey,
        builder: (context, state) => const GroupScreen(),
      ),
      GoRoute(
        path: '/call',
        name: Screens.call.name,
        parentNavigatorKey: _shellNavigatorKey,
        builder: (context, state) => const CallScreen(),
      ),
    ],
  ),
]);
