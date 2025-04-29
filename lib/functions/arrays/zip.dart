import 'package:design_by_contract/annotation.dart';

part 'zip.g.dart';

/// Zips two arrays
/// [Credit](https://stackoverflow.com/questions/22015684/how-do-i-zip-two-arrays-in-javascript)
///
/// Example
/// ```dart
/// _.zip(['a', 'b', 'c'], [1, 2, 3]);
/// // Returns [['a', 1],['b', 2],['c', 3]]
/// ```
@FunctionContract(
  preconditions: {
    'a.length == b.length': 'Both input lists must have the same length.'
  },
  postconditions: {
    'result.length == a.length': 'The resulting list must have the same length as the input lists.',
    'result.every((pair) => pair.length == 2)': 'Each pair in the result should contain two elements.'
  }
)
List _zip(List a, List b) {
  return a.map((e) {
    final int index = a.indexOf(e);
    return [e, b[index]];
  }).toList();
}
