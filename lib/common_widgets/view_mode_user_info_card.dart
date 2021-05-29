import 'package:flutter/material.dart';

class ViewModeUserInfoCard extends StatelessWidget {
  final String? name;
  final String? city;
  final String? number;

  const ViewModeUserInfoCard({Key? key, this.name, this.city, this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          ' Name:  ',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(name!),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      indent: 50,
                      endIndent: 50,
                    ),
                    Row(
                      children: [
                        Text(
                          //TODO: refactor to spacebetween
                          ' City:      ',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(city!),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      indent: 50,
                      endIndent: 50,
                    ),
                    Row(
                      children: [
                        Text(
                          ' Phone:  ',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(number!),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // ListView(),
        ],
      ),
    );
  }
}
