import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/enum.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/flushbar_helper.dart';
import '../../../../widget/custom_button.dart';
import '../bloc/login_bloc.dart';

class SignInButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SignInButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (current, previous) =>
          current.postApiStatus != previous.postApiStatus,
      buildWhen: (previous, current) =>
          current.postApiStatus != previous.postApiStatus ||
          current.email != previous.email ||
          current.password != previous.password,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.success) {
          context.go(AppRoutes.messageView);
        } else if (state.postApiStatus == PostApiStatus.error) {
          FlushBarHelper.showErrorMessage(message: state.message);
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Sign In',
          isEnabled: state.email.isNotEmpty && state.password.isNotEmpty,
          isLoading: state.postApiStatus == PostApiStatus.loading,
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              context.read<LoginBloc>().add(SignInRequested());
            }
          },
        );
      },
    );
  }
}
