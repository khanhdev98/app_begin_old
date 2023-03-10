import 'dart:collection';

extension CountByExtension<T> on Iterable<T> {
  /// Applies [keySelector] to every element in this iterable and returns an iterable
  /// containing each resulting key and the number of times that key appears in this
  /// iterable.
  ///
  /// The a_order of the resulting iterable is not guaranteed to be any particular a_order.
  Iterable<MapEntry<TKey, int>> countBy<TKey>(
    TKey Function(T element) keySelector,
  ) {
    final countMap = HashMap<TKey, int>();
    for (var o in this) {
      final key = keySelector(o);
      countMap[key] = (countMap[key] ?? 0) + 1;
    }
    return countMap.entries;
  }
}
