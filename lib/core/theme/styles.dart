import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/font_weight_helper.dart';

class TextStyles {
  static TextStyle font25LinenSemiBold = GoogleFonts.poppins(
    fontSize: 25.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsMananger.ligthPink,
  );
  static TextStyle font10DarkGrayishBrownMedium = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsMananger.darkGrayishBrown,
  );
  static TextStyle font18DarkligthBrownSemiBold = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsMananger.ligthBrown,
  );
  static TextStyle font14DarkTaupeRegular = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsMananger.darkTaupe,
  );
  static TextStyle font20LigthBrownSemiBold(BuildContext context) {
    return GoogleFonts.poppins(
      //  fontSize: MediaQuery.textScalerOf(context).scale(20),
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: ColorsMananger.ligthBrown,
    );
  }

  static TextStyle font20LigthPinkSemiBold(BuildContext context) {
    return GoogleFonts.poppins(
      // fontSize: MediaQuery.textScalerOf(context).scale(20),
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: ColorsMananger.ligthPink,
    );
  }

  static TextStyle font20DarkGrayishBrownSemiBold(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 20.sp,
      // fontSize: MediaQuery.textScalerOf(context).scale(20),
      fontWeight: FontWeightHelper.semiBold,
      color: ColorsMananger.darkGrayishBrown,
    );
  }

  static TextStyle font14DarkGrayishBrownRegular(BuildContext context) {
    return GoogleFonts.leagueSpartan(
      fontSize: 14.sp,
      //fontSize: MediaQuery.textScalerOf(context).scale(14),
      fontWeight: FontWeightHelper.regular,
      color: ColorsMananger.darkGrayishBrown,
    );
  }

  static TextStyle font15DarkGrayishBrownMedium(BuildContext context) {
    return GoogleFonts.leagueSpartan(
      fontSize: 15.sp,
      // fontSize: MediaQuery.textScalerOf(context).scale(15),
      fontWeight: FontWeightHelper.medium,
      color: ColorsMananger.darkGrayishBrown,
    );
  }

  static TextStyle font14LightBeigepinkRegular(BuildContext context) {
    return GoogleFonts.leagueSpartan(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsMananger.lightBeigepink,
    );
  }

  static TextStyle font15DarkGrayishBrownRegular(BuildContext context) {
    return GoogleFonts.leagueSpartan(
      fontSize: 15.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsMananger.darkGrayishBrown,
    );
  }

  static TextStyle font14DarkGrayishBrownSemiBold(BuildContext context) {
    return GoogleFonts.leagueSpartan(
      fontSize: 14.sp,
      //fontSize: MediaQuery.textScalerOf(context).scale(14),
      fontWeight: FontWeightHelper.semiBold,
      color: ColorsMananger.darkGrayishBrown,
    );
  }

  static TextStyle font13DarkGrayishBrownLight(BuildContext context) {
    return GoogleFonts.leagueSpartan(
      fontSize: 15.sp,
      // fontSize: MediaQuery.textScalerOf(context).scale(13),
      fontWeight: FontWeightHelper.light,
      color: ColorsMananger.darkGrayishBrown,
    );
  }

  static TextStyle font13LigthBrownLight(BuildContext context) {
    return GoogleFonts.leagueSpartan(
      fontSize: 15.sp,
      // fontSize: MediaQuery.textScalerOf(context).scale(13),
      fontWeight: FontWeightHelper.light,
      color: ColorsMananger.ligthBrown,
    );
  }

  static TextStyle font13LigthBrownMedium(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 13.sp,
      // fontSize: MediaQuery.textScalerOf(context).scale(15),
      fontWeight: FontWeightHelper.medium,
      color: ColorsMananger.darkGrayishBrown,
    );
  }

  static TextStyle font14DarkTaupeRegularLeagueSpartan =
      GoogleFonts.leagueSpartan(
        fontSize: 14.sp,
        // fontSize: MediaQuery.textScalerOf(context).scale(15),
        fontWeight: FontWeightHelper.regular,
        color: ColorsMananger.darkTaupe,
      );
  static TextStyle font14DarkTaupeSemiBoldLeagueSpartan =
      GoogleFonts.leagueSpartan(
        fontSize: 14.sp,
        // fontSize: MediaQuery.textScalerOf(context).scale(15),
        fontWeight: FontWeightHelper.semiBold,
        color: ColorsMananger.darkBrown,
      );
  static TextStyle font20darkGrayishBrownSemiBold = GoogleFonts.poppins(
    fontSize: 20.sp,
    // fontSize: MediaQuery.textScalerOf(context).scale(15),
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsMananger.darkGrayishBrown,
  );

  static TextStyle font14DarkBrownRegular = GoogleFonts.leagueSpartan(
    fontSize: 14.sp,
    // fontSize: MediaQuery.textScalerOf(context).scale(15),
    fontWeight: FontWeightHelper.regular,
    color: ColorsMananger.darkBrown,
  );
  static TextStyle font15DarkBrownMedium = GoogleFonts.poppins(
    fontSize: 15.sp,
    // fontSize: MediaQuery.textScalerOf(context).scale(15),
    fontWeight: FontWeightHelper.medium,
    color: ColorsMananger.darkBrown,
  );
  static TextStyle font15darkGrayishBrownMedium = GoogleFonts.poppins(
    fontSize: 15.sp,
    // fontSize: MediaQuery.textScalerOf(context).scale(15),
    fontWeight: FontWeightHelper.medium,
    color: ColorsMananger.darkBrown,
  );
}
