import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_routes.dart';
import '../firebase_auth_controller.dart';

class FirebaseLogin extends StatelessWidget {
  FirebaseLogin({super.key});

  final FirebaseAuthController auth = Get.put(FirebaseAuthController());
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
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
                  : () => auth.login(email.text, pass.text),
              child: auth.isLoading.value
                  ? const CircularProgressIndicator()
                  : const Text("Login"),
            )),

            TextButton(
              onPressed: () =>
                  Get.toNamed(AppRoutes.firebaseForgetPassword),
              child: const Text("Forgot Password?"),
            ),
            TextButton(
              onPressed: () =>
                  Get.toNamed(AppRoutes.firebaseRegister),
              child: const Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}
