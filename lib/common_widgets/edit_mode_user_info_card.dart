import 'package:flutter/material.dart';
import 'package:matching_cats/theme.dart';

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
                          style: Theme.of(context).textTheme.bodyText2,
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
                          style: Theme.of(context).textTheme.bodyText2,
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
                          style: Theme.of(context).textTheme.bodyText2,
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
        ],
      ),
    );
  }
}
