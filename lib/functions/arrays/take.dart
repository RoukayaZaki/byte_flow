import 'package:design_by_contract/annotation.dart';

part 'take.g.dart';

/// Creates a slice of list with n elements taken from the beginning.
/// Uses dart's native ```List.take(n)``` method
/// Example
/// ```dart
/// _.take([1, 2, 3], 2);
/// // Returns [1, 2]
/// ```
@FunctionContract(
  preconditions: {
    'n >= 0': 'Number of elements to take must be non-negative.'
  },
  postconditions: {
    'result.length <= n': 'The returned list must contain at most n elements.',
    'result == list.take(result.length).toList()': 'The returned list should maintain the original order.'
  }
)
List _take(List list, [int n = 1]) {
  return list.take(n).toList();
}
