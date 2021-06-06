import 'package:flutter/material.dart';
import 'package:matching_cats/common_widgets/single_cat_item.dart';
import 'package:matching_cats/models/cat_model.dart';
import 'package:matching_cats/providers/user_data_provider.dart';
import 'package:provider/provider.dart';

class CatGreed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final catData = context.watch<UserDataProvider>();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: catData.myCats.length,
      itemBuilder:  (ctx, index)  {
        return SingleCatItem(catModel: catData.myCats[index]);
      },
    );
  }
}
