import 'package:design_by_contract/annotation.dart';

part 'tail.g.dart';

/// Gets all but the first element of list.
/// Example
/// ```dart
/// _.tail([1, 2, 3]);
/// // Returns [2, 3]
/// ```
@FunctionContract(
  
  postconditions: {
    'result.length == (list.length > 0 ? list.length - 1 : 0)': 'Result should exclude only the first item.'
  }
)
List _tail(List list) {
  list.removeAt(0);
  return list;
}
