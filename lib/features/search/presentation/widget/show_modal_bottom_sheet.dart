import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class WidgetShowModalBottomSheet extends StatelessWidget {
  const WidgetShowModalBottomSheet({super.key});

  _showFilterModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          expand: false,
          maxChildSize: 0.9,
          minChildSize: 0.0,
          builder: (context, scrollController) {
            double _value = 100;
            List<double> list = [100, 500, 1000, 1500];

            return SizedBox(
              width: context.screenWidth,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: context.customPadding.top / 5),
                    width: context.screenWidth / 10,
                    height: context.screenHeight / 130,
                    decoration: BoxDecoration(
                      color: ColorsMananger.darkGray,
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
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 7.0,
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                          ),
                          child: Slider.adaptive(
                            max: 1500,
                            min: 100,
                            activeColor: ColorsMananger.ligthPink.withOpacity(
                              1,
                            ),
                            inactiveColor: ColorsMananger.lightBeigepink
                                .withOpacity(0.6),
                            thumbColor: ColorsMananger.ligthBrown,
                            label: "\$${_value.round()}",
                            overlayColor: WidgetStateColor.transparent,
                            divisions: list.length - 1,
                            value: _value,
                            onChanged: (c) {
                              // setModalState(() {
                              for (var l in list) {
                                debugPrint("${l}");
                                if (c >= l) {
                                  _value = l;
                                }
                              }
                              // });
                            },
                          ),
                        ),
                        verticalSpace(9),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                              list
                                  .map(
                                    (vlaue) => Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 0,
                                      ),
                                      child: Text(
                                        "\$${vlaue.toInt()}",
                                        style:
                                            TextStyles.font10DarkTaupeRegular,
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
            //  StatefulBuilder(
            //   builder: (context, setModalState) {

            //   },
            // );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Replace the ElevatedButton with your own widget, e.g. an Icon, GestureDetector, etc.
    return _showFilterModal(context);
    // GestureDetector(
    //   onTap: () => _showFilterModal(context),
    //   child:
    //    Container(
    //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    //     decoration: BoxDecoration(
    //       color: ColorsMananger.ligthPink,
    //       borderRadius: BorderRadius.circular(8),
    //     ),
    //     child: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Icon(Icons.filter_alt, color: Colors.white),
    //         SizedBox(width: 8),
    //         Text(
    //           'Show Filter Modal',
    //           style: TextStyle(color: Colors.white),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
