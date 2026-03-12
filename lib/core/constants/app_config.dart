import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'enum.dart';
import 'env.dart';

class AppConfig {
  final String _env;

  // For local testing, change to ngrok URL (e.g., 'https://xxxxx.ngrok-free.app')
  final String _devBaseUrl = 'https://gateway.ashtra.ai';

  final String _testBaseUrl = 'https://gateway.ashtra.ai';
  final String _prodBaseUrl = 'https://api.ashtra.ai';

  late String _baseUrl;
  late String _stripeSecretKey;
  late String _stripePublishableKey;
  late Env _environment;

  /// Getters
  String get env => _env;
  Env get currentEnv => _environment;
  String get baseUrl => _baseUrl;
  String get appName => _environment.appName;
  bool get isDebug => _environment.isDebug;
  String get stripeSecretKey => _stripeSecretKey;
  String get stripePublishableKey => _stripePublishableKey;

  // Instance getters for network configuration
  int get connectionTimeout => 30000;
  int get receiveTimeout => 30000;

  /// Constructor
  AppConfig(this._env) {
    _environment = _getEnvFromString(_env);
    _setupBaseUrl();
    _setupStripeKeys();
    print('Environment: $_env');
    print('BASE_URL: $baseUrl');
    print(
      'STRIPE_PUBLISHABLE_KEY: ${_stripePublishableKey.isNotEmpty ? "${_stripePublishableKey.substring(0, 20)}..." : "Not configured"}',
    );
  }

  // Factory constructor for string-based environment
  factory AppConfig.fromString(String environment) {
    return AppConfig(environment);
  }

  Env _getEnvFromString(String environment) {
    switch (environment.toLowerCase()) {
      case 'dev':
      case 'development':
        return Env.dev;
      case 'prod':
      case 'production':
        return Env.prod;
      case 'test':
      case 'testing':
        return Env.test;
      default:
        return Env.prod; // Default to production
    }
  }

  _setupBaseUrl() {
    if (_env == 'prod' || _env == 'production') {
      _baseUrl = _prodBaseUrl;
    } else if (_env == 'test' || _env == 'testing') {
      _baseUrl = _testBaseUrl;
    } else if (_env == 'dev' || _env == 'development') {
      _baseUrl = _devBaseUrl;
    } else {
      _baseUrl = _prodBaseUrl;
    }
  }

  _setupStripeKeys() {
    try {
      // Safely access dotenv with fallback
      String getEnvValue(String key, String defaultValue) {
        try {
          return dotenv.env[key] ?? defaultValue;
        } catch (e) {
          print('Could not access dotenv key $key: $e');
          return defaultValue;
        }
      }

      if (_env == 'prod' || _env == 'production') {
        _stripeSecretKey = getEnvValue('STRIPE_SECRET_KEY_PROD', '');
        _stripePublishableKey = getEnvValue('STRIPE_PUBLISHABLE_KEY_PROD', '');
      } else {
        // Use dev/test keys for all non-production environments
        _stripeSecretKey = getEnvValue('STRIPE_SECRET_KEY_DEV', '');
        _stripePublishableKey = getEnvValue('STRIPE_PUBLISHABLE_KEY_DEV', '');
      }

      if (_stripeSecretKey.isEmpty || _stripePublishableKey.isEmpty) {
        print('Stripe keys not configured properly for environment: $_env');
        try {
          print('Available env keys: ${dotenv.env.keys.toList()}');
        } catch (e) {
          print('Could not list dotenv keys: $e');
        }
      }
    } catch (e, stack) {
      print('Error accessing dotenv in _setupStripeKeys: $e');
      print('Stack trace: $stack');
      // Set default empty values to prevent crashes
      _stripeSecretKey = '';
      _stripePublishableKey = '';
    }
  } // API Endpoints

  static const String loginEndpoint = '/auth/login';
  static const String signupEndpoint = '/auth/signup';
  static const String refreshTokenEndpoint = '/auth/refresh';
  static const String profileEndpoint = '/user/profile';

  // App Configuration
  static const String appVersion = '1.0.0';

  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String languageCodeKey = 'language_code';
  static const String themeKey = 'theme_mode';

  // Legacy static methods for backward compatibility (deprecated)
  static Env _currentEnv = Env.dev;

  @deprecated
  static Env get currentEnvStatic => _currentEnv;

  @deprecated
  static void setEnvironment(Env env) {
    _currentEnv = env;
  }

  @deprecated
  static String get baseUrlStatic => _currentEnv.baseUrl;

  @deprecated
  static String get appNameStatic => _currentEnv.appName;

  @deprecated
  static bool get isDebugStatic => _currentEnv.isDebug;
}
