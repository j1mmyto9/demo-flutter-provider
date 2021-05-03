class Pagination<T> {
  List<T> data = [];
  bool hasMore = false;
  Status status = Status.none;
  final int pageCount = 10;
  bool get canNext => hasMore && status == Status.none;
  T? get lastDoc => data.isNotEmpty ? data.last : null;

  bool get isLoading => status == Status.loading;

  void addAll(List<T> items) {
    status = Status.none;
    if (items.length < pageCount) {
      hasMore = false;
    }
    data.addAll(items);
  }
}

enum Status { none, loading, error, success }
