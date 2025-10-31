import 'package:eclipt_stylish/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'scaffold_messenger.dart';

SnackBar snackBar(
  GlobalKey<ScaffoldMessengerState> scaffoldMessenger,
  String message, {
  double? bottomOffset,
  SnackBarType type = SnackBarType.info,
}) => SnackBar(
  behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.only(bottom: bottomOffset ?? 64),
  backgroundColor: Colors.transparent,
  elevation: 0,
  content: LayoutBuilder(
    builder: (layoutContext, constraints) {
      final maxWidth = constraints.maxWidth;
      return Container(
        width: maxWidth,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: type.background(layoutContext),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: type.border(layoutContext), width: 1),
        ),
        child: Row(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Icon(type.icon),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: scaffoldMessenger.currentContext?.textTheme.bodyMedium,
              ),
            ),
            SizedBox(width: 12),
            CupertinoButton(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              onPressed: scaffoldMessenger.currentState?.hideCurrentSnackBar,
              child: Icon(Icons.close_rounded),
            ),
          ],
        ),
      );
    },
  ),
);
