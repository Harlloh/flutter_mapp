import 'package:flutter/material.dart';
import 'package:my_app/data/constants.dart';
import 'package:my_app/data/notifiers.dart';
import 'package:my_app/views/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

//stateless
//stateful
//setState

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initThemeMode();
    super.initState();
  }

  Future<void> initThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool(KConstants.isDarkModeKey);
    isDarkModeNotifier.value = repeat ?? false;
  }

  //You can put variables here
  @override
  Widget build(BuildContext context) {
    //Or here (the variables here rebuild on every refresh)
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkModeNotifier.value
                  ? Brightness.dark
                  : Brightness.light,
            ),
          ),
          home: WelcomePage(),
        );
      },
    );
  }
}
