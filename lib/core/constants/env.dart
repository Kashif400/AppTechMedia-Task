import 'enum.dart';

extension EnvExtension on Env {
  String get name {
    switch (this) {
      case Env.dev:
        return 'dev';
      case Env.prod:
        return 'prod';
      case Env.test:
        return 'test';
    }
  }

  String get baseUrl {
    switch (this) {
      case Env.dev:
        return 'https://dev-api.ashtra.com';
      case Env.prod:
        return 'https://api.ashtra.com';
      case Env.test:
        return 'https://test-api.ashtra.com';
    }
  }

  String get appName {
    switch (this) {
      case Env.dev:
        return 'Ashtra Salon (Dev)';
      case Env.prod:
        return 'Ashtra Salon';
      case Env.test:
        return 'Ashtra Salon (Test)';
    }
  }

  bool get isDebug {
    switch (this) {
      case Env.dev:
      case Env.test:
        return true;
      case Env.prod:
        return false;
    }
  }
}
