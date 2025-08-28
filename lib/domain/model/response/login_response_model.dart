class LoginResponseModel {
  String? userId;
  String? error;

  LoginResponseModel({
    this.userId,
    this.error,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['error'] = error;
    return data;
  }
}
