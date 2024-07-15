import 'dart:convert';
import 'package:http/http.dart' as http;
class LoginService {
   String mainUrl='https://energy-trading-platform.onrender.com/';
  LoginService(this.mainUrl);
  Future<Map<String, dynamic>> login(String email, String password) async {
    var loginUrl = Uri.parse('$mainUrl/api/login/Create');
    var response = await http.post(loginUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email, 
          'password':password, 
          }));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

// registration service
class RestrationService {
  final String baseUrl;

  RestrationService({required this.baseUrl});

  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phoneNumber,
    required String address,
    required String postalCode,
    required String password,
    required String confirmPassword,
  }) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
        'email': email,
        'phone_number': phoneNumber,
        'address': address,
        'postal_code': postalCode,
        'password': password,
        'confirm_password': confirmPassword,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register user');
    }
  }
}