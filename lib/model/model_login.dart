class ModelLogin {
  String token;

  ModelLogin({
    required this.token,
  });

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
