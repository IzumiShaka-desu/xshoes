
import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
    Categories({
        this.categories,
        this.result,
    });

    List<String> categories;
    int result;

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categories: List<String>.from(json["categories"].map((x) => x)),
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "result": result,
    };
}
