import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/constants/enum.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignIn signInUseCase;
  final AuthRepository authRepository;

  LoginBloc({required this.signInUseCase, required this.authRepository})
    : super(const LoginState()) {
    on<SignInRequested>(_onFormSubmitted);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onFormSubmitted(
    SignInRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading, message: ''));

    final result = await signInUseCase(
      SignInParams(email: state.email, password: state.password),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          postApiStatus: PostApiStatus.error,
          message: failure.message,
        ),
      ),
      (user) => emit(state.copyWith(postApiStatus: PostApiStatus.success)),
    );
  }
}
