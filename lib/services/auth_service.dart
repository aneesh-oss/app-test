import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class AuthService {

  static final String baseUrl = Platform.isMacOS
      ? "http://192.168.1.4:5000/api/auth"
      : "http://10.0.2.2:5000/api/auth";
  // Use 10.0.2.2 if you're on Android emulator and backend is running locally
  //static const baseUrl = "http://10.0.2.2:5000/api/auth"; 
  // static const baseUrl = "http://172.31.0.159:5000/api/auth";

  static Future<Map<String, dynamic>> signIn(String email, String password) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/signin"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      final data = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return {'success': true, 'token': data['token']};
      } else {
        return {'success': false, 'message': data['message'] ?? 'Sign In failed'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Server error. Check your connection.'};
    }
  }

  static Future<Map<String, dynamic>> signUp(String username, String email, String password, String confirmPassword) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/signup"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
        }),
      );

      final data = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return {'success': true, 'token': data['token']};
      } else {
        return {'success': false, 'message': data['message'] ?? 'Sign Up failed'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Server error. Check your connection.'};
    }
  }
}



// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class AuthService {
//   static const baseUrl = "http://localhost:3000"; // Update if needed

//   static Future<bool> signIn(String email, String password) async {
//     final res = await http.post(
//       Uri.parse("$baseUrl/signin"),
//       body: {'email': email, 'password': password},
//     );
//     return res.statusCode == 200;
//   }

//   static Future<bool> signUp(String email, String password) async {
//     final res = await http.post(
//       Uri.parse("$baseUrl/signup"),
//       body: {'email': email, 'password': password},
//     );
//     return res.statusCode == 200;
//   }
// }
