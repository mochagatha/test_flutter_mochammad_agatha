class ModelDeleteData {
  String name;
  String id;

  ModelDeleteData({
    required this.name,
    required this.id,
  });

  factory ModelDeleteData.fromJson(Map<String, dynamic> json) =>
      ModelDeleteData(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
