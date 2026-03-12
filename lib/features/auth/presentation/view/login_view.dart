import 'package:clean_code_architecture_app/widget/dark_swich_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widget/app_logo.dart';
import '../widgets/gradient_header.dart';
import '../widgets/input_email.dart';
import '../widgets/input_password.dart';
import '../widgets/sign_in_button.dart';
import '../widgets/soical_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cs = theme.colorScheme;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GradientHeader(
              primary: cs.primary,
              isDark: isDark,
              topPadding: topPadding,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _HeaderSection(topPadding: topPadding, primary: cs.primary),

                Transform.translate(
                  offset: const Offset(0, -28),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF252838) : Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(
                              alpha: isDark ? 0.35 : 0.1,
                            ),
                            blurRadius: 32,
                            spreadRadius: 0,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(24.w, 28.h, 24.w, 32.h),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hy, Welcome 👋',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Sign in to your account',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 21,
                              ),
                            ),
                            26.verticalSpace,

                            const InputEmail(),
                            18.verticalSpace,
                            const InputPassword(),

                            // ── Forgot password ────────────────
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                    vertical: 8.h,
                                  ),
                                ),
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: cs.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ),
                            ),
                            6.verticalSpace,
                            // ── Sign in button ─────────────────
                            SignInButton(formKey: _formKey),
                            20.verticalSpace,

                            // ── Divider ────────────────────────
                            Row(
                              children: [
                                Expanded(child: Divider()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Text(
                                    'or continue with',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(child: Divider()),
                              ],
                            ),
                            20.verticalSpace,

                            // ── Social buttons ─────────────────
                            Row(
                              children: [
                                Expanded(
                                  child: SocialButton(
                                    label: 'Google',
                                    icon: Icons.g_mobiledata_rounded,
                                    isDark: isDark,
                                    onTap: () {},
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: SocialButton(
                                    label: 'Apple',
                                    icon: Icons.apple_rounded,
                                    isDark: isDark,
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                16.verticalSpace,
              ],
            ),
          ),

          Positioned(
            top: topPadding + 10,
            right: 16,
            child: const DarkSwichButton(),
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final double topPadding;
  final Color primary;

  const _HeaderSection({required this.topPadding, required this.primary});

  @override
  Widget build(BuildContext context) {
    return // ── Hero section ──────────────────────────────
    SizedBox(
      height: topPadding + 220,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogo(size: 68, primary: primary),
              const SizedBox(height: 14),
              const Text(
                'Rehab AI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Your personal rehab assistant',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.75),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
