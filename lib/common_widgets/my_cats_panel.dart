import 'package:flutter/material.dart';

class MyCatsPanel extends StatelessWidget {
  const MyCatsPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
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
    );
  }
}