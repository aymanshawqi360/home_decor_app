import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/search/presentation/widget/search_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(context),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth / 26),
        child: Column(
          children: [
            SearchTextFormField(
              onTap: () {
                print("object");
                _showFilterModal(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar searchAppBar(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.arrow_back_outlined),
      title: Text("Search", style: TextStyles.font20LigthBrownSemiBold),
      centerTitle: true,
    );
  }

  _widgetWrap({
    required BuildContext context,
    required List list,
    required double width,
    required double height,
  }) {
    return Wrap(
      spacing: width,
      runSpacing: height,
      children: List.generate(list.length, (index) {
        return Container(
          // margin: EdgeInsetsDirectional.only(
          //   start: (index == 0 || index == 3) ? 0 : 10,
          //   top: 5,
          // ),
          padding: EdgeInsets.only(
            left: context.screenWidth / 20,
            right: context.screenWidth / 20,
            top: 5,
            bottom: 5,
          ),
          // width: 50,
          // height: 20,
          decoration: BoxDecoration(
            color: ColorsMananger.ligthPink,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            list[index],
            style: TextStyle(color: Colors.black, fontSize: 13),
          ),
        );
      }),
    );
  }

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
            List<String> _categories = [
              "Bedroom",
              "Living Room",
              "Kitchen",
              "Office",
              "Dining Room",
            ];
            List<String> _products = [
              "Sofa",
              "Tables",
              "Cupboards",
              "Office Chairs",
              "Desktop Lamp",
              "Puff Chair",
              "Decor",
              "Nightstand",
            ];

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
                        verticalSpace(26),
                        Text(
                          "Categories",
                          style: TextStyles.font12LigthBrownMedium,
                        ),
                        verticalSpace(13),
                        // Wrap(
                        //   spacing: 20.0, // المسافة الأفقية بين العناصر
                        //   runSpacing: 8.0, // المسافة العمودية بين الأسطر
                        //   children: List.generate(_categories.length, (index) {
                        //     return Container(
                        //       // margin: EdgeInsetsDirectional.only(
                        //       //   start: (index == 0 || index == 3) ? 0 : 10,
                        //       //   top: 5,
                        //       // ),
                        //       padding: EdgeInsets.only(
                        //         left: context.screenWidth / 20,
                        //         right: context.screenWidth / 20,
                        //         top: 5,
                        //         bottom: 5,
                        //       ),
                        //       // width: 50,
                        //       // height: 20,
                        //       decoration: BoxDecoration(
                        //         color: ColorsMananger.ligthPink,
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       child: Text(
                        //         _categories[index],
                        //         style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 13,
                        //         ),
                        //       ),
                        //     );
                        //   }),
                        // ),
                        _widgetWrap(
                          context: context,
                          list: _categories,
                          width: 20.0,
                          height: 8.0,
                        ),
                        verticalSpace(22),
                        Text(
                          "Products",
                          style: TextStyles.font12LigthBrownMedium,
                        ),
                        verticalSpace(8.0),
                        _widgetWrap(
                          context: context,
                          list: _products,
                          width: 20.0,
                          height: 10.0,
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
}
