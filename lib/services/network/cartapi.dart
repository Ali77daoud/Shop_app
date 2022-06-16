import 'dart:convert';

import 'package:shop_app/model/cartmodels/addtocartmodel.dart';
import 'package:shop_app/model/cartmodels/getfromcart.dart';
import 'package:shop_app/model/cartmodels/removefromcart.dart';
import 'package:shop_app/utils/string.dart';
import 'package:http/http.dart' as http;

class CartApi{
  //addtocart
  static Future<AddToCartModel> addToCartApi(
    {
      required int userId,
      required int productId,
      required int quantity,
      required int maxPrice,
      required String token,
    }
  )async{
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/api/addToCart?user_id=$userId&product_id=$productId&quantity=$quantity&max_price=$maxPrice');
    var response = await client.post(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
      }
      );

    if(response.statusCode == 200){
      var responseData = json.decode(response.body);

      return AddToCartModel.fromJson(responseData);
    }
    else{
      throw Exception('مشكلة في الاتصال');
    }

  }
  ///get from cart
  
  static Future<GetFromCartModel> getFromCartApi(
      {
        required int userId,
        required String token,
      }
    )async{
      final client = http.Client();
      final uri = Uri.parse('$baseUrl/api/Cart?user_id=$userId');
      var response = await client.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
        }
        );

      if(response.statusCode == 200){
        var responseData = json.decode(response.body);
        if(responseData['message'] == "OK" ){
          print('not null');
          return GetFromCartModel.fromJson(responseData);
        }
        else{
          return throw Exception('لايوجد بيانات مستخدم');
        }
      }
      else{
        throw Exception('مشكلة في الاتصال');
      }

    }
  
  //remove from cart

  static Future<RemoveFromCartModel> removeFromCartApi(
    {
      required int userId,
      required int productId,
      required String token,
    }
  )async{
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/api/remove_From_Cart?user_id=$userId&product_id=$productId');
    var response = await client.delete(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
      }
      );

    if(response.statusCode == 200){
      var responseData = json.decode(response.body);

      return RemoveFromCartModel.fromJson(responseData);
    }
    else{
      throw Exception('مشكلة في الاتصال');
    }

  }

}
