import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../firebase_profile_controller.dart';

class FirebaseProfileForm extends StatelessWidget {
  FirebaseProfileForm({super.key});

  final FirebaseProfileController controller =
  Get.put(FirebaseProfileController());

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // 🔐 ensure init only once
  final RxBool _initialized = false.obs;

  void _initData() {
    if (_initialized.value) return;

    final args = Get.arguments as Map<String, dynamic>?;

    if (args != null) {
      nameController.text = args['name'] ?? '';
      phoneController.text = args['phone'] ?? '';
      controller.profile.value = Map<String, dynamic>.from(args);
    }

    controller.isChange.value = false;
    _initialized.value = true;
  }

  @override
  Widget build(BuildContext context) {
    _initData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Details"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.blue.shade100,
                  child: const Icon(Icons.person, size: 45),
                ),

                const SizedBox(height: 20),

                // 📛 Name
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => controller.checkChanges(
                    name: value,
                    phone: phoneController.text,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // 📞 Phone
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => controller.checkChanges(
                    name: nameController.text,
                    phone: value,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Phone number is required";
                    }
                    if (!GetUtils.isPhoneNumber(value)) {
                      return "Enter a valid phone number";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 25),

                // 💾 Save Button
                Obx(() {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.isChange.value
                          ? () {
                        if (_formKey.currentState!.validate()) {
                          controller.saveProfile(
                            name: nameController.text,
                            phone: phoneController.text,
                          );
                        }
                      }
                          : null,
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const Text("Save Profile"),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
