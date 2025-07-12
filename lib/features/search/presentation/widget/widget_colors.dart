import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:home_decor_app/features/search/presentation/cubit/search_state.dart';

class WidgetColors extends StatelessWidget {
  const WidgetColors({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();

        return SizedBox(
          height: context.screenHeight / 15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: cubit.resultSearchColorsEntity.length,

            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  cubit.setColor(id: cubit.resultSearchColorsEntity[index].id);
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: index == 0 ? 8 : 8.0,
                  ),
                  child: Container(
                    width: context.screenWidth / 8,
                    height: context.screenHeight / 8,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      border: Border.all(
                        width: 2,
                        color:
                            cubit.colotId ==
                                    cubit.resultSearchColorsEntity[index].id
                                ? Colors.blueAccent
                                : Colors.transparent,

                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: (context.screenWidth / 10.8) * 1,
                        height: (context.screenHeight / 10.8) * 1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(
                            int.parse(
                              cubit.resultSearchColorsEntity[index].hex!
                                  .replaceAll('#', '0xff'),
                            ),
                          ),
                        ),
                      ),
                    ),
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
