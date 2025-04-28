import 'package:design_by_contract/annotation.dart';

part 'findLastIndex.g.dart';
/// This method finds the item in the list from right / last
/// using dart's ```List.indexOf()``` method
/// Example
/// ```dart
/// _.findLastIndex(["Jack", "Yash", "Adib", "Adib"], "Adib");
/// // Returns 0
/// ```

@FunctionContract(
  postconditions: {
    'result >= -1 && result < list.length': 'Result must be a valid index or -1',
    'result == -1 || list[result] == element': 'If result is not -1, it must point to the element',
  },
)
int _findLastIndex(List list, dynamic element) {
  return list.reversed.toList().indexOf(element);
}
