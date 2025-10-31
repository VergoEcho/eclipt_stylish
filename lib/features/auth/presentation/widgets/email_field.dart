import 'package:eclipt_stylish/core/assets/assets.gen.dart';
import 'package:eclipt_stylish/utils/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Email text field with built-in validation
/// Uses theme InputDecorationTheme for styling
class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;

  const EmailField({super.key, required this.controller, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16) +
            const EdgeInsets.only(right: 16),
        hintText: context.strings.emailHint,
        prefixIcon: SvgPicture.asset(
          Assets.images.auth.person,
          height: 24,
          width: 24,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.strings.emailRequired;
        }
        if (!EmailValidator.validate(value)) {
          return context.strings.emailInvalid;
        }
        return null;
      },
    );
  }
}
