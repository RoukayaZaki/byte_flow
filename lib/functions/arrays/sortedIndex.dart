import 'package:byte_flow/helpers/baseSortedIndex.dart';
import 'package:design_by_contract/annotation.dart';

part 'sortedIndex.g.dart';
/// Uses a binary search to determine the lowest index
/// at which value should be inserted into list in order to maintain its sort order.
/// Returns the index at which value should be inserted into list.
/// Example
/// ```dart
/// _.sortedIndex([30, 50], 60);
/// // Returns 2
///
/// _.sortedIndex([30, 50], 40);
/// // Returns 1
///
/// _.sortedIndex([30, 50], 30);
/// // Returns 0
///```
@FunctionContract(
  postconditions: {
    'result >= 0 && result <= list.length': 'Returned index must be within list bounds.',
    '() { final newList = List.from(list)..insert(result, value); return _isSorted(newList); }()':
      'Inserting the value at the returned index must keep the list sorted.'
  }
)
int _sortedIndex(List list, dynamic value) {
  return baseSortedIndex(list, value);
}
