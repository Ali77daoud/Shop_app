import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/model/auth_models/loginmodel.dart';
import 'package:shop_app/model/auth_models/registermodel.dart';
import 'package:shop_app/utils/string.dart';

class AuthApi {
  //register

  static Future<RegisterModel> register(
    {
      required String name,
      required String lastName,
      required String email,
      required String password,
      required String repassword,
      required String number,
    }
  )async{
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/api/auth/register?first_name=$name&last_name=$lastName&email=$email&password=$password&password_confirmation=$repassword&mobile_number=$number');
    var response = await client.post(
      uri,
      headers: {
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY1Mzk4MDU1NiwibmJmIjoxNjUzOTgwNTU2LCJqdGkiOiJHRzl3RTNoTEZjVXFGQzN0Iiwic3ViIjo0LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.yyiytKmCzrGZlZlI1SbfuPVpnLW7LhZJyatB7WfIxhU',
      }
      );

    if(response.statusCode == 201){
      var responseData = json.decode(response.body);
      return RegisterModel.fromJson(responseData);
    }
    else{
      return throw Exception('خطأ في إنشاء حساب جديد');
    }
  }

  //logIn
  static Future<LoginModel> logIn(
    {
      required String email,
      required String password,
    }
  )async{
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/api/auth/login?email=$email&password=$password');
    var response = await client.post(
      uri,
      headers: {
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY1Mzk4MDU1NiwibmJmIjoxNjUzOTgwNTU2LCJqdGkiOiJHRzl3RTNoTEZjVXFGQzN0Iiwic3ViIjo0LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.yyiytKmCzrGZlZlI1SbfuPVpnLW7LhZJyatB7WfIxhU',
      }
      );

    if(response.statusCode == 200){
      var responseData = json.decode(response.body);
      return LoginModel.fromJson(responseData);
    }
    else{
      return throw Exception('خطأ في تسجيل الدخول');
    }
  }

}