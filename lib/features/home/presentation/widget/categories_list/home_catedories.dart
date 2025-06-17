import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/home/domain/entities/categories_entity.dart';
import 'package:home_decor_app/features/home/presentation/cubit/categories/categories_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/categories/categories_state.dart';

class HomeCatedories extends StatelessWidget {
  final CategoriesEntity categoryEntity;
  final int startIndex;

  const HomeCatedories({
    super.key,
    required this.startIndex,
    required this.categoryEntity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      buildWhen: (previous, current) => current is CategoriesSelection,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsetsDirectional.only(
            start: startIndex == 0 ? 1.w : 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              checkImage(
                context,
                (state is CategoriesSelection ? state.selectionNumber : -1)!
                    .toInt(),
              ),
              verticalSpace(7),
              categoryName(),
            ],
          ),
        );
      },
    );
  }

  Widget categoryName() {
    return Text(
      categoryEntity.name.toString(),
      style: TextStyles.font12LigthBrownSemiBold,
    );
  }

  Widget checkImage(BuildContext context, int selectionNumber) {
    return Container(
      // width: 64.0.w,
      width: context.screenWidth / 6,
      height: context.screenHeight / 13.5,
      decoration: BoxDecoration(
        color:
            selectionNumber == startIndex
                ? ColorsMananger.linen
                : ColorsMananger.white,
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: CachedNetworkImage(
        imageUrl: categoryEntity.icon.toString(),
        color:
            selectionNumber == startIndex
                ? ColorsMananger.ligthBrown
                : ColorsMananger.lightBeigepink,

        placeholder: (context, url) {
          return Container(
            width: 64.0.w,
            height: 64.0.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,

              borderRadius: BorderRadius.circular(13.r),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            width: 64.0.w,
            height: 64.0.h,
            decoration: BoxDecoration(
              color: ColorsMananger.lightBeigepink,

              borderRadius: BorderRadius.circular(13.r),
            ),
            child: Icon(Icons.error, color: Colors.red),
          );
        },
      ),
    );
  }
}
