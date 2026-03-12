import 'package:clean_code_architecture_app/generated/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/local_storage_service.dart';
import '../../../../generated/colors.gen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnim = CurvedAnimation(parent: _ctrl, curve: Curves.easeIn);
    _scaleAnim = Tween<double>(
      begin: 0.82,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));

    _ctrl.forward();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    await Future.delayed(const Duration(milliseconds: 2200));
    if (!mounted) return;

    final token = locator<LocalStorageService>().accessToken;
    final hasToken = token != null && token.toString().trim().isNotEmpty;

    context.go(hasToken ? AppRoutes.messageView : AppRoutes.signInView);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ── Subtle radial glow behind logo ───────────────────────────
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -0.15),
                  radius: 0.75,
                  colors: [
                    ColorName.primary.withValues(alpha: 0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // ── Centre content ───────────────────────────────────────────
          Center(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: ScaleTransition(
                scale: _scaleAnim,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon badge
                    Container(
                      width: 88.w,
                      height: 88.w,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.auto_awesome_rounded,
                        size: 40.sp,
                        color: ColorName.primary,
                      ),
                    ),
                    20.verticalSpace,

                    // App name
                    Text(
                      'Rehab AI',
                      style: TextStyle(
                        fontFamily: FontFamily.montserrat,
                        fontSize: 36.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.4,
                      ),
                    ),
                    10.verticalSpace,

                    // Tagline
                    Text(
                      'Your personal rehab assistant',
                      style: TextStyle(
                        fontFamily: FontFamily.montserrat,
                        fontSize: 13.sp,
                        color: const Color(0xFF9A9A9A),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Bottom loader ─────────────────────────────────────────────
          Positioned(
            bottom: 52.h,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _fadeAnim,
              child: Column(
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: const CircularProgressIndicator(
                      color: ColorName.primary,
                      strokeWidth: 2.5,
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    'Loading…',
                    style: TextStyle(
                      fontFamily: FontFamily.montserrat,
                      fontSize: 11.sp,
                      color: const Color(0xFF9A9A9A),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
