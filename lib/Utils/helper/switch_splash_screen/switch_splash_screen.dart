import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 25.0;
  double top = 30.0;
  double left = 30.0;
  double bottom = 0.0;
  double right = 0.0;
  double width = 25.0;
  Widget firstWidget = Container(
    height: 35,
    width: 35,
    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
    key: const ValueKey(1),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Transition"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 20,
            top: 20,
            child: InkWell(
              onTap: () {
                context.go('/books');
              },
              child: AnimatedContainer(
                alignment: Alignment.center,
                duration: const Duration(seconds: 2),
                height: height,
                width: width,
                child: Center(
                    child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
