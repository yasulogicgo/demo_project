
class ResponseModel {
  String message;
  dynamic body;
  bool status;

  ResponseModel({required this.message, required this.body, required this.status});

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      ResponseModel(message: json["message"] ?? '', body: json["body"], status: json["status"]);

  Map<String, dynamic> toJson() => {"message": message, "body": body, "status": status};
}
