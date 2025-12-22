import 'package:demo_app/Model/response_model.dart';
import 'package:demo_app/data/repo/ApiEndPoint.dart';
import 'package:logic_go_network/network/api_type.dart';
import '../../constant/app_constant.dart';



class AuthRepo {

  // Register user api
  static Future<ResponseModel> registerApi({ required Map<String,dynamic> body}) async{
    final response = await restClient.post(
      APIType.public,
      body,
      path: ApiEndPoint.registerByEmail,
      headers: await requestHeader(APIType.public),
     );

    ResponseModel responseModel = ResponseModel.fromJson(response.data);
    try {
      if (responseModel.status) {
        return ResponseModel(message: responseModel.message,
            body: responseModel.body,
            status: responseModel.status);
      }
      else {
        return ResponseModel(message: responseModel.message,
            body: responseModel.body,
            status: responseModel.status);
      }
    }catch(e){
      List<String> error = e.toString().split(': ');
      List<String> splitError = error[4].split(',');
      String finalError = splitError[0];
      return ResponseModel(message: finalError, body: null, status: false);
    }
  }

  // login user api
  static Future<ResponseModel> loginApi({required Map<String, dynamic> body}) async{
        final response = await restClient.post(
          APIType.public,
          body,
          path: ApiEndPoint.loginByEmail,
          headers: await requestHeader(APIType.public),
        );

        ResponseModel result = ResponseModel.fromJson(response.data);
    try{

      if(result.status){
        return ResponseModel(message: result.message, body: result.body, status: result.status);
      }
      else{
        return ResponseModel(message: result.message, body: result.body, status: result.status);
      }

    }
    catch(e){
      List<String> error = e.toString().split(': ');
      List<String> splitError = error[4].split(',');
      String finalError = splitError[0];
      return ResponseModel(message: finalError, body: null, status: false);
    }
  }

  // forgot password api // in body enter the email
  static Future<ResponseModel> forgotPasswordApi({ required Map<String, dynamic> email}) async{
    try{

      final response =  await restClient.post(
        APIType.public,
        email,
        path: ApiEndPoint.forgotPassword,
        headers: await requestHeader(APIType.public),
      );

      ResponseModel result = ResponseModel.fromJson(response.data);

      if(result.status){
        return ResponseModel(message: result.message, body: result.body, status: result.status);
      }
      else{
        return ResponseModel(message: result.message, body: result.body, status: result.status);
      }
    }
    catch(e){
      List<String> error = e.toString().split(': ');
      List<String> splitError = error[4].split(',');
      String finalError = splitError[0];
      return ResponseModel(message: finalError, body: null, status: false);
    }
  }

  // resend email opt api //if forget password api call after 1 min time out otp exapride and rest bu this api //in body enter the email
  static Future<ResponseModel> reSendEmailOtoApi({ required Map<String, dynamic> email}) async{
    try{
    final response =  await restClient.post(
      APIType.public,
      email,
      path: ApiEndPoint.resendEmailOtp,
      headers: await requestHeader(APIType.public),
    );
    ResponseModel result = ResponseModel.fromJson(response.data);


      if(result.status){
        return ResponseModel(message: result.message, body: result.body, status: result.status);
      }
      else{
        return ResponseModel(message: result.message, body: result.body, status: result.status);
      }
    }
    catch(e){
      List<String> error = e.toString().split(': ');
      List<String> splitError = error[4].split(',');
      String finalError = splitError[0];
      return ResponseModel(message: finalError, body: null, status: false);
    }
  }

  // rest password api // if user otp verify after in body email ,oldepassword and new password send
  static Future<ResponseModel> resetPasswordApi({ required Map<String, dynamic> body}) async{
    try{

    final response =  await restClient.post(
      APIType.public,
      body,
      path: ApiEndPoint.resetPassword,
      headers: await requestHeader(APIType.public),
    );
    ResponseModel result = ResponseModel.fromJson(response.data);


      if(result.status){
        return ResponseModel(message: result.message, body: result.body, status: result.status);
      }
      else{
        return ResponseModel(message: result.message, body: result.body, status: result.status);
      }
    }
    catch(e){
      List<String> error = e.toString().split(': ');
      List<String> splitError = error[4].split(',');
      String finalError = splitError[0];
      return ResponseModel(message: finalError, body: null, status: false);
    }

  }

  // verify otp api // in body email and otp requred
  static Future<ResponseModel> verifyOtpApi({ required Map<String, dynamic> body}) async {
    try {
    final response = await restClient.post(
      APIType.public,
      body,
      path: ApiEndPoint.verifyEmailOtp,
      headers: await requestHeader(APIType.public),
    );
    ResponseModel result = ResponseModel.fromJson(response.data);


      if (result.status) {
        return ResponseModel(
            message: result.message, body: result.body, status: result.status);
      }
      else {
        return ResponseModel(
            message: result.message, body: result.body, status: result.status);
      }
    }
    catch (e) {
      List<String> error = e.toString().split(': ');
      List<String> splitError = error[4].split(',');
      String finalError = splitError[0];
      return ResponseModel(message: finalError, body: null, status: false);
    }
  }
}