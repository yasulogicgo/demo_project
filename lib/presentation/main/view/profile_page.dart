import 'package:demo_app/constant/constant_icons.dart';
import 'package:demo_app/shared_prefrences/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userTokon  = "";
  String userId = "";
  String fullName = "";
  String email = "";
  String profileImage = "";
  String phoneNumber = "";
  String gender = "";
  SharedPref sharedPref = SharedPref();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  /// Load all user data from SharedPref
  Future<void> _loadUserData() async {
    userTokon = await sharedPref.getStringData(key: "userTokon") ?? "";
    userId = await sharedPref.getStringData(key: "_id") ?? "";
    fullName = await sharedPref.getStringData(key: "name") ?? "";
    email = await sharedPref.getStringData(key: "email") ?? "";
    profileImage = await sharedPref.getStringData(key: "profile_photo") ?? "";
    phoneNumber = await sharedPref.getStringData(key: "phoneNumber") ?? "";
    gender = await sharedPref.getStringData(key: "gender") ?? "";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Profile Image
            Container(
              height: 110,
              width: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.grey.shade400, width: 1),
          ),
          child: ClipOval(
            child: profileImage.isNotEmpty
                ? Image.network(
              profileImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SvgPicture.asset(
                  ConstantIcons.logo,
                  fit: BoxFit.contain,
                );
              },
            )
                : SvgPicture.asset(
                ConstantIcons.logo,
              fit: BoxFit.contain,
            ),
          ),
          ),
            const SizedBox(height: 16),

            Text(
              fullName.isNotEmpty ? fullName : "Unknown User",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            _infoTile("User ID", userId),
            _infoTile("userTokonD", userTokon),
            _infoTile("Phone", phoneNumber),
            _infoTile("Gender", gender),
          ],
        ),
      ),
    );
  }

  /// Reusable display widget
  Widget _infoTile(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(value.isNotEmpty ? value : "Not available"),
      ),
    );
  }
}
