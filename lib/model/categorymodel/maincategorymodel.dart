class MainCategoryModel{
  List<MainCategoryDataModel>? data;
  String? message;
  int? status;

  MainCategoryModel.fromJson(Map<String,dynamic> json){
    data = (json['data'] as List).map((e) => MainCategoryDataModel.fromJson(e)).toList();
    message = json['message'];
    status = json['status'];
  }
}

class MainCategoryDataModel{
  int? id;
  String? photoName;
  String? createdAt;
  String? updatedAt;
  String? categoryName;
  List<SubCategoryModel>? subcategories;
  List<TranslationCategoryDataModel?>? translations;

  MainCategoryDataModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    photoName = json['photo_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryName = json['category_name'];
    subcategories = (json['subcategories'] as List).map((e) => SubCategoryModel.fromJson(e)).toList();
    translations = (json['translations'] as List).map((e) => TranslationCategoryDataModel.fromJson(e)).toList();
  }
}

class SubCategoryModel{
  int? id;
  String? photoName;
  int? mcategoryId;
  String? createdAt;
  String? updatedAt;
  String? subcategoryName;
  List<TranslationSubCategoryDataModel>? translations;

  SubCategoryModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    photoName = json['photo_name'];
    mcategoryId = json['mcategory_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subcategoryName = json['subcategory_name'];
    translations = (json['translations'] as List).map((e) => TranslationSubCategoryDataModel.fromJson(e)).toList();
  }
}

class TranslationSubCategoryDataModel{
  int? id;
  int? subcategoryId;
  String? locale;
  String? subcategoryName;

  TranslationSubCategoryDataModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    subcategoryId = json['subcategory_id'];
    locale = json['locale'];
    subcategoryName = json['subcategory_name'];
  }
}

class TranslationCategoryDataModel{
  int? id;
  int? mcategoryId;
  String? locale;
  String? categoryname;

  TranslationCategoryDataModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    mcategoryId = json['mcategory_id'];
    locale = json['locale'];
    categoryname = json['category_name'];
  }
}

