import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_text_button.dart';
import 'package:home_decor_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:home_decor_app/features/search/presentation/widget/search_bloc_builder.dart';
import 'package:home_decor_app/features/search/presentation/widget/search_text_form_field.dart';
import 'package:home_decor_app/features/search/presentation/widget/slider_theme.dart';
import 'package:home_decor_app/features/search/presentation/widget/widget_colors.dart';
import 'package:home_decor_app/features/search/presentation/widget/widget_wrap.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: searchAppBar(context),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth / 26),
        child: Column(
          children: [
            SearchTextFormField(
              onTap: () {
                _showBottomSheet(context);
              },
            ),
            verticalSpace(30),
            const SearchBlocBuilder(),
          ],
        ),
      ),
    );
  }

  AppBar searchAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_outlined),
      ),
      title: Text("Search", style: TextStyles.font20LigthBrownSemiBold),
      centerTitle: true,
    );
  }

  void _showBottomSheet(BuildContext context) {
    final cubit = SearchCubit.get(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,

      builder: (_) {
        return BlocProvider.value(
          value: cubit,
          child: DraggableScrollableSheet(
            initialChildSize: 0.7,

            expand: false,
            minChildSize: 0.2,
            maxChildSize: 0.8,

            builder: (contextt, scrollController) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: context.customPadding.top / 5,
                      ),
                      width: context.screenWidth / 10,
                      height: context.screenHeight / 130,
                      decoration: BoxDecoration(
                        color: ColorsManager.darkGray,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          verticalSpace(35),
                          Center(
                            child: Text(
                              "Filter",
                              style: TextStyles.font15LigthBrownsemiBold,
                            ),
                          ),
                          verticalSpace(18),
                          Text(
                            "Price Range",
                            style: TextStyles.font12LigthBrownMedium,
                          ),
                          verticalSpace(14),

                          const WidgetSliderTheme(),

                          verticalSpace(26),
                          Text(
                            "Categories",
                            style: TextStyles.font12LigthBrownMedium,
                          ),
                          verticalSpace(20),
                          const WidgetWrap(width: 20.0, height: 8.0),

                          verticalSpace(20),
                          Text(
                            "Colors",
                            style: TextStyles.font12LigthBrownMedium,
                          ),
                        ],
                      ),
                    ),

                    verticalSpace(15),
                    const WidgetColors(),
                    // verticalSpace(20),
                    const Spacer(),
                    AppTextButton(
                      onTap: () {
                        context.read<SearchCubit>().getFilterResult(
                          color: cubit.colotId,
                          max: (cubit.maxPrice.round().toDouble()),
                          min: cubit.setMinPrice(),
                          sub: cubit.subCategoryId,
                        );
                        context.pop();
                      },
                      text: "Applay",
                      textStyles: TextStyles.font20LigthBrownSemiBold.copyWith(
                        fontSize: 18.sp,
                      ),
                      width: context.screenWidth / 2,
                      height: context.screenHeight / 20,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
