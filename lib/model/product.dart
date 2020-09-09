
import 'dart:convert';

import 'package:xshoes/model/shoes.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        this.shoes,
        this.result,
    });

    List<Shoe> shoes;
    int result;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        shoes: List<Shoe>.from(json["shoes"].map((x) => Shoe.fromJson(x))),
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "shoes": List<dynamic>.from(shoes.map((x) => x.toJson())),
        "result": result,
    };
}
