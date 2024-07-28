import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wadiz_clone/view_model/login/login_view_model.dart';

class WidizAppShell extends ConsumerStatefulWidget {
  const WidizAppShell(
      {super.key, required this.child, required this.currentIndex});

  final Widget child;
  final int currentIndex;

  @override
  ConsumerState<WidizAppShell> createState() => _WidizAppShellState();
}

class _WidizAppShellState extends ConsumerState<WidizAppShell> {
  void _onNavBarTap(int idx) {
    // Always navigate to '/home' regardless of the tapped index
    GoRouter.of(context).go('/home');
  }

  void _onItemTapped(int index, BuildContext context) {
    final isLogin = ref.read(loginViewModelProvider).isLogin;

    switch (index) {
      case 1:
        if (isLogin) {
          GoRouter.of(context).push("/add");
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("로그인이 필요합니다."),
              content: Text("로그인이 필요한 서비스 입니다."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    GoRouter.of(context).go("/my");
                  },
                  child: Text("확인"),
                ),
              ],
            ),
          );
        }
        break;

      case 3:
        GoRouter.of(context).go("/my");
        break;

      default:
        GoRouter.of(context).go("/home");
        break;
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
