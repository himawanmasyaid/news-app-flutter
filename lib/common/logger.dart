import 'package:logger/logger.dart';

var _logger = Logger(
  printer: PrettyPrinter(),
);

void setLog(String message) {
  _logger.d(message);
}
