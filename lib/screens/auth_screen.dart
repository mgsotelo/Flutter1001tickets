import 'package:flutter/material.dart';
import 'package:flutter1001tickets/components/login_component.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // bool _isLoggedIn = false;
  int _selectedIndex = 0;

  List<Widget> widgetTypeOption() {
    return <Widget>[
      LoginComponent(
        onForgotSelected: _onForgotScreenSelected,
        onRegisterSelected: _onRegisterScreenSelected,
      ),
      const Text("Register"),
      const Text("Forgot Password"),
    ];
  }

  void _onRegisterScreenSelected() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  void _onForgotScreenSelected() {
    setState(() {
      _selectedIndex = 2;
    });
  }

  void _onLoginScreenSelected() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  // void _onLogin() {
  //   setState(() {
  //     _isLoggedIn = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: widgetTypeOption()[_selectedIndex],
    );
  }
}
