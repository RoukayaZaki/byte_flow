import 'package:design_by_contract/annotation.dart';

part 'capitalize.g.dart';

/// Capitalizes the given string
@FunctionContract(
  postconditions: {
    'result[0].toUpperCase() == result[0]': 'The first character of the result must be capitalized.',
    'result.substring(1) == text.substring(1)': 'The rest of the string must remain unchanged.'
  }
)
String _capitalize(String text) {
  return "${text[0].toUpperCase()}${text.substring(1)}";
}
