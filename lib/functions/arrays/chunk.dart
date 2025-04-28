import 'package:byte_flow/functions/arrays/slice.dart';
import 'package:design_by_contract/annotation.dart';

part 'chunk.g.dart';

/// Creates an list of elements split into groups the length of `size`.
/// If `list` can't be split evenly, the final chunk will be the remaining elements.
/// Example
/// ```dart
/// _.chunk(['a', 'b', 'c', 'd'], 2);
/// // Returns ['a', 'b'],['c', 'd']
///
/// _.chunk(['a', 'b', 'c', 'd'], 3)
/// // Returns ['a', 'b', 'c'],['d']
/// ```


@FunctionContract(
  preconditions: {
    'size > 0' : 'size should be > 0',
  },
  postconditions: {
    'result is List<List>': 'result should be a List of Lists',
    'result.every((part) => part.length <= size)': 'chunks are in bigger size than they should',
  }
)
List _chunk(List list, [int size = 1]) {
  int index = 0;
  int resIndex = 0;
  List result = List.generate((list.length / size).ceil(), (i) => i);

  while (index < list.length) {
    result[resIndex++] = slice(list, index, (index += size));
  }
  

  return result;
}
