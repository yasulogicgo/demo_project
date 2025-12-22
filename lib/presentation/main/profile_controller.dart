import 'package:get/get.dart';

import '../../../../service_locator.dart';
import '../../get_it/auth/repository/auth_repository.dart';
import '../../model/user_model.dart';

class ProfileController extends GetxController {
  final AuthRepository repository = sl<AuthRepository>();

  final Rx<UserModel?> user = Rx<UserModel?>(null);

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  void loadUser() {
    user.value = repository.getLocalUser();
  }

  void logout() {
    // optional: clear local data later
    user.value = null;
  }
}
