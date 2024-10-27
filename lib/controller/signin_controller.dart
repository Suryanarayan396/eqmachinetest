import 'package:eqsoftmachinetest/view/homepage/homepage.dart';
import 'package:flutter/material.dart';

class SigninController with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
//giving unique id &password to login
  final String adminId = "admin";
  final String adminPassword = "password123";

  String? errorMessage;
//signin conditions
  void signIntoApp(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (idController.text == adminId &&
          passwordController.text == adminPassword) {
        errorMessage = null;
        notifyListeners();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ),
          (route) => false,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Successful!')),
        );
      } else {
        errorMessage = 'Invalid ID or Password';
        notifyListeners();
      }
    }
  }
}
