import 'package:talker_logger/talker_logger.dart';

/// Custom logger wrapper that provides familiar logging methods
class AppLogger {
  final TalkerLogger _logger = TalkerLogger();

  void i(String message) {
    _logger.log(message, level: LogLevel.info);
  }

  void e(String message) {
    _logger.log(message, level: LogLevel.error);
  }

  void d(String message) {
    _logger.log(message, level: LogLevel.debug);
  }

  void w(String message) {
    _logger.log(message, level: LogLevel.warning);
  }

  void v(String message) {
    _logger.log(message, level: LogLevel.verbose);
  }
}

final AppLogger _appLogger = AppLogger();

AppLogger getLogger(String name) {
  return _appLogger;
}
