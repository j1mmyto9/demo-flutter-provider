class Product {
  int id;
  String get name => "Product $id";
  Product(this.id);

  Map<String, dynamic> toMap() {
    return {'id': id};
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(map['id'] as int);
  }
}
