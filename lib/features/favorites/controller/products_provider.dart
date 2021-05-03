import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:my_app/models/product.dart';
import 'package:my_app/services/user_defaults.dart';
import 'package:my_app/shared/utils/index.dart';

abstract class ProductProvider with ChangeNotifier {
  List<Product> products = [];
  String get key;

  ProductProvider() {
    try {
      /// shopping
      final String? response =
          UserDefaults.instance.getObjectByKey(key) as String?;
      if (isNullOrEmpty(response)) {
        products = [];
      } else {
        final message = json.decode(response!);
        final list = message as List;
        products = list
            .map((item) => Product.fromMap(item as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      products = [];
    }
  }

  void _saveListProduct() {
    final myJsonString =
        jsonEncode(products.map((value) => value.toMap()).toList());
    UserDefaults.instance.setObject(key, myJsonString);
  }

  void addNewProduct(Product item) {
    products
      ..removeWhere((product) => product.id == item.id)
      ..insert(0, item);
    _saveListProduct();
    notifyListeners();
  }

  void removeAll() {
    products = [];
    _saveListProduct();
    notifyListeners();
  }

  void removeProduct(String id) {
    products.removeWhere((p) => p.id == id);
    _saveListProduct();
    notifyListeners();
  }
}
