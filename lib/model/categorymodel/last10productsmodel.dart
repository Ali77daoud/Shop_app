// class Last10ProductsModel{
//   int? id;
//   String? minPrice;
//   String? maxPrice;
  
//   List<ProductsImagesModel>? images;
//   List<TranslationProductsModel>? translations;

//   Last10ProductsModel.fromJson(Map<String,dynamic> json){
//     id = json['id'];
//     minPrice = json['min_price'];
//     maxPrice = json['max_price'];
//     images = (json['images'] as List).map((e) => ProductsImagesModel.fromJson(e)).toList();
//     translations = (json['translations'] as List).map((e) => TranslationProductsModel.fromJson(e)).toList();
//   }
// }

// class ProductsImagesModel{
//   int? id;
//   int? productId;
//   String? imageName;

//   ProductsImagesModel.fromJson(Map<String,dynamic> json){
//     id = json['id'];
//     productId = json['product_id'];
//     imageName = json['image_name'];
//   }

// }

// class TranslationProductsModel{
//   int? id;
//   int? productId;
//   String? locale;
//   String? productName;
//   String? description;

//   TranslationProductsModel.fromJson(Map<String,dynamic> json){
//     id = json['id'];
//     productId = json['product_id'];
//     locale = json['locale'];
//     productName = json['product_name'];
//     description = json['description'];
//   }
// }
