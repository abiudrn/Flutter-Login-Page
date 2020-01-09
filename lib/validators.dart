import 'package:form_field_validator/form_field_validator.dart';

class Validators {
  static final requiredValidator =
      RequiredValidator(errorText: "field is required");

  static final emailValidator = EmailValidator(
    errorText: "Invalid email address",
  );

  static final passwordValidator = MultiValidator([requiredValidator]);
}
