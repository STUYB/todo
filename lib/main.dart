import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/ui/pages/about_page.dart';
import 'package:todo_app/ui/pages/home_page.dart';

import 'ui/layout/skeleton.dart';

void main() {
  runApp(const Application());
}

final _router = GoRouter(routes: [
  ShellRoute(
      builder: (context, state, child) =>
          SafeArea(child: Skeleton(widget: child)),
      routes: [
        GoRoute(path: "/", builder: (context, state) => const HomePage()),
        GoRoute(path: "/about", builder: (context, state) => const AboutPage())
      ])
]);

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade300),
    );
  }
}
