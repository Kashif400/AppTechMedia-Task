import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter/foundation.dart';

/// Centralized logging service using Talker
class TalkerService {
  static final TalkerService _instance = TalkerService._internal();
  factory TalkerService() => _instance;
  TalkerService._internal();

  late final Talker _talker;

  Talker get talker => _talker;

  /// Initialize Talker with custom settings
  void initialize({
    TalkerLogger? logger,
    TalkerObserver? observer,
    TalkerSettings? settings,
  }) {
    _talker = Talker(
      logger:
          logger ??
          TalkerLogger(
            settings: TalkerLoggerSettings(
              enableColors: true,
              lineSymbol: '─',
              maxLineWidth: 110,
            ),
          ),
      observer: observer,
      settings:
          settings ??
          TalkerSettings(
            enabled: true,
            useConsoleLogs: kDebugMode,
            useHistory: true,
            maxHistoryItems: 1000,
          ),
    );
  }

  /// Log a general message
  void log(String message, {dynamic data}) {
    if (data != null) {
      _talker.log('$message - Data: $data');
    } else {
      _talker.log(message);
    }
  }

  /// Log debug information
  void debug(String message, {dynamic data}) {
    if (data != null) {
      _talker.debug('$message - Data: $data');
    } else {
      _talker.debug(message);
    }
  }

  /// Log info message
  void info(String message, {dynamic data}) {
    if (data != null) {
      _talker.info('$message - Data: $data');
    } else {
      _talker.info(message);
    }
  }

  /// Log warning message
  void warning(String message, {dynamic data}) {
    if (data != null) {
      _talker.warning('$message - Data: $data');
    } else {
      _talker.warning(message);
    }
  }

  /// Log error message
  void error(dynamic error, {StackTrace? stackTrace, String? message}) {
    if (message != null) {
      _talker.error('$message: $error', stackTrace);
    } else {
      _talker.error(error, stackTrace);
    }
  }

  /// Log critical error
  void critical(dynamic error, {StackTrace? stackTrace, String? message}) {
    if (message != null) {
      _talker.critical('$message: $error', stackTrace);
    } else {
      _talker.critical(error, stackTrace);
    }
  }

  /// Log verbose message (only in debug mode)
  void verbose(String message, {dynamic data}) {
    if (data != null) {
      _talker.verbose('$message - Data: $data');
    } else {
      _talker.verbose(message);
    }
  }

  /// Log HTTP request
  void logHttpRequest({
    required String method,
    required String url,
    Map<String, dynamic>? headers,
    dynamic body,
  }) {
    _talker.log(
      '🌐 HTTP $method Request: $url\nHeaders: $headers\nBody: $body',
    );
  }

  /// Log HTTP response
  void logHttpResponse({
    required String method,
    required String url,
    required int statusCode,
    dynamic body,
  }) {
    _talker.log('✅ HTTP $method Response ($statusCode): $url\nBody: $body');
  }

  /// Log HTTP error
  void logHttpError({
    required String method,
    required String url,
    required dynamic error,
    StackTrace? stackTrace,
  }) {
    _talker.error(
      '❌ HTTP $method Error: $url - ${error.toString()}',
      stackTrace,
    );
  }

  /// Get all logs history
  List<TalkerData> get history => _talker.history;

  /// Clear all logs
  void clearHistory() {
    _talker.cleanHistory();
  }

  /// Dispose resources
  void dispose() {
    _talker.disable();
  }
}
