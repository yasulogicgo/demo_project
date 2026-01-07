import 'package:demo_app/Model/response_model.dart';
import 'package:demo_app/data/repo/ApiEndPoint.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logic_go_network/network/api_type.dart';
import '../../constant/app_constant.dart';

class AuthRepo {
  // Helper methods to get messages from Remote Config
  static String _getApiErrorMessage() {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('api_error_message');
  }

  static String _getMaintenanceMessage() {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('maintenance_message');
  }

  // Handle server-side errors (500, 502, 503, 504)
  static ResponseModel _handleServerError(int? statusCode) {
    if (statusCode == 503) {
      // Special message for maintenance / service unavailable
      return ResponseModel(
        message: _getMaintenanceMessage(),
        body: null,
        status: false,
      );
    }

    // Other server errors
    return ResponseModel(
      message: _getApiErrorMessage(),
      body: null,
      status: false,
    );
  }

  // ==================== Register API ====================
  static Future<ResponseModel> registerApi({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await restClient.post(
        APIType.public,
        body,
        path: ApiEndPoint.registerByEmail,
        headers: await requestHeader(APIType.public),
      );

      final int? statusCode = response.statusCode;
      _handleServerError(503);
      // Check for server errors (500–504)
      if (statusCode != null && statusCode >= 500 && statusCode <= 504) {
        return _handleServerError(statusCode);
      }

      ResponseModel responseModel = ResponseModel.fromJson(response.data);

      return ResponseModel(
        message: responseModel.message,
        body: responseModel.body,
        status: responseModel.status,
      );
    } catch (e) {
      // Network failure, timeout, no internet
      return ResponseModel(
        message: _getApiErrorMessage(),
        body: null,
        status: false,
      );
    }
  }

  // ==================== Login API ====================
  static Future<ResponseModel> loginApi({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await restClient.post(
        APIType.public,
        body,
        path: ApiEndPoint.loginByEmail,
        headers: await requestHeader(APIType.public),
      );

      final int? statusCode = response.statusCode;

      if (statusCode != null && statusCode >= 500 && statusCode <= 504) {
        return _handleServerError(statusCode);
      }

      ResponseModel result = ResponseModel.fromJson(response.data);

      return ResponseModel(
        message: result.message,
        body: result.body,
        status: result.status,
      );
    } catch (e) {
      return ResponseModel(
        message: _getApiErrorMessage(),
        body: null,
        status: false,
      );
    }
  }

  // ==================== Forgot Password API ====================
  static Future<ResponseModel> forgotPasswordApi({
    required Map<String, dynamic> email,
  }) async {
    try {
      final response = await restClient.post(
        APIType.public,
        email,
        path: ApiEndPoint.forgotPassword,
        headers: await requestHeader(APIType.public),
      );

      final int? statusCode = response.statusCode;

      if (statusCode != null && statusCode >= 500 && statusCode <= 504) {
        return _handleServerError(statusCode);
      }

      ResponseModel result = ResponseModel.fromJson(response.data);

      return ResponseModel(
        message: result.message,
        body: result.body,
        status: result.status,
      );
    } catch (e) {
      return ResponseModel(
        message: _getApiErrorMessage(),
        body: null,
        status: false,
      );
    }
  }

  // ==================== Resend Email OTP API ====================
  static Future<ResponseModel> reSendEmailOtoApi({
    required Map<String, dynamic> email,
  }) async {
    try {
      final response = await restClient.post(
        APIType.public,
        email,
        path: ApiEndPoint.resendEmailOtp,
        headers: await requestHeader(APIType.public),
      );

      final int? statusCode = response.statusCode;

      if (statusCode != null && statusCode >= 500 && statusCode <= 504) {
        return _handleServerError(statusCode);
      }

      ResponseModel result = ResponseModel.fromJson(response.data);

      return ResponseModel(
        message: result.message,
        body: result.body,
        status: result.status,
      );
    } catch (e) {
      return ResponseModel(
        message: _getApiErrorMessage(),
        body: null,
        status: false,
      );
    }
  }

  // ==================== Reset Password API ====================
  static Future<ResponseModel> resetPasswordApi({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await restClient.post(
        APIType.public,
        body,
        path: ApiEndPoint.resetPassword,
        headers: await requestHeader(APIType.public),
      );

      final int? statusCode = response.statusCode;

      if (statusCode != null && statusCode >= 500 && statusCode <= 504) {
        return _handleServerError(statusCode);
      }

      ResponseModel result = ResponseModel.fromJson(response.data);

      return ResponseModel(
        message: result.message,
        body: result.body,
        status: result.status,
      );
    } catch (e) {
      return ResponseModel(
        message: _getApiErrorMessage(),
        body: null,
        status: false,
      );
    }
  }

  // ==================== Verify OTP API ====================
  static Future<ResponseModel> verifyOtpApi({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await restClient.post(
        APIType.public,
        body,
        path: ApiEndPoint.verifyEmailOtp,
        headers: await requestHeader(APIType.public),
      );

      final int? statusCode = response.statusCode;

      if (statusCode != null && statusCode >= 500 && statusCode <= 504) {
        return _handleServerError(statusCode);
      }

      ResponseModel result = ResponseModel.fromJson(response.data);

      return ResponseModel(
        message: result.message,
        body: result.body,
        status: result.status,
      );
    } catch (e) {
      return ResponseModel(
        message: _getApiErrorMessage(),
        body: null,
        status: false,
      );
    }
  }
}