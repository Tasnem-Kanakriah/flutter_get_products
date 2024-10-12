class ProductModel {
  String? title;
  String? category;
  double? price;
  List<String>? images;

  ProductModel({this.title, this.category, this.price, this.images});

  ProductModel.fromMap(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'];
    price = json['price'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['category'] = category;
    data['price'] = price;
    data['images'] = images;
    return data;
  }
}
