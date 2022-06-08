import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/model/categorymodel/branchesmodel.dart';
import 'package:shop_app/model/categorymodel/maincategorymodel.dart';
import 'package:shop_app/model/categorymodel/subcategorymodel.dart';
import 'package:shop_app/utils/string.dart';

class CategoryApi{
  //get maincategory
  static Future<MainCategoryModel> getMainCategories()async{
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/api/MainCategories');
    var response = await client.get(
      uri,
      headers: {
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY1Mzk4MDU1NiwibmJmIjoxNjUzOTgwNTU2LCJqdGkiOiJHRzl3RTNoTEZjVXFGQzN0Iiwic3ViIjo0LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.yyiytKmCzrGZlZlI1SbfuPVpnLW7LhZJyatB7WfIxhU',
      }
      );

    if(response.statusCode == 200){
      var responseData = json.decode(response.body);
      if(responseData['data'] != null){
        return MainCategoryModel.fromJson(responseData);
      }
      else{
        return throw Exception('لا يوجد بيانات');
      }
    }
    else{
      throw Exception('مشكلة في الاتصال');
    }

  }
//subcategory
  static Future<SubCategoriesModel> getSubCategories()async{
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/api/SubCategories');
    var response = await client.get(
      uri,
      headers: {
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY1Mzk4MDU1NiwibmJmIjoxNjUzOTgwNTU2LCJqdGkiOiJHRzl3RTNoTEZjVXFGQzN0Iiwic3ViIjo0LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.yyiytKmCzrGZlZlI1SbfuPVpnLW7LhZJyatB7WfIxhU',
      }
      );

    if(response.statusCode == 200){
      var responseData = json.decode(response.body);
      if(responseData['data'] != null){
        return SubCategoriesModel.fromJson(responseData);
      }
      else{
        return throw Exception('لا يوجد بيانات');
      }
    }
    else{
      throw Exception('مشكلة في الاتصال');
    }

  }

//barnches
  static Future<BranchesModel> getBrunches()async{
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/api/Branches');
    var response = await client.get(
      uri,
      headers: {
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY1Mzk4MDU1NiwibmJmIjoxNjUzOTgwNTU2LCJqdGkiOiJHRzl3RTNoTEZjVXFGQzN0Iiwic3ViIjo0LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.yyiytKmCzrGZlZlI1SbfuPVpnLW7LhZJyatB7WfIxhU',
      }
      );

    if(response.statusCode == 200){
      var responseData = json.decode(response.body);
      if(responseData['data'] != null){
        return BranchesModel.fromJson(responseData);
      }
      else{
        return throw Exception('لا يوجد بيانات');
      }
    }
    else{
      throw Exception('مشكلة في الاتصال');
    }

  }

}