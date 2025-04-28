import 'package:byte_flow/helpers/baseFill.dart';
import 'package:design_by_contract/annotation.dart';

part 'fill.g.dart';

/// Fills elements of `list` with `value` from `start` up to, but not
/// including, `end`.
/// Example
/// ```dart
/// _.fill(List(3), 4);
/// // Returns [4, 4, 4]
/// ```
@FunctionContract(
  preconditions: {
    'list != null': 'Input list must not be null',
    'start >= 0': 'Start index must be non-negative',
    'end == null || end >= start': 'End must be null or greater than or equal to start',
    'start <= list.length': 'Start must not exceed list length',
  },
  postconditions: {
    'result.length == list.length': 'Result list must have same length as original',
    'result.sublist(start, end ?? list.length).every((e) => e == value)': 'Filled range must have the given value',
  },
)
List _fill(List list, dynamic value, [int start = 0, int? end]) {
  int length = list.length;
  if (length <= 0) {
    return [];
  }
  end = end == null ? length : end;
  return baseFill(list, value, start, end);
}
