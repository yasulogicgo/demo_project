import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebase_auth_controller.dart';

class FirebaseRegister extends StatelessWidget {
  FirebaseRegister({super.key});

  final FirebaseAuthController auth = Get.find();
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),

            Obx(() => ElevatedButton(
              onPressed: auth.isLoading.value
                  ? null
                  : () => auth.register(email.text, pass.text),
              child: auth.isLoading.value
                  ? const CircularProgressIndicator()
                  : const Text("Create Account"),
            )),
          ],
        ),
      ),
    );
  }
}
