class RegisterModel{
  String? message;
  bool? accessToken;
  RegisterUserModel? user;

  

  RegisterModel.fromJson(Map<String,dynamic> json){
    message = json['message'];
    accessToken = json['access_token'];
    user = RegisterUserModel.fromJson(json['user']);
  }
}

class RegisterUserModel{
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? updatedAt;
  String? createdAt;
  int? id;

  RegisterUserModel.fromJson(Map<String,dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}

