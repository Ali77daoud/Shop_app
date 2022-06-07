class LoginModel{
  bool? accessToken;
  String? tokenType;
  LoginUserModel?user;


  LoginModel.fromJson(Map<String,dynamic> json){
    accessToken = json['access_token'];
    tokenType = json['tokenType'];
    user = LoginUserModel.fromJson(json['user']);
  }
}

class LoginUserModel{
  int?id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? updatedAt;
  String? createdAt;

  LoginUserModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }
}

