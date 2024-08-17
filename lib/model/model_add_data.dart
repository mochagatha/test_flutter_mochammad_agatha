
class ModelAddData {
    String name;
    String id;

    ModelAddData({
        required this.name,
        required this.id,
    });

    factory ModelAddData.fromJson(Map<String, dynamic> json) => ModelAddData(
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
