import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_routes.dart';

class FirebaseProfileController extends GetxController {
  final CollectionReference<Map<String, dynamic>> db =
  FirebaseFirestore.instance.collection("users");

  final String uid = FirebaseAuth.instance.currentUser!.uid;

  // 🔄 States
  RxBool isLoading = false.obs;
  RxBool isChange = false.obs;

  // 📦 Profile data
  RxMap<String, dynamic> profile = <String, dynamic>{}.obs;

  // 🧠 Old values (NON-Rx → IMPORTANT)
  String _oldName = '';
  String _oldPhone = '';

  @override
  void onInit() {
    super.onInit();
    _loadProfileOnce();
  }

  // ===============================
  // 📥 Load profile (ONCE)
  // ===============================
  Future<void> _loadProfileOnce() async {
    try {
      isLoading.value = true;

      final snapshot = await db.doc(uid).get();

      if (snapshot.exists && snapshot.data() != null) {
        profile.value = snapshot.data()!;

        // store original values ONCE
        _oldName = profile.value['name'] ?? '';
        _oldPhone = profile.value['phone'] ?? '';
      } else {
        profile.clear();
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Error", "Failed to load profile");
    } finally {
      isLoading.value = false;
    }
  }

  // ===============================
  // 🔄 Realtime stream (READ ONLY)
  // ===============================
  Stream<DocumentSnapshot<Map<String, dynamic>>> profileStream() {
    return db.doc(uid).snapshots();
  }

  // ===============================
  // ✏️ Change detection (SAFE)
  // ===============================
  void checkChanges({
    required String name,
    required String phone,
  }) {
    final newName = name.trim();
    final newPhone = phone.trim();

    if (newName.isEmpty || newPhone.isEmpty) {
      isChange.value = false;
      return;
    }

    isChange.value =
        newName != _oldName || newPhone != _oldPhone;
  }

  // ===============================
  // 💾 Save / Update profile
  // ===============================
  Future<void> saveProfile({
    required String name,
    required String phone,
  }) async {
    if (!_validateProfile(name, phone)) return;

    try {
      isLoading.value = true;

      await db.doc(uid).set(
        {
          "name": name.trim(),
          "phone": phone.trim(),
          "email": FirebaseAuth.instance.currentUser?.email,
          "updatedAt": FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );

      // update old values after save
      _oldName = name.trim();
      _oldPhone = phone.trim();
      isChange.value = false;

      Get.offAllNamed(AppRoutes.firebaseProfile);
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Error", "Failed to save profile");
    } finally {
      isLoading.value = false;
    }
  }

  // ===============================
  // 🧹 Clear on logout
  // ===============================
  void clearProfile() {
    profile.clear();
    isChange.value = false;
    _oldName = '';
    _oldPhone = '';
  }

  // ===============================
  // ✅ Validation
  // ===============================
  bool _validateProfile(String name, String phone) {
    if (name.trim().isEmpty) {
      Get.snackbar("Validation Error", "Name cannot be empty");
      return false;
    }

    if (phone.trim().isEmpty) {
      Get.snackbar("Validation Error", "Phone number cannot be empty");
      return false;
    }

    if (!GetUtils.isPhoneNumber(phone)) {
      Get.snackbar("Validation Error", "Enter a valid phone number");
      return false;
    }

    return true;
  }
}
