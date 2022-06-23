class UpdateUserModel{
  String? message;
  String? token;
  UserDataModel? user;

  UpdateUserModel.fromJson(Map<String,dynamic> json){
    message = json['message'];
    token = json['token'];
    user = UserDataModel.fromJson(json['user']);
  }
}

class UserDataModel{
  int?id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? updatedAt;
  String? createdAt;

  UserDataModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }
}

