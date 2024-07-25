import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: _onNavBarTap,
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
