import 'package:flutter/material.dart';
import 'package:matching_cats/consts.dart';

class EditModeUserInfoCard extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? cityController;
  final TextEditingController? phoneController;

  EditModeUserInfoCard({
    this.nameController,
    this.cityController,
    this.phoneController,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: kEmailCardColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name:   ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: TextField(
                            controller: nameController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'City:       ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: TextField(
                            controller: cityController,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Phone:  ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: TextField(
                            controller: phoneController,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Cats:',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Container(
                      color: Colors.grey.shade200, child: Icon(Icons.add)),
                  onPressed: () {
                    print('Add cat pressed');
                  },
                ),
              ],
            ),
          ),
          // ListView(),
        ],
      ),
    );
  }
}
