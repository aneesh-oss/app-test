import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';
import '../services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match")),
        );
        return;
      }
      final result = await AuthService.signIn(email, password);
      if (result['success'] == true) {
        Navigator.pushReplacementNamed(context, '/todo');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['message'] ?? "Sign In Failed")),
        );
      }
      // final success = await AuthService.signUp(email, password);
      // if (success) {
      //   Navigator.pushReplacementNamed(context, '/todo');
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text("Sign Up Failed")),
      //   );
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Username"),
              validator: (val) => val == null || val.isEmpty ? "Enter username" : null,
              onChanged: (val) => username = val,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Email"),
              validator: validateEmail,
              onChanged: (val) => email = val,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
              validator: validatePassword,
              onChanged: (val) => password = val,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: "Confirm Password"),
              validator: validatePassword,
              onChanged: (val) => confirmPassword = val,
            ),
            const SizedBox(height: 20),
            CustomButton(text: "Sign Up", onPressed: _submit),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/signin'),
              child: const Text("Already have an account? Sign In"),
            )
          ]),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
// import '../utils/validators.dart';
// import '../widgets/custom_button.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String email = '';
//   String password = '';

//   void _submit() async {
//     if (_formKey.currentState!.validate()) {
//       final success = await AuthService.signIn(email, password);
//       if (success) {
//         Navigator.pushReplacementNamed(context, '/todo');
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Failed")));
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Sign In")),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(children: [
//             TextFormField(
//               decoration: const InputDecoration(labelText: "Email"),
//               validator: validateEmail,
//               onChanged: (val) => email = val,
//             ),
//             TextFormField(
//               obscureText: true,
//               decoration: const InputDecoration(labelText: "Password"),
//               validator: validatePassword,
//               onChanged: (val) => password = val,
//             ),
//             const SizedBox(height: 20),
//             CustomButton(text: "Sign In", onPressed: _submit),
//             TextButton(
//               onPressed: () => Navigator.pushReplacementNamed(context, '/signup'),
//               child: const Text("Don't have an account? Sign Up"),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
