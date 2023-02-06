extension NonNullExtension<T> on Iterable<T?> {
  /// Returns this iterable with all null values excluded.
  ///
  /// If this iterable doesn't contain any null values, the
  /// iterable will be unaffected.
  Iterable<T> nonNull() sync* {
    for (var o in this) {
      if (o != null) {
        yield o;
      }
    }
  }

  bool isNullOrEmpty() {
    if (isEmpty) {
      return true;
    }
    try {
      var nullE = firstWhere((element) => element == null);
      return nullE != null || isEmpty == true;
    } catch (e) {
      return false;
    }
  }
}

extension NullExtension<T> on Iterable<T?>? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}
