class ModelGetAllData {
  String name;
  String id;

  ModelGetAllData({
    required this.name,
    required this.id,
  });

  factory ModelGetAllData.fromJson(Map<String, dynamic> json) =>
      ModelGetAllData(
        name: json["name"],
        id: json["id"],
      );

  static List<ModelGetAllData> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ModelGetAllData.fromJson(json)).toList();
  }
}
