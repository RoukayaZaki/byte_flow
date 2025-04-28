import 'package:design_by_contract/annotation.dart';

part 'flatten.g.dart';

/// Flatten a list
/// ```dart
/// List dataTypes = [[1, 2, 3], ['a', 'b', 'c'], [true, false, true]];
/// flatten(dataTypes)
/// // Returns [1, 2, 3, 'a', 'b', 'c', true, false, true]
/// ```
/// Credit goes to [Justin Fagnani](https://stackoverflow.com/users/192153/justin-fagnani)
@FunctionContract(
  preconditions: {
    'list.every((e) => e is Iterable)': 'Each element must be iterable (list, set, etc.)',
  },
  postconditions: {
    'result.every((e) => !(e is Iterable))': 'Result must be a flat list (no nested iterables)',
  },
)
List _flatten(List list) {
  return list.expand((element) => element).toList();
}
