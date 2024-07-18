import 'dart:convert';
import 'package:energy_trade/backend/services/back_end_system/constants.dart';
import 'package:energy_trade/backend/services/service_api.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

Future<bool> userAuth(String email, String password) async {
  Map<String, String> body = {
    "email": email,
    "password": password,
  };

  var url = Uri.parse("$baseUrl/api/users/login/");
  var res = await http.post(url, body: body);

  if (res.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(res.body);
    String token = json['access'] ?? '';
    var box = await Hive.openBox('tokenBox');
    box.put("token", token);
    return true;
  } else {
    Map<String, dynamic> json = jsonDecode(res.body);
    if (json.containsKey("email")) {
      return Future.error(json["email"][0]);
    } else if (json.containsKey("password")) {
      return Future.error(json["password"][0]);
    } else if (json.containsKey("non_field_errors")) {
      return Future.error(json["non_field_errors"][0]);
    } else {
      return Future.error("An unknown error occurred.");
    }
  }
}

Future<dynamic> registerUser(
  String email,
  String password,
  String username,
  String firstName,
  String lastName,
  String phoneNumber,
  String postalCode,
) async {
  Map<String, String> data = {
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
    "email": email,
    "phone_number": phoneNumber,
    "postal_code": postalCode,
    "password": password,
  };

  var url = Uri.parse("$baseUrl/api/users/create/");
  var res = await http.post(url, body: data);

  if (res.statusCode == 201) {
    Map<String, dynamic> json = jsonDecode(res.body);
    if (json.containsKey("key")) {
      String token = json["key"];
      var user = await getUser(token); 
      return user;
    } else if (json.containsKey("email")) {
      return Future.error(json["email"][0]);
    } else if (json.containsKey("password")) {
      return Future.error(json["password"][0]);
    }
  } else {
    return Future.error(jsonDecode(res.body)["error"] ?? "An unknown error occurred.");
  }
}

Future<dynamic> getUser(String token) async {
  return null;
}

//explore page information

Future<List<NewsArticle>> fetchNewsArticles() async {
  final response = await http.get(Uri.parse('http://your-django-backend/api/news/'));

  if (response.statusCode == 200) {
    Iterable data = jsonDecode(response.body);
    return List<NewsArticle>.from(data.map((model) => NewsArticle.fromJson(model)));
  } else {
    throw Exception('Failed to load news articles');
  }
}

class NewsArticle {
  final String title;
  final String category;
  final String imageUrl;
  final String author;
  final String date;
  final String content;

  NewsArticle({
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.author,
    required this.date,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      category: json['category'],
      imageUrl: json['image_url'],
      author: json['author'],
      date: json['date'],
      content: json['content'],
    );
  }
}

//market place
class MarketClass {
  final String marketAPi = "$baseUrl/api/energy/";


  Future<List<Provider>> fetchProviders() async {
    final response = await http.get(Uri.parse(marketAPi));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Provider> providers = body.map((dynamic item) => Provider.fromJson(item)).toList();
      return providers;
    } else {
      throw Exception('Failed to load providers');
    }
  }
}