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
 
      );

    if(response.statusCode == 201){
      var responseData = json.decode(response.body);
      if(responseData['user'] !=null ){
        print('not null');
        return RegisterModel.fromJson(responseData);
      }
      else{
        
        return throw Exception('لايوجد بيانات مستخدم');
      }
    }
    else{
      var responseData = json.decode(response.body);
      print(responseData);
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
      );

    if(response.statusCode == 200){
      var responseData = json.decode(response.body);
      if(responseData['user'] !=null ){
        print('not null');
        return LoginModel.fromJson(responseData);
      }
      else{
        return throw Exception('لايوجد بيانات مستخدم');
      }
    }
    else{
      return throw Exception('خطأ في تسجيل الدخول');
    }
  }

}