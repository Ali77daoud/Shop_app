class FacebookUserModel{
  String? name;
  String? email;
  String? id;
  PictureModel? picture;

  FacebookUserModel.fromJson(Map<String,dynamic> json){
    name = json['name'];
    email = json['email'];
    id = json['id'];
    picture = PictureModel.fromJson(json['picture']['data']);
  }
}

class PictureModel{
  int? height;
  String? url;
  int? width;

  PictureModel.fromJson(Map<String,dynamic> json){
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }
}
