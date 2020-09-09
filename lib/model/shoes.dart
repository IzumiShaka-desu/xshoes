
import 'package:xshoes/model/varian.dart';

class Shoe {
    Shoe({
        this.id,
        this.brand,
        this.seriesname,
        this.detail,
        this.varian,
        this.stock,
        this.size,
        this.isnew,
        this.catname,
    });

    String id;
    String brand;
    String seriesname;
    String detail;
    List<Varian> varian;
    int stock;
    List<String> size;
    bool isnew;
    String catname;
    get brandConcatSeriesName=>'$brand $seriesname';
    factory Shoe.fromJson(Map<String, dynamic> json) => Shoe(
        id: json["id"],
        brand: json["brand"],
        seriesname: json["seriesname"],
        detail: json["detail"],
        varian: List<Varian>.from(json["varian"].map((x) => Varian.fromJson(x))),
        stock: int.parse(json["stock"]),
        size: json["size"].split(','),
        isnew: (int.parse(json["isnew"])==1),
        catname: json["catname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "seriesname": seriesname,
        "detail": detail,
        "varian": List<dynamic>.from(varian.map((x) => x.toJson())),
        "stock": stock,
        "size": size,
        "isnew": isnew,
        "catname": catname,
    };
}
