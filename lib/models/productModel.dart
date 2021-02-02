class ProductModel {
  String title;
  ProductModel({this.title});

  factory ProductModel.fromJsom(Map<String, dynamic> json) {
    return ProductModel(title: json['title']);
  }
}
