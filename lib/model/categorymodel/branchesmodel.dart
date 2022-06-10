class BranchesModel{
  List<BranchesDataModel>? data;

  BranchesModel.fromJson(Map<String,dynamic> json){
    data = (json['data'] as List).map((e) => BranchesDataModel.fromJson(e)).toList();
  }
}

class BranchesDataModel{
  int? id;
  int? subcategoryId;
  // String? createdAt;
  // String? updatedAt;
  // String? branchName;
  // List<BranchesProductModel>? products;
  List<TranslationBranchesModel>? translations;

  BranchesDataModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    subcategoryId = json['subcategory_id'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // branchName = json['branch_name'];
    // products = (json['products'] as List).map((e) => BranchesProductModel.fromJson(e)).toList();
    translations = (json['translations'] as List).map((e) => TranslationBranchesModel.fromJson(e)).toList();
  }
}

// class BranchesProductModel{
//   int? id;
//   int? product_number;
//   String? product_date;
//   String? expiry_date;
//   String? min_price;
//   String? max_price;
//   String? minutes;
//   String? return_option;
//   String? avg_rating;
//   String? reviews_count;
//   String? brand_id;
//   String? mcategory_id;
//   String? subcategory_id;
//   String? branch_id;
//   String? deleted_at;
//   String? created_at;
//   String? updated_at;
//   String? product_name;
//   String? description;
//   String? status;
//   List<TranslationBranchesProductModel>? translations;

//   BranchesProductModel.fromJson(Map<String,dynamic> json){
//     id = json['id'];
//     product_number = json['product_number'];
//     product_date = json['product_date'];
//     min_price = json['min_price'];
//     max_price = json['max_price'];
//     minutes = json['minutes'];
//     return_option = json['return_option'];
//     avg_rating = json['avg_rating'];
//     reviews_count = json['reviews_count'];
//     brand_id = json['brand_id'];
//     mcategory_id = json['mcategory_id'];
//     subcategory_id = json['subcategory_id'];
//     branch_id = json['branch_id'];
//     deleted_at = json['deleted_at'];
//     created_at = json['created_at'];
//     updated_at = json['updated_at'];
//     product_name = json['product_name'];
//     description = json['description'];
//     status = json['status'];
//     translations = (json['translations'] as List).map((e) => TranslationBranchesProductModel.fromJson(e)).toList();
//   }
// }


class TranslationBranchesModel{
  int? id;
  int? barnchId;
  String? locale;
  String? branchName;

  TranslationBranchesModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    barnchId = json['branch_id'];
    locale = json['locale'];
    branchName = json['branch_name'];
  }
}

// class TranslationBranchesProductModel{
//   int? id;
//   int? productId;
//   String? locale;
//   String? productName;

//   TranslationBranchesProductModel.fromJson(Map<String,dynamic> json){
//     id = json['id'];
//     productId = json['product_id'];
//     locale = json['locale'];
//     productName = json['product_name'];
//   }
// }



