extension ExtentionList<T> on List<T?> {
  List<T>? filterNotNull() {
    return where((element) => element != null).map((e) => e!).toList();
  }

  List<E>? mapNotNull<E>(E? Function(T? value) transform) {
    return map((e) => transform(e)).toList().filterNotNull();
  }
}

extension MapExtention on Map<String, dynamic> {
  Map<String, dynamic> filterNotNull() {
    removeWhere((key, value) => value == null);
    return this;
  }

  Map<String, dynamic> filterNotNullOrBlank() {
    final map = this;
    map.removeWhere((key, value) => value == null || value == '');
    return map;
  }
}

extension ListTypeExtensionOptional<T> on List<T>? {
  T? getOrNull(int index) {
    if (this == null) return null;
    if (index <= (this?.length ?? 0)) {
      return this?.asMap()[index];
    }
    return null;
  }
}

/// extension for list any.
extension ListTypeExtension<T> on List<T> {
  T? getOrNull(int index) {
    if (index <= length) {
      return asMap()[index];
    }
    return null;
  }

  T? getOrNullAtLast(int index) {
    if (index <= length) {
      return asMap()[length - 1 - index];
    }

    return null;
  }
}
