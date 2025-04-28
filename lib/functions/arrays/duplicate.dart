import 'package:design_by_contract/annotation.dart';

part 'duplicate.g.dart';

/// Find duplicate items in an list
@FunctionContract(
  preconditions: {
    'list != null': 'Input list must not be null',
  },
  postconditions: {
    'result.every((e) => list.contains(e))': 'Result only contains elements from original list',
    'result.toSet().length == result.length': 'No duplicate elements in result list',
  },
)
List _duplicate(List list) {
  list.sort();
  final result = [];
  for (int i = 0; i < list.length - 1; i++) {
    if (list[i + 1] == list[i]) {
      result.add(list[i]);
    }
  }

  return result;
}
