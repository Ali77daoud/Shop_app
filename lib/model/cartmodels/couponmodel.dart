class CouponCartModel{
  double? data;
  String? message;

  CouponCartModel.fromJson(Map<String,dynamic> json){
    data = json['data'];
    message = json['message'];
  }  
}