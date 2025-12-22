import 'package:hive_flutter/hive_flutter.dart';
import '../../model/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveLoginData(UserModel model);
  UserModel? getLoginData();
  Future<void> clear();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String boxName = "authBox";
  static const String userKey = "loginData";

  Future<Box> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }
    return Hive.box(boxName);
  }

  @override
  Future<void> saveLoginData(UserModel model) async {
    final box = await _openBox();
    await box.put(userKey, model.toJson());
  }

  @override
  UserModel? getLoginData() {
    if (!Hive.isBoxOpen(boxName)) return null;

    final box = Hive.box(boxName);
    final data = box.get(userKey);

    if (data == null) return null;

    return UserModel.fromJson(Map<String, dynamic>.from(data));
  }

  @override
  Future<void> clear() async {
    final box = await _openBox();
    await box.clear();
  }
}
