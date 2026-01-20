import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'talker_service.dart';

/// Custom BLoC observer that uses Talker for logging
class TalkerBlocObserverService extends BlocObserver {
  final TalkerBlocObserver _talkerObserver;

  TalkerBlocObserverService(TalkerService talkerService)
    : _talkerObserver = TalkerBlocObserver(
        talker: talkerService.talker,
        settings: const TalkerBlocLoggerSettings(
          enabled: true,
          printStateFullData: true,
          printEventFullData: true,
          printChanges: true,
          printClosings: true,
          printCreations: true,
          printEvents: true,
          printTransitions: true,
        ),
      );

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _talkerObserver.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _talkerObserver.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _talkerObserver.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _talkerObserver.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _talkerObserver.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    _talkerObserver.onClose(bloc);
  }
}
