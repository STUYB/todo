import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Skeleton extends StatelessWidget {
  final Widget widget;
  const Skeleton({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade300),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Todo App",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            backgroundColor: Colors.grey.shade300,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.info, color: Colors.grey.shade500),
                tooltip: 'About',
                onPressed: () {
                  GoRouter.of(context).push("/about");
                },
              )
            ],
          ),
          body: widget,
        ));
  }
}
