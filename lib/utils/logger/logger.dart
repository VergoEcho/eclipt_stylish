import 'package:logger/logger.dart';

final log = Logger(
  printer: PrettyPrinter(
    methodCount: 1,    // Show 1 stack trace method
    lineLength: 110,   // Console line width
  ),
);
