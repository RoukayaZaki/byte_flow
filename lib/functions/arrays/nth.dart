import 'package:design_by_contract/annotation.dart';

part 'nth.g.dart';

/// Gets the element at index `n` of `list`. If `n` is negative, the nth
/// element from the end is returned.
/// Example
/// ```dart
/// _.nth(['a', 'b', 'c', 'd'], 2);
/// // Returns 'c'

/// _.nth(['a', 'b', 'c', 'd'], -1);
/// // Returns 'd'
///```
@FunctionContract(
  preconditions: {
    'n > -list.length && n < list.length' : 'n should be in range'
  },
  postconditions: {
    'result == null || result == list[(n + list.length) % list.length]': 'The result should either be null (out of bounds) or present in the list.',
  },
)
dynamic _nth(List list, int n) {
  if (list.length != 0) {
    n += n < 0 ? list.length : 0;
    try {
      return list[n];
    } on RangeError catch (_) {
      return null;
    }
  } else {
    return null;
  }
}
