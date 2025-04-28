import 'package:byte_flow/functions/arrays/slice.dart';
import 'package:design_by_contract/annotation.dart';

part 'drop.g.dart';
/// Creates a slice of `list` with `n` elements dropped from the beginning.
/// ```dart
/// drop([1, 2, 3])
/// // => [2,3]
///
/// drop([1, 2, 3], 2)
/// // => [3]
///
/// drop([1, 2, 3], 5)
/// // => []
///
/// drop([1, 2, 3], 0)
/// // => [1, 2, 3]
///
/// ```
@FunctionContract(
  preconditions: {
    'n >= 0': 'Number of elements to drop must not be negative',
  },
  postconditions: {
    'result.length <= list.length': 'Resulting list must not have more elements than input list',
  },
)
List _drop(List list, [int n = 1]) {
  return list.isEmpty ? [] : slice(list, n < 0 ? 0 : n, list.length);
}
