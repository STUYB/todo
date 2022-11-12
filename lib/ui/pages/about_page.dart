import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            GoRouter.of(context).push("/");
          },
          child: const Icon(Icons.home, color: Colors.grey)),
    );
  }
}
