class BrandsModel{
  List<BrandsDataModel>? data;

  BrandsModel.fromJson(Map<String,dynamic> json){
    data = (json['data'] as List).map((e) => BrandsDataModel.fromJson(e)).toList();
  }
}

class BrandsDataModel{
  int? id;
  String?logoName;
  String?brandName;

  BrandsDataModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    logoName = json['logo_name'];
    brandName = json['brand_name'];
  }
}


