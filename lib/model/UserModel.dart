class UserModel {
  String id;
  String name;
  String document;
  String email;
  String picture;
  String token;

  UserModel(
      {this.id,
        this.name,
        this.document,
        this.email,
        this.picture,
        this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    document = json['document'];
    email = json['email'];
    picture = json['picture'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['document'] = this.document;
    data['email'] = this.email;
    data['picture'] = this.picture;
    data['token'] = this.token;
    return data;
  }
}