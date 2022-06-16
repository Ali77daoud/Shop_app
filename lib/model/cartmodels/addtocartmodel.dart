class AddToCartModel{
  String? message;

  AddToCartModel.fromJson(Map<String,dynamic> json){
    message = json['message'];
  }  
}


