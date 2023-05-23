class ApiResponse {
  String code;
  String status;
  String data;

  ApiResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        code: json["code"],
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data,
      };
}
