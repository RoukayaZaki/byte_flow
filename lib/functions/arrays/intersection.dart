import 'package:design_by_contract/annotation.dart';

part 'intersection.g.dart';

/// Creates an list of unique values that are included in all given arrays
/// Example
/// ```dart
/// final lists = [
///   [1, 2, 3],
///   [2, 4, 5],
///   [2, 8, 9]
/// ];
/// intersect(lists);
/// // Returns [2]
///
/// ```
@FunctionContract(
  preconditions: {
    'arrays.isNotEmpty': 'Input must contain at least one array',
  },
  postconditions: {
    'arrays.every((list) => result.every((element) => list.contains(element)))': 
      'All elements in the result must exist in every input list',
  },
)
_intersect(List<List> arrays) {
  return arrays.fold<Set>(
      arrays.first.toSet(), (a, b) => a.intersection(b.toSet()));
}
