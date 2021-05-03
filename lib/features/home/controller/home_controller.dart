import 'package:flutter/material.dart';
import 'package:my_app/_dev/mock_product.dart';
import 'package:my_app/models/pagination.dart';
import 'package:my_app/models/product.dart';

class HomeProvider extends ChangeNotifier {
  Pagination<Product> journals = Pagination<Product>();
  HomeProvider() {
    refresh();
  }
  Future refresh() async {
    journals = Pagination<Product>();
    loadMore();
  }

  Future loadMore() async {
    journals.status = Status.loading;
    notifyListeners();
    final lastDoc = journals.lastDoc?.id ?? 0;
    final result = await MockProducts().getProduct(lastDoc);
    journals.addAll(result);
    notifyListeners();
  }
}
