import 'package:design_by_contract/annotation.dart';

part 'compact.g.dart';


/// Creates an list with all falsey values removed. The values `false`, `null`,
/// `0`, `""`, and `NaN` are falsey.
/// Example
/// ```dart
/// _.compact([0, 1, false, 2, '', 3]);
/// // Returns [1, 2, 3]
/// ```

@FunctionContract(
  preconditions: {
    'list != null': 'Input list must not be null',
  },
  postconditions: {
    'result.every((value) => value != 0 && value != "" && value != false && !(value is double && value.isNaN))':
        'Resulting list must not contain falsy values (0, "", false, NaN)',
    'result.length <= list.length': 'Result list should not have more elements than input list',
  },
)
List _compact(List list) {
  List result = [];

  list.forEach((value) {
    if (value != 0 && value != "" && value != double.nan && value != false) {
      result.add(value);
    }
  });
  return result;
}
