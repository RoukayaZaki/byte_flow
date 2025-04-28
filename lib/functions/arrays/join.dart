import 'package:design_by_contract/annotation.dart';

part 'join.g.dart';

/// Converts all elements in list into a string separated by separator.
/// Uses dart's ```List.join()```
/// Example
/// ```dart
/// _.join(['a', 'b', 'c'], '~');
/// // Returns 'a~b~c'
/// ```
bool listsEqual(List a, List b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}


@FunctionContract(
  postconditions: {
    'listsEqual(result.split(separator), list.map((e) => e.toString()).toList())':
        'Joined result must split back to the original list as strings',
  },
)
String _join(List list, [String separator = ',']) {
  return list.join(separator);
}
