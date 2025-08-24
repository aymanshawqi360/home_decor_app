import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_text_form_field.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/cubit/cubit/sign_up_state.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/widget/visibility_in_textfrom_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController constantFullName;
  late TextEditingController constantUserName;
  late TextEditingController constantDateOfBirth;
  late TextEditingController constantConfirmPassword;
  late TextEditingController constantMobileNumber;
  late TextEditingController constantPassword;
  late TextEditingController constantEmail;
  @override
  void initState() {
    constantFullName = context.read<SignUpCubit>().constantFullName;
    constantUserName = context.read<SignUpCubit>().constantUserName;

    constantDateOfBirth = context.read<SignUpCubit>().constantDateOfBirth;
    constantConfirmPassword =
        context.read<SignUpCubit>().constantConfirmPassword;
    constantMobileNumber = context.read<SignUpCubit>().constantMobileNumber;
    constantPassword = context.read<SignUpCubit>().constantPassword;
    constantEmail = context.read<SignUpCubit>().constantEmail;
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    constantConfirmPassword.dispose();
    constantDateOfBirth.dispose();
    constantFullName.dispose();
    constantUserName.dispose();
    constantMobileNumber.dispose();
    constantPassword.dispose();
    constantEmail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Full name", style: TextStyles.font13LigthBrownMedium(context)),
          verticalSpace(3),

          AppTextFormField(
            controller: constantFullName,
            hintText: "Full name",
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return "You doesn't enter full name";
              }
            },
          ),
          verticalSpace(16),
          Text("User name", style: TextStyles.font13LigthBrownMedium(context)),
          verticalSpace(3),

          AppTextFormField(
            controller: constantUserName,
            hintText: "UserName",
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return "You doesn't enter user name";
              }
            },
          ),
          verticalSpace(16),
          Text("Email", style: TextStyles.font13LigthBrownMedium(context)),
          AppTextFormField(
            controller: constantEmail,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return "You doesn't enter email";
              }
            },
          ),
          verticalSpace(16),
          Text(
            "Mobile Number",
            style: TextStyles.font13LigthBrownMedium(context),
          ),
          verticalSpace(3),
          AppTextFormField(
            controller: constantMobileNumber,
            hintText: "+ 123 456 789",
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return "You doesn't enter mobile number";
              }
            },
          ),
          verticalSpace(16),

          Text(
            "Date of birth",
            style: TextStyles.font13LigthBrownMedium(context),
          ),
          verticalSpace(3),
          AppTextFormField(
            controller: constantDateOfBirth,
            hintText: "YYY/MM/DD ",
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return "You doesn't enter date of birth ";
              }
            },
          ),
          verticalSpace(16),
          Text("Password", style: TextStyles.font13LigthBrownMedium(context)),
          verticalSpace(3),
          BlocBuilder<SignUpCubit, SignUpState>(
            buildWhen: (previous, current) => current is SingUpisPasseord,
            builder: (context, state) {
              return AppTextFormField(
                controller: constantPassword,
                obscureText:
                    (state is SingUpisPasseord) ? state.isPasseord : true,
                suffixIcon: VisibilityInTextFromField(
                  onTap: () {
                    context.read<SignUpCubit>().cheackIsPassword();
                  },
                ),
                hintText: "● ● ● ● ● ● ● ● ● ",

                validator: (value) {
                  if (value?.isEmpty ?? value == null) {
                    return "You doesn't enter password ";
                  }
                },
              );
            },
          ),
          verticalSpace(16),
          Text(
            "Confirm Password",
            style: TextStyles.font13LigthBrownMedium(context),
          ),
          verticalSpace(3),
          BlocBuilder<SignUpCubit, SignUpState>(
            buildWhen:
                (previous, current) => current is SignUpisConfirmPasseord,
            builder: (context, state) {
              return AppTextFormField(
                controller: constantConfirmPassword,
                obscureText:
                    (state is SignUpisConfirmPasseord)
                        ? state.isConfirmPasseord
                        : true,

                suffixIcon: VisibilityInTextFromField(
                  onTap: () {
                    context.read<SignUpCubit>().cheackIsConfirmPassword();
                  },
                ),
                hintText: "● ● ● ● ● ● ● ● ● ",
                validator: (value) {
                  if (value?.isEmpty ?? value == null) {
                    return "You doesn't enter confirm password";
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
