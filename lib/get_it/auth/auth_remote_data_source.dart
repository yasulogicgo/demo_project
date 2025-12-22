import 'package:demo_app/Model/response_model.dart';
import 'package:demo_app/data/repo/ApiEndPoint.dart';
import 'package:logic_go_network/network/api_type.dart';
import '../../../../constant/app_constant.dart';

abstract class AuthRemoteDataSource {
  Future<ResponseModel> login(Map<String, dynamic> body);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<ResponseModel> login(Map<String, dynamic> body) async {
    final response = await restClient.post(
      APIType.public,
      body,
      path: ApiEndPoint.loginByEmail,
      headers: await requestHeader(APIType.public),
    );

    return ResponseModel.fromJson(response.data);
  }
}
