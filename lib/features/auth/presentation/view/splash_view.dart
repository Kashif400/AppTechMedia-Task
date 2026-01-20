import 'package:clean_code_architecture_app/generated/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../generated/colors.gen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  Future<void> _navigateToOnboarding() async {
    // Wait for 4 seconds
    await Future.delayed(const Duration(seconds: 4));

    context.go(AppRoutes.onBoardView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Ashtra\n',
                    style: TextStyle(
                      fontFamily: FontFamily.roboto,
                      fontSize: 33.sp,
                      color: const Color(0xFF9A9A9A),
                      fontWeight: FontWeight.w800,
                      height: 0.7,
                    ),
                  ),
                  TextSpan(
                    text: ' Ascend',
                    style: TextStyle(
                      fontFamily: FontFamily.roboto,
                      fontSize: 33.sp,
                      height: 1,
                      color: ColorName.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16.h,
              height: 16.h,
              child: const CircularProgressIndicator(
                color: ColorName.primary,
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
