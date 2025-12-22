import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Obx(() {
        final user = controller.user.value;

        if (user == null) {
          return const Center(
            child: Text(
              "No user data found",
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              /// Profile Image
              CircleAvatar(
                radius: 45,
                backgroundImage: (user.user.profileImage.isNotEmpty)
                    ? NetworkImage(user.user.profileImage)
                    : null,
                child: (user.user.profileImage.isEmpty)
                    ? const Icon(Icons.person, size: 40)
                    : null,
              ),

              const SizedBox(height: 24),

              _infoTile("Full Name", user.user.fullName),
              _infoTile("Email", user.user.email),
              _infoTile("Phone", user.user.phoneNumber),
              _infoTile("Gender", user.user.gender),

              const SizedBox(height: 30),

              /// Logout Button (Optional)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.logout,
                  child: const Text("Logout"),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _infoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
