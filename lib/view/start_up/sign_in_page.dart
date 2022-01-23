import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'sns-sample',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: 'ユーザー名'),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'メールアドレス'),
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(hintText: 'パスワード'),
                    obscureText: true),
              ),
              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
