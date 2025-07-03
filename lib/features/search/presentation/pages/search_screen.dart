import 'package:flutter/material.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
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
        child: Column(children: [SearchTextFormField()]),
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
}
