import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/todo_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/signin': (context) => const SignInScreen(),
  '/signup': (context) => const SignUpScreen(),
  '/todo': (context) => const TodoScreen(),
};
