import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wadiz_clone/shared/shared_pref_provider.dart';
import 'package:wadiz_clone/theme.dart';
import 'package:wadiz_clone/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(pref),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "wadiz",
      theme: wadizDefaultTheme,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      routerConfig: router,
      themeAnimationStyle: AnimationStyle(
        curve: Curves.easeInCirc,
        duration: Duration(milliseconds: 350),
      ),
    );
  }
}
