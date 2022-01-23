import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Requester {
  String uri = 'http://localhost:3000';

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  final storage = new FlutterSecureStorage();

  Future<void> signInRequester(
      //Listの中身を後から入れるからFutureを使う
      String name, String email, String password) async {
    var signInUri = uri + '/auth';

    var request = AuthRequest(name: name, email: email, password: password);

    final response = await http.post(Uri.parse(signInUri),
        body: json.encode(request.toJson()), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> decoded = json.decode(response.body);
      print(decoded);
      var signInResponse = AuthResponse.fromJson(decoded);
      print(decoded["name"]);
      print(email);
      print(password);
      await storage.write(key: "name", value: signInResponse.name);
      await storage.write(key: "email", value: signInResponse.email);
      await storage.write(key: "password", value: signInResponse.password);
    } else {
      throw Exception("ログインに失敗しました");
    }
  }
}


}



class AuthResponse {
  final String name;
  final String email;
  final String password;

  AuthResponse.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        password = json['password'];

}

class AuthRequest {
  final String name;
  final String email;
  final String password;

  AuthRequest({
    this.name = "",
    this.email = "",
    this.password = "",
  });

  Map<String, dynamic> toJson() => {
    'password': password,
    'email': email,
    'name': name,
  };
}
