class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? dateCreated;
  String? hourCreated;
  String? token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.dateCreated,
    required this.hourCreated,
    required this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      dateCreated: map['date_created'],
      hourCreated: map['hour_created'],
      token: map['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }
}
