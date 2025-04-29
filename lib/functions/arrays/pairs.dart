import 'package:design_by_contract/annotation.dart';

part 'pairs.g.dart';

/// This method returns an object composed from key-value ```pairs```.
/// Example
/// ```dart
/// pairs([['a', 1], ['b', 2]]);
/// // Returns { 'a': 1, 'b': 2 }
/// ```

@FunctionContract(
  preconditions: {
    'pairs.every((pair) => pair is List && pair.length == 2)': 'Each item in pairs must be a list of exactly two elements.',
  },
  postconditions: {
    'result.keys.every((key) => pairs.any((pair) => pair[0] == key))': 'Each key in the result must have been in the original pairs list.',
    'result.length == pairs.length': 'The result must have the same number of entries as the pairs list. (There is some duplicate key)',
  },
)
Map _pairs(List pairs) {
  var index = -1, length = pairs.length, result = {};

  while (++index < length) {
    var pair = pairs[index];
    result[pair[0]] = pair[1];
  }
  return result;
}
