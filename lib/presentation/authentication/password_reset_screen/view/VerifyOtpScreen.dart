import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../ForgotPasswordController.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({super.key});

  final controller = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Enter the 6-digit OTP sent to your email"),
            SizedBox(height: 20),

            /// OTP FIELD
            PinCodeTextField(
              appContext: context,
              controller: controller.otpController,
              length: 6,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 55,
                fieldWidth: 45,
              ),
              onChanged: (value) {},
            ),

            SizedBox(height: 20),

            /// TIMER TEXT
            ValueListenableBuilder(
              valueListenable: controller.secondsRemaining,
              builder: (context, seconds, _) {
                return Text(
                  seconds > 0
                      ? "Resend OTP in $seconds seconds"
                      : "Didn't receive OTP?",
                  style: TextStyle(fontSize: 16),
                );
              },
            ),

            SizedBox(height: 10),

            /// RESEND OTP BUTTON
            ValueListenableBuilder(
              valueListenable: controller.secondsRemaining,
              builder: (context, seconds, _) {
                return TextButton(
                  onPressed: seconds == 0 ? controller.resendOtp : null,
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(
                      color: seconds == 0 ? Colors.blue : Colors.grey,
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 20),

            /// VERIFY BUTTON
            ValueListenableBuilder(
              valueListenable: controller.isLoading,
              builder: (context, loading, _) {
                return loading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: controller.verifyOtp,
                  child: Text("Verify OTP"),
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
