import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/routes/routes.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:home_decor_app/features/login/presentation/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is LoginSuccess ||
              current is LoginFailure ||
              current is LoginLoading,
      listener: (context, state) {
        if (state is LoginLoading) {
          _setupLoadingSate(context);
        } else if (state is LoginSuccess) {
          context.pop();

          context.pushNamed(Routes.onboarding);
        } else if (state is LoginFailure) {
          context.pop();
          _setupErrorState(context, state);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void _setupErrorState(BuildContext context, LoginFailure state) {
    //context.pop();
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // icon: const Icon(Icons.error, color: Colors.red, size: 32),
          title: Text(
            "Error",
            style: TextStyle(fontSize: 15.sp, color: Colors.red),
          ),

          content: Text(
            state.errorMessage.allSignUpError(),
            style: TextStyles.font14DarkTaupeRegular,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: ColorsMananger.darkGray),
              ),
            ),
          ],
        );
      },
    );
  }

  _setupLoadingSate(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => Center(
            child: Container(
              width: context.screenWidth / 7,
              height: context.screenWidth / 7,
              decoration: BoxDecoration(
                color: ColorsMananger.darkBrown,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Transform.scale(
                scale: 0.4,
                child: CircularProgressIndicator(
                  color: ColorsMananger.ligthBrown,
                  strokeWidth: 5,
                ),
              ),
            ),
          ),
    );
  }
}
