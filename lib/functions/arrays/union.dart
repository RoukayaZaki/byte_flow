import 'package:design_by_contract/annotation.dart';
import 'package:design_by_contract/annotation.dart';

part 'union.g.dart';
/// Creates an list of unique values, in order
///
/// Example
/// ```dart
/// _.union([
///  [2],
///  [1, 2]
/// ]);

/// // Returns [2, 1]
///```

@FunctionContract(
  postconditions: {
     'result.length == result.toSet().length': 'The returned list must contain unique elements.',
  }
)
_union(List<List> arrays) {
  return arrays.fold<Set>(arrays.first.toSet(), (a, b) => a.union(b.toSet()));
}
