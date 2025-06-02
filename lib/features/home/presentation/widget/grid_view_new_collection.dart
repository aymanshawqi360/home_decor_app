import 'package:flutter/material.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class GridViewNewCollection extends StatelessWidget {
  const GridViewNewCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 23,
          mainAxisSpacing: 15,
          mainAxisExtent: 250,
        ),
        itemBuilder: (context, index) {
          return Container(
            // width: 163.w,
            // height: 235.h,
            decoration: BoxDecoration(
              //color: Colors.grey
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  // height: 142.h,
                  height: MediaQuery.sizeOf(context).height / 5.9,
                  color: Colors.amber,
                ),
                Text("Aluminum chair", style: TextStyles.font15DarkBrownMedium),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                  style: TextStyles.font12DarkTaupeLight,
                ),
                Divider(color: ColorsMananger.ligthPink),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${120.00}",
                      style: TextStyles.font15LigthBrownMedium,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorsMananger.ligthPink,
                          maxRadius: 13,
                          minRadius: 13,
                          child: Center(
                            child: Icon(
                              Icons.favorite_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        horizontalSpace(5.23),
                        CircleAvatar(
                          backgroundColor: ColorsMananger.ligthPink,
                          radius: 13,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
