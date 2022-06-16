class RemoveFromCartModel{
  String? message;

  RemoveFromCartModel.fromJson(Map<String,dynamic> json){
    message = json['message'];
  }  
}