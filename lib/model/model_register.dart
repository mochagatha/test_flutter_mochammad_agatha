class ModelRegister {
  User user;
  String token;

  ModelRegister({
    required this.user,
    required this.token,
  });

  factory ModelRegister.fromJson(Map<String, dynamic> json) => ModelRegister(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  String name;
  String email;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  String username;

  User({
    required this.name,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "username": username,
      };
}
