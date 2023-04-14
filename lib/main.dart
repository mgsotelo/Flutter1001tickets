import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter1001tickets/screens/auth_screen.dart';
import 'package:flutter1001tickets/screens/first_run_screen.dart';
import 'package:flutter1001tickets/screens/main_screen.dart';
import 'package:flutter1001tickets/utils/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstRun = prefs.getBool('isFirstRun') ?? true;
  runApp(MyApp(isFirstRun: isFirstRun));
}

class MyApp extends StatelessWidget {
  final bool isFirstRun;

  const MyApp({super.key, required this.isFirstRun});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1001 Tickets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: isFirstRun ? '/first-run' : '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/first-run': (context) => const FirstRunScreen(),
      },
      // home: const AppContainer(),
    );
  }
}
