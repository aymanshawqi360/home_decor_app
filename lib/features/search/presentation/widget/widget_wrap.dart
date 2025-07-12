import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:home_decor_app/features/search/presentation/cubit/search_state.dart';

class WidgetWrap extends StatelessWidget {
  final double width;
  final double height;
  const WidgetWrap({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext contextt) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();

        return Wrap(
          spacing: width,
          runSpacing: height,
          children: List.generate(
            cubit.resultlistSearchSubCategoriesEntity.length,
            (index) {
              return Container(
                padding: EdgeInsets.only(
                  left: context.screenWidth / 20,
                  right: context.screenWidth / 20,
                  top: 5,
                  bottom: 5,
                ),

                decoration: BoxDecoration(
                  color:
                      cubit.resultlistSearchSubCategoriesEntity[index].id ==
                              cubit.subCategoryId
                          ? ColorsMananger.ligthBrown
                          : ColorsMananger.ligthPink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () {
                    cubit.setSubCategoryId(
                      query:
                          cubit.resultlistSearchSubCategoriesEntity[index].id,
                    );
                  },
                  child: Text(
                    cubit.resultlistSearchSubCategoriesEntity[index].name
                        .toString(),
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
