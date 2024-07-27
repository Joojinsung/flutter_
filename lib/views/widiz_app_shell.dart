import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WidizAppShell extends StatefulWidget {
  const WidizAppShell(
      {super.key, required this.child, required this.currentIndex});

  final Widget child;
  final int currentIndex;

  @override
  State<WidizAppShell> createState() => _WidizAppShellState();
}

class _WidizAppShellState extends State<WidizAppShell> {
  void _onNavBarTap(int idx) {
    // Always navigate to '/home' regardless of the tapped index
    GoRouter.of(context).go('/home');
  }

  void _onItemTapped(int index, BuildContext context) {
    if (index == 1) {
      GoRouter.of(context).push("/add");
    } else if (index == 3) {
      GoRouter.of(context).go("/my");
    } else {
      GoRouter.of(context).go("/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: (int idx) => _onItemTapped(idx, context),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Project"),
          BottomNavigationBarItem(
              icon: Icon(widget.currentIndex == 2
                  ? Icons.favorite
                  : Icons.favorite_border),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(widget.currentIndex == 3
                  ? Icons.person
                  : Icons.person_2_outlined),
              label: "MyPage"),
        ],
      ),
    );
  }
}
