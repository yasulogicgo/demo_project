import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../routes/app_routes.dart';
import '../../../firbase_auth/firebase_auth_controller.dart';
import '../firebase_profile_controller.dart';

class FirebaseProfileScreen extends StatelessWidget {
  const FirebaseProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseProfileController controller =
    Get.put(FirebaseProfileController());
    final FirebaseAuthController auth =
    Get.put(FirebaseAuthController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.profileStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("No profile data found"),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: auth.logout,
                    child: const Text("Logout"),
                  ),
                ],
              ),
            );
          }

          final data = snapshot.data!.data()!;

          return Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(Icons.person, size: 60),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    data['name'] ?? '',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    data['email'] ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        _profileRow(
                          icon: Icons.phone,
                          label: "Phone",
                          value: data['phone'] ?? '',
                        ),
                        const Divider(height: 1),
                        _profileRow(
                          icon: Icons.email,
                          label: "Email",
                          value: data['email'] ?? '',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.edit),
                      label: const Text("Update Profile"),
                      onPressed: () {
                        Get.toNamed(
                          AppRoutes.firebaseProfileForm,
                          arguments: data, // ✅ plain map
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.logout),
                      label: const Text("Logout"),
                      onPressed: auth.logout,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _profileRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
