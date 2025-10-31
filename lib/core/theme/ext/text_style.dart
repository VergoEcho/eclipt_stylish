import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle? {
  TextStyle? link(BuildContext context) =>
      this?.copyWith(
        decoration: TextDecoration.underline,
        decorationColor: this?.color,
        decorationThickness: .5,
      );
}
