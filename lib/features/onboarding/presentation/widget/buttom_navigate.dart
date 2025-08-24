import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/constants/list_onboarding_description.dart';
import 'package:home_decor_app/core/helper/counter_change_notifier.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/routes/routes.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class ButtomNavigate extends StatelessWidget {
  final int index;
  const ButtomNavigate({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CounterChangeNotifier.counterChangeNotifier.counterNext(index: index);

        if (index == ListOnboardingDescription.listOnboarding.length - 1) {
          context.pushNamedAndRemoveUntil(
            Routes.login,
            predicate: (_) => false,
          );
        }
      },
      child: Container(
        width: 133.w,
        height: 41.h,
        decoration: BoxDecoration(
          color: ColorsManager.ligthPink,
          borderRadius: BorderRadius.circular(23.r),
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            CounterChangeNotifier.counterChangeNotifier.counter == 3
                ? "Get Started"
                : "Next",
            style: TextStyles.font18DarkligthBrownSemiBold,
          ),
        ),
      ),
    );
  }
}
