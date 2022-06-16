class LoginModel{
  String? accessToken;
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


// "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9vdXRsZXNoaXAuenpnb2xkZW4ub25saW5lXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjU1MjgxMjg3LCJuYmYiOjE2NTUyODEyODcsImp0aSI6IlZYOUFlZUE1bzdBZXZiVzciLCJzdWIiOjIwLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.SA7wS0mVCHD-ZS6mOCEv9fzpaur65z5BP-R_1lDUGEE",
//     "token_type": "bearer",
//     "expires_in": null,
//     "user": {
//         "id": 20,
//         "first_name": "ss",
//         "last_name": "dd",
//         "email": "aa.mm@xxx.mm",
//         "email_verified_at": null,
//         "mobile_number": "0999996999",
//         "created_at": "2022-06-07T07:46:12.000000Z",
//         "updated_at": "2022-06-07T07:46:12.000000Z"
//     }
// }