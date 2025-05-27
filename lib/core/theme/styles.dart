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
}
