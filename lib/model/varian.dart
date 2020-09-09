
class Varian {
    Varian({
        this.varian,
        this.imageUrl,
        this.price,
    });

    String varian;
    String imageUrl;
    String price;

    factory Varian.fromJson(Map<String, dynamic> json) => Varian(
        varian: json["varian"],
        imageUrl: json["imageUrl"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "varian": varian,
        "imageUrl": imageUrl,
        "price": price,
    };
}
