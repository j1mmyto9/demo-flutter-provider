import 'dart:math';

import 'package:my_app/models/product.dart';

class MockProducts {
  static final MockProducts _instance = MockProducts._internal();
  factory MockProducts() => _instance;
  MockProducts._internal();

  Future<List<Product>> getProduct(int from, {int count = 10}) async {
    await Future.delayed(const Duration(seconds: 1));
    final _temp = <Product>[];
    for (int i = from; i < min(from + count, 99); i++) {
      _temp.add(Product(i));
    }
    return _temp;
  }
}
