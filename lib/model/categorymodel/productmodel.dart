class ProductsModel{
  List<ProductsDataModel>? data;

  ProductsModel.fromJson(Map<String,dynamic> json){
    data = (json['data'] as List).map((e) => ProductsDataModel.fromJson(e)).toList();
  }
}

class ProductsDataModel{
  int? id;
  String? minPrice;
  String? maxPrice;
  int? branchId;
  List<ProductsImagesModel>? images;

  List<TranslationProductsModel>? translations;

  ProductsDataModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
    branchId = json['branch_id'];
    images = (json['images'] as List).map((e) => ProductsImagesModel.fromJson(e)).toList();
    translations = (json['translations'] as List).map((e) => TranslationProductsModel.fromJson(e)).toList();
  }
}



class ProductsImagesModel{
  int? productId;
  String? imageName;

  ProductsImagesModel.fromJson(Map<String,dynamic> json){
    productId = json['product_id'];
    imageName = json['image_name'];
  }

}

class TranslationProductsModel{
  int? id;
  int? productId;
  String? locale;
  String? productName;
  String? description;

  TranslationProductsModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    productId = json['product_id'];
    locale = json['locale'];
    productName = json['product_name'];
    description = json['description'];
  }
}


