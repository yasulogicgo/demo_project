import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ForgotPasswordController.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final controller = Get.find<ForgotPasswordController>();

  bool showNewPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            /// NEW PASSWORD
            TextFormField(
              controller: controller.newPasswordController,
              obscureText: !showNewPassword,
              decoration: InputDecoration(
                labelText: "New Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    showNewPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      showNewPassword = !showNewPassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),

            /// CONFIRM PASSWORD
            TextFormField(
              controller: controller.confirmPasswordController,
              obscureText: !showConfirmPassword,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    showConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),

            /// BUTTON + LOADER
            ValueListenableBuilder(
              valueListenable: controller.isLoading,
              builder: (context, loading, _) {
                return loading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: controller.resetPassword,
                  child: Text("Reset Password"),
                );
              },
            ),

            SizedBox(height: 20),

            /// API MESSAGE
            ValueListenableBuilder(
              valueListenable: controller.apiMessage,
              builder: (context, msg, _) {
                if (msg.isEmpty) return SizedBox();
                return Text(
                  msg,
                  style: TextStyle(
                    color: msg.contains("Failed") ? Colors.red : Colors.green,
                    fontSize: 16,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
