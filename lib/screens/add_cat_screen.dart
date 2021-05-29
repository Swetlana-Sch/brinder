import 'package:flutter/material.dart';
import 'package:matching_cats/common_widgets/drawer.dart';
import 'package:matching_cats/providers/user_data_provider.dart';
import 'package:provider/provider.dart';

class AddCatScreen extends StatefulWidget {
  static const routeName = '/add_cat_screen';
  @override
  _AddCatScreenState createState() => _AddCatScreenState();
}

class _AddCatScreenState extends State<AddCatScreen> {
  final _formKey = GlobalKey<FormState>();
  String? catName;

  @override
  Widget build(BuildContext context) {
    final catData = context.read<UserDataProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              print('Presses saved');
              print('cat name: $catName');
              if (_formKey.currentState!.validate()) {
                catData.saveCatData(
                    newName: catName!,
                    newImage: '',
                    newBread: 'Spss',
                    newPrice: 12,
                    newCity: 'vcc',
                    newAge: 4,
                    newCatDescription: 'dgdhghfug');
                Navigator.of(context).pop();
              };
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Text('Name:'),
                Expanded(
                  child: TextFormField(
                    onChanged: (String? newCatName) {
                      setState(() {
                        catName = newCatName;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the name';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
