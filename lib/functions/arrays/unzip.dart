import 'package:design_by_contract/annotation.dart';
part 'unzip.g.dart';

/// This method Returns the new list of regrouped elements
/// Example
/// ```dart
/// unzip([['a', 1, true], ['b', 2, false]]);
/// // Returns [['a', 'b'], [1, 2], [true, false]]
/// ```
/// Credit to [vikramcse](https://github.com/vikramcse/unzip-list)
@FunctionContract(
  preconditions: {
      'list.every((l) => l.length == list[0].length)': 'All inner lists must have the same length.'
  },
  postconditions: {
    'result.length == list[0].length': 'The number of sublists in the result must match the length of the first inner list.',
    'result.every((sublist) => sublist.length == list.length)': 'Each sublist in the result should have as many elements as the input list has.'
  }
)
List _unzip(List list) {
  var elements = list.length;
  var len = list[0].length;
  var result = [];

  for (var i = 0; i < len; i++) {
    var temp = [];
    for (var j = 0; j < elements; j++) {
      temp.add(list[j][i]);
    }
    result.add(temp);
  }

  return result;
}
