import 'dart:convert';

import 'package:shop_app/model/cartmodels/addtocartmodel.dart';
import 'package:shop_app/model/cartmodels/couponmodel.dart';
import 'package:shop_app/model/cartmodels/getfromcart.dart';
import 'package:shop_app/model/cartmodels/removefromcart.dart';
import 'package:shop_app/model/cartmodels/updatecartmodel.dart';
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
      throw Exception('مشكلة في جلب البيانات');
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
        throw Exception('مشكلة في جلب البيانات');
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
      throw Exception('مشكلة في جلب البيانات');
    }

  }

  //update cart

  static Future<UpdateCartModel> updateCartApi(
    {
      required int userId,
      required int productId,
      required int quantity,
      required int price,
      required String token,
    }
  )async{
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/api/update_cart?user_id=$userId&product_id=$productId&quantity=$quantity&price=$price');
    var response = await client.put(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
      }
      );

    if(response.statusCode == 200){
      var responseData = json.decode(response.body);

      return UpdateCartModel.fromJson(responseData);
    }
    else{
      throw Exception('مشكلة في جلب البيانات');
    }

  }
  
  //Coupon cart
  static Future<CouponCartModel> couponCartApi(
    {
      required String code,
      required double totalPrice,
      required String token,
    }
  )async{
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/api/coupons?code=$code&total_price=$totalPrice');
    var response = await client.post(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
      }
      );

    if(response.statusCode == 200){
      var responseData = json.decode(response.body);
      return CouponCartModel.fromJson(responseData);
    }
    else{
      var responseData = json.decode(response.body);
      throw Exception(responseData['message'].toString());
    }

  }
}
