class SubCategoriesModel{
  List<SubCategoryDataModel>? data;

  SubCategoriesModel.fromJson(Map<String,dynamic> json){
    data = (json['data'] as List).map((e) => SubCategoryDataModel.fromJson(e)).toList();
  }
}

class SubCategoryDataModel{
  int? id;
  String? photoName;
  int? mcategoryId;
  // String? createdAt;
  // String? updatedAt;
  // String? subcategoryName;
  // List<SubCategoryBranchesModel>? branches;
  List<TranslationSubCategoryModel>? translations;

  SubCategoryDataModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    photoName = json['photo_name'];
    mcategoryId = json['mcategory_id'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // subcategoryName = json['subcategory_name'];
    // branches = (json['branches'] as List).map((e) => SubCategoryBranchesModel.fromJson(e)).toList();
    translations = (json['translations'] as List).map((e) => TranslationSubCategoryModel.fromJson(e)).toList();
  }
}

// class SubCategoryBranchesModel{
//   int? id;
//   int? subcategoryId;
//   String? createdAt;
//   String? updatedAt;
//   String? branchName;
//   List<TranslationSubCategoryBranchesModel>? translations;

//   SubCategoryBranchesModel.fromJson(Map<String,dynamic> json){
//     id = json['id'];
//     subcategoryId = json['subcategory_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     branchName = json['branch_name'];
//     translations = (json['translations'] as List).map((e) => TranslationSubCategoryBranchesModel.fromJson(e)).toList();
//   }

// }
class TranslationSubCategoryModel{
  int? id;
  int? subcategoryId;
  String? locale;
  String? subcategoryName;

  TranslationSubCategoryModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    subcategoryId = json['subcategory_id'];
    locale = json['locale'];
    subcategoryName = json['subcategory_name'];
  }
}

// class TranslationSubCategoryBranchesModel{
//   int? id;
//   int? barnchId;
//   String? locale;
//   String? branchName;

//   TranslationSubCategoryBranchesModel.fromJson(Map<String,dynamic> json){
//     id = json['id'];
//     barnchId = json['branch_id'];
//     locale = json['locale'];
//     branchName = json['branch_name'];
//   }
// }

