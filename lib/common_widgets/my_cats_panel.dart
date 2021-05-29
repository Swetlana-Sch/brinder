import 'package:flutter/material.dart';
import 'package:matching_cats/providers/user_data_provider.dart';
import 'package:provider/provider.dart';

class MyCatsPanel extends StatelessWidget {
  const MyCatsPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catData = context.watch<UserDataProvider>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Cats:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  size: 35,
                ),
                onPressed: () {
                  print('Add cat pressed');
                },
              ),
            ],
          ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext cxt, int index) {
                return Row(
                  children: [
                    Text(catData.myCats[index].catName!)
                  ],
                );
              },
              itemCount: catData.myCats.length,
            ),
        ],
      ),
    );
  }
}
