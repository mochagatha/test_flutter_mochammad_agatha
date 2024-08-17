class ModelUpdateData {
  String name;
  String id;

  ModelUpdateData({
    required this.name,
    required this.id,
  });

  factory ModelUpdateData.fromJson(Map<String, dynamic> json) =>
      ModelUpdateData(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
