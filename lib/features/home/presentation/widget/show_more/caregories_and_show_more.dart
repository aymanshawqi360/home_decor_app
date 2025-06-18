import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/di/dependency_injection.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/home/presentation/cubit/show_more/show_more_cubit.dart';
import 'package:home_decor_app/features/home/presentation/widget/show_more/show_more_bloc_builder.dart';

class CaregoriesAndShowMore extends StatelessWidget {
  const CaregoriesAndShowMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Categories", style: TextStyles.font15LigthBrownSemiBold),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => BlocProvider(
                      create:
                          (context) => ShowMoreCubit(getIt())..getShowMore(),
                      child: ShowMoreBlocBuilder(),
                    ),
              ),
            );
          },
          child: Text("Show morw", style: TextStyles.font12DarkGrayMedium),
        ),
      ],
    );
  }
}
