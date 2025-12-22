import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebase_auth_controller.dart';

class FirebaseForgetPassword extends StatelessWidget {
  FirebaseForgetPassword({super.key});

  final FirebaseAuthController auth = Get.find();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => auth.resetPassword(email.text.trim()),
              child: const Text("Send Reset Link"),
            ),
          ],
        ),
      ),
    );
  }
}
