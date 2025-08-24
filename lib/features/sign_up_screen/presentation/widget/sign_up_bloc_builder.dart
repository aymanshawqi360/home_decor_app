import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/routes/routes.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/cubit/cubit/sign_up_state.dart';

class SignUpBlocBuilder extends StatelessWidget {
  const SignUpBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen:
          (previous, current) =>
              current is SignUpLoading ||
              current is SignUpFailure ||
              current is SignUpSuccess,
      listener: (context, state) {
        if (state is SignUpLoading) {
          setupLoadingSate(context);
        } else if (state is SignUpSuccess) {
          context.pop();
          context.pushNamedAndRemoveUntil(
            Routes.login,
            predicate: (_) => false,
          );
        } else if (state is SignUpFailure) {
          context.pop();
          setupErrorState(context, state);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  setupLoadingSate(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => Center(
            child: Container(
              width: context.screenWidth / 7,
              height: context.screenWidth / 7,
              decoration: BoxDecoration(
                color: ColorsManager.darkBrown,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Transform.scale(
                scale: 0.4,
                child: CircularProgressIndicator(
                  color: ColorsManager.ligthBrown,
                  strokeWidth: 5,
                ),
              ),
            ),
          ),
    );
  }

  void setupErrorState(BuildContext context, SignUpFailure state) {
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
            state.errormessage.allSignUpError(),
            style: TextStyle(fontSize: 15.sp),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
