import 'package:byte_flow/functions/arrays/slice.dart';
import 'package:design_by_contract/annotation.dart';

part 'takeRight.g.dart';
/// Creates a slice of list with n elements taken from the end.
/// Example
/// ```dart
/// takeRight([1, 2, 3])
/// // => [3]
///
/// takeRight([1, 2, 3], 2)
/// // => [2, 3]
///
/// takeRight([1, 2, 3], 5)
/// // => [1, 2, 3]
///
/// takeRight([1, 2, 3], 0)
/// // => []
/// ```
bool listsEqual(List a, List b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}


@FunctionContract(
  preconditions: {
    'n >= 0': 'Number of elements to take must be non-negative.'
  },
  postconditions: {
    'result.length <= n': 'The returned list must contain at most n elements.',
    'listsEqual(result, list.sublist(list.length - result.length))': 'The returned list should maintain the order of the last n elements.'
  }
)
List _takeRight(List list, [int n = 1]) {
  if (list.isEmpty) {
    return [];
  }

  n = list.length - n;
  return slice(list, n < 0 ? 0 : n, list.length);
}
