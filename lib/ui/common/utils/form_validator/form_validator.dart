import 'package:mr_recipe/ui/common/values/values.dart';

class FormValidator {
  static String? isRequired(String? value) {
    if (value != null && value.isNotEmpty) return null;
    return MrStrings.thisFieldIsRequired;
  }

  static String? isRequiredInteger(String? value) {
    if (value != null && int.tryParse(value) != null) return null;
    return MrStrings.thisFieldMustContainIntegerNumbers;
  }
}
