import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ForgotPasswordController.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final controller = Get.put(ForgotPasswordController());

  /// FORM KEY
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// EMAIL INPUT
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email is required!";
                  }
                  final emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                  if(!emailRegExp.hasMatch(value.trim())){
                    return "Enter a valid email address!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              /// LOADING + BUTTON
              ValueListenableBuilder(
                valueListenable: controller.isLoading,
                builder: (context, value, _) {
                  return value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.forgotPassword();
                      }
                    },
                    child: Text("Send Reset Link"),
                  );
                },
              ),

              const SizedBox(height: 20),

              /// API MESSAGE
              ValueListenableBuilder(
                valueListenable: controller.apiMessage,
                builder: (context, msg, _) {
                  if (msg.isEmpty) return SizedBox();
                  return Text(
                    msg,
                    style: TextStyle(
                      color: msg.contains("Failed")
                          ? Colors.red
                          : Colors.green,
                      fontSize: 16,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
