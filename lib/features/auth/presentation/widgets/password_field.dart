import 'package:eclipt_stylish/core/assets/assets.gen.dart';
import 'package:eclipt_stylish/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Password text field with visibility toggle and built-in validation
/// Uses theme InputDecorationTheme for styling
class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;

  const PasswordField({
    super.key,
    required this.controller,
    this.focusNode,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: context.strings.passwordHint,
        prefixIcon: SvgPicture.asset(Assets.images.auth.lock, height: 20, width: 16,),
        suffixIcon: CupertinoButton(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          onPressed: _toggleVisibility,
          child: SvgPicture.asset(Assets.images.auth.eye, height: 20, width: 20,),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.strings.passwordRequired;
        }
        if (value.length < 6) {
          return context.strings.passwordTooShort;
        }
        return null;
      },
    );
  }
}
