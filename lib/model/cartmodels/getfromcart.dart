class GetFromCartModel{
  CartDataModel? data;
  String? message;
  int? status;

  GetFromCartModel.fromJson(Map<String,dynamic> json){
    data = CartDataModel.fromJson(json['data']);
    message = json['message'];
    status = json['status'];
  }
}

class CartDataModel{
  int? price_for_all_thing;
  // map? userData;
  int? count_items;
  List<CartProductDetailsModel>? Product_detailss;

  CartDataModel.fromJson(Map<String,dynamic> json){
    price_for_all_thing = json['price_for_all_thing'];
    count_items = json['count_items'];
    Product_detailss = (json['Product_detailss'] as List).map((e) => CartProductDetailsModel.fromJson(e)).toList();
  }
}

// class CartUserModel{
//   int? id;
//   String? first_name;
//   String? last_name;
// }

class CartProductDetailsModel{
  CartProductInfo? product_Info;
  int? price;
  int? total_price;
  String? product_quantity;

  CartProductDetailsModel.fromJson(Map<String,dynamic> json){
    product_Info = CartProductInfo.fromJson(json['product_Info']);
    price = json['price'];
    total_price = json['total_price'];
    product_quantity = json['product_quantity'];
  }
}

class CartProductInfo{
  int? id;
  String? product_number;
  int? brand_id;
  int? mcategory_id;
  int? subcategory_id;
  int? branch_id;
  String? product_name;
  String? description;
  List<TranslationCartProdeuctInfoModel>? translations;

  CartProductInfo.fromJson(Map<String,dynamic> json){
    id = json['id'];
    product_number = json['product_number'];
    brand_id = json['brand_id'];
    mcategory_id = json['mcategory_id'];
    subcategory_id = json['subcategory_id'];
    branch_id = json['branch_id'];
    product_name = json['product_name'];
    description = json['description'];
    translations = (json['translations'] as List).map((e) => TranslationCartProdeuctInfoModel.fromJson(e)).toList();
  }
}



class TranslationCartProdeuctInfoModel{
  int? id;
  int? product_id;
  String? locale;
  String? product_name;
  String? description;

  TranslationCartProdeuctInfoModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    product_id = json['product_id'];
    locale = json['locale'];
    product_name = json['product_name'];
    description = json['description'];
    
  }
}
