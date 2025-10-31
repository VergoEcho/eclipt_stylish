import 'package:eclipt_stylish/core/assets/assets.gen.dart';
import 'package:eclipt_stylish/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Repeat password text field with visibility toggle and password matching validation
/// Uses theme InputDecorationTheme for styling
class RepeatPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;
  final FocusNode? focusNode;

  const RepeatPasswordField({
    super.key,
    required this.controller,
    required this.passwordController,
    this.focusNode,
  });

  @override
  State<RepeatPasswordField> createState() => _RepeatPasswordFieldState();
}

class _RepeatPasswordFieldState extends State<RepeatPasswordField> {
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
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: context.strings.confirmPasswordHint,
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
          return context.strings.confirmPasswordRequired;
        }
        if (value != widget.passwordController.text) {
          return context.strings.passwordsDontMatch;
        }
        return null;
      },
    );
  }
}
