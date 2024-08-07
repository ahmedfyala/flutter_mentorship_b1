import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/widgets/error_snack_bar_widget.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/auth/auth_cubit.dart';
import 'package:flutter_mentorship_b1/features/authentication/ui/register/widgets/have_account_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/styles.dart';
import '../../../../core/constants/app_assets.dart';
import '../widgets/divider_widget.dart';
import '../widgets/social_media_widget.dart';
import 'widgets/register_form_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is GoogleSignInFailure) {
          errorSnackBar(state.error, context);
        }
        if (state is GoogleSignInSuccess) {
          context.pushNamedAndRemoveUntil(
            Routes.homeScreen,
            predicate: (_) => false,
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppPng.rocket,
                ),
                verticalSpace(12.h),
                Text(
                  'Join SpaceX Updates!',
                  style: TextStyles.font24Bold,
                ),
                verticalSpace(5.h),
                Text(
                  'Stay informed on space missions with SpaceX',
                  style: TextStyles.font16light,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(10.h),
                const RegisterFormWidget(),
                const DividerWidget(),
                verticalSpace(20.h),
                const SocialMediaWidget(),
                verticalSpace(10.h),
                const HaveAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
