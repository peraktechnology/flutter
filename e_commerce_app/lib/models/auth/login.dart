class Login {
  int? status;
  String? message;
  Data? data;

  Login({this.status, this.message, this.data});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? accessToken;
  String? tokenType;

  Data({this.user, this.accessToken, this.tokenType});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? address;
  Null? phone;
  Null? image;
  int? isAdmin;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? locale;

  User(
      {this.id,
        this.name,
        this.email,
        this.address,
        this.phone,
        this.image,
        this.isAdmin,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.locale});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    image = json['image'];
    isAdmin = json['is_admin'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['is_admin'] = this.isAdmin;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['locale'] = this.locale;
    return data;
  }
}