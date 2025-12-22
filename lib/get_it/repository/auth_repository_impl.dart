
import '../../model/user_model.dart';
import '../auth/auth_local_data_source.dart';
import '../auth/auth_remote_data_source.dart';
import '../auth/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  AuthRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  Future<UserModel> login(Map<String, dynamic> body) async {
    final response = await remote.login(body);

    if (response.status) {
      final loginData = UserModel.fromJson(response.body);
      await local.saveLoginData(loginData);
      return loginData;
    } else {
      throw Exception(response.message);
    }
  }

  UserModel? getLocalUser() {
    return local.getLoginData();
  }
}
