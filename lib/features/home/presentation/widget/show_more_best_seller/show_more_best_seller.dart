import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/di/dependency_injection.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/home/presentation/cubit/show_more_best_seller/show_more_best_seller_cubit.dart';
import 'package:home_decor_app/features/home/presentation/widget/show_more_best_seller/show_more_best_seller_bloc_builder.dart';

class ShowMoreBestSeller extends StatelessWidget {
  const ShowMoreBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textScaler: TextScaler.linear(1.0),
          "Best Seller",
          style: TextStyles.font15LigthBrownSemiBold,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => BlocProvider(
                      create:
                          (context) =>
                              ShowMoreBestSellerCubit(getIt())..getShowMore(),
                      child: ShowMoreBestSellerBlocBuilder(),
                    ),
              ),
            );
          },
          child: Text("Show mor", style: TextStyles.font12DarkGrayMedium),
        ),
      ],
    );
  }
}
