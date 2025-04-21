import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome ToDo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome ToDo", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Sign In',
              onPressed: () => Navigator.pushNamed(context, '/signin'),
            ),
            CustomButton(
              text: 'Sign Up',
              onPressed: () => Navigator.pushNamed(context, '/signup'),
            ),
          ],
        ),
      ),
    );
  }
}
