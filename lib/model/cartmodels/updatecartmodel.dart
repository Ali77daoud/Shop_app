class UpdateCartModel{
  String? message;

  UpdateCartModel.fromJson(Map<String,dynamic> json){
    message = json['message'];
  }  
}