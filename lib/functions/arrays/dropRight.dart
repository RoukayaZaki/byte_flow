import 'package:byte_flow/functions/arrays/slice.dart';
import 'package:design_by_contract/annotation.dart';

part 'dropRight.g.dart';

/// Creates a slice of `list` with `n` elements dropRightped from the beginning.
/// ```dart
/// dropRight([1, 2, 3])
/// // => [1,2]
///
/// dropRight([1, 2, 3], 2)
/// // => [1]
///
/// dropRight([1, 2, 3], 5)
/// // => []
///
/// dropRight([1, 2, 3], 0)
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
List _dropRight(List list, [int n = 1]) {
  n = list.length - n;
  return list.isEmpty ? [] : slice(list, 0, n < 0 ? 0 : n);
}
