import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class FirebaseAuthController extends GetxController {
   final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;


  // 🔐 LOGIN
  Future<void> login(String email, String password) async {
    if (!_validate(email, password)) return;

    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // 👉 Go to profile (profile controller will handle loading)
      Get.offAllNamed(AppRoutes.firebaseProfile);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Login Failed", e.message ?? "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  // 📝 REGISTER
  Future<void> register(String email, String password) async {
    if (!_validate(email, password)) return;

    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // 👉 New user → fill profile
      Get.offAllNamed(AppRoutes.firebaseProfileForm);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Register Failed", e.message ?? "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  // 🔁 RESET PASSWORD
  Future<void> resetPassword(String email) async {
    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Enter valid email");
      return;
    }

    await _auth.sendPasswordResetEmail(email: email.trim());
    Get.snackbar("Success", "Reset link sent to email");
    Get.back();
  }

  // 🚪 LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed(AppRoutes.firebaseLogin);
  }

  bool _validate(String email, String password) {
    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Invalid email");
      return false;
    }
    if (password.length < 6) {
      Get.snackbar("Error", "Password must be 6+ characters");
      return false;
    }
    return true;
  }
}
