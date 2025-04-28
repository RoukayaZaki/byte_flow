import 'package:byte_flow/functions/arrays/slice.dart';
import 'package:design_by_contract/annotation.dart';

part 'initial.g.dart';
/// Gets all but the last element of list.
/// Example
/// ```dart
/// initial([1, 2, 3]);
/// // Returns [1, 2]
/// ```
@FunctionContract(
  postconditions: {
    'result.length == (list.isNotEmpty ? list.length - 1 : 0)': 
      'Result must have one less element than the input if not empty, otherwise empty',
  },
)
List _initial(List list) {
  return list.length != 0 ? slice(list, 0, -1) : [];
}
