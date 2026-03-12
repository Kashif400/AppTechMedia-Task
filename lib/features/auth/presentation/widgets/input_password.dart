import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/login_bloc.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({super.key});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  final _obscurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _obscurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final subtitleColor = isDark
        ? const Color(0xFF8B8FA8)
        : const Color(0xFF787F88);
    final cs = theme.colorScheme;
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => current.password != previous.password,
      builder: (context, state) {
        return ValueListenableBuilder<bool>(
          valueListenable: _obscurePassword,
          builder: (context, obscure, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                5.verticalSpace,
                TextFormField(
                  obscureText: obscure,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: cs.primary,
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 20,
                        color: subtitleColor,
                      ),
                      onPressed: () =>
                          _obscurePassword.value = !_obscurePassword.value,
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (v.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },

                  onTapUpOutside: (event) => FocusScope.of(context).unfocus(),
                  onChanged: (v) => context.read<LoginBloc>().add(
                    PasswordChanged(password: v),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
