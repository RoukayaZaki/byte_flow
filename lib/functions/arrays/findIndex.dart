import 'package:design_by_contract/annotation.dart';
part 'findIndex.g.dart';


/// This method uses dart's default List.indexOf
/// Example
/// ```dart
/// _.findIndex(["Jack", "Yash", "Adib", "Alex"], "Adib");
/// // Returns 2
/// ```
/// 
@FunctionContract(
  postconditions: {
    'result >= -1 && result < list.length': 'Result must be a valid index or -1',
    'result == -1 || list[result] == element': 'If result is not -1, it must point to the element',
  },
)
int _findIndex(List list, dynamic element) {
  return list.indexOf(element);
}
