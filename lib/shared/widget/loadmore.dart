import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/models/pagination.dart';
import 'package:my_app/shared/widget/indicator.dart';

class LoadMoreUI extends StatelessWidget {
  const LoadMoreUI(this.pagination, {required this.loadMore, Key? key})
      : super(key: key);

  final Pagination pagination;
  final void Function() loadMore;

  @override
  Widget build(BuildContext context) {
    if (pagination.canNext) {
      Timer(const Duration(milliseconds: 50), loadMore);
    }
    if (pagination.status == Status.loading) {
      return const Indicator();
    } else if (pagination.hasMore == false) {
      return const Text("The end");
    } else if (pagination.status == Status.error) {
      return InkWell(onTap: loadMore, child: const Text("Error, try again?"));
    } else {
      return const SizedBox.shrink();
    }
  }
}
