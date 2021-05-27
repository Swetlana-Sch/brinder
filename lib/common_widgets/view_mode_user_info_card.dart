import 'package:flutter/material.dart';
import 'package:matching_cats/providers/user_profile_provider.dart';
import 'package:provider/provider.dart';

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
                        Text(' Name:  ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
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
                        Text(' City:      ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
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
                        Text(' Phone:  ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                        Text(number!),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: Icon(Icons.add, size: 35,),
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
