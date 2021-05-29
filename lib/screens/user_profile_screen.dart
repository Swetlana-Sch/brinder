import 'package:flutter/material.dart';
import 'package:matching_cats/common_widgets/drawer.dart';
import 'package:matching_cats/common_widgets/edit_mode_user_info_card.dart';
import 'package:matching_cats/common_widgets/view_mode_user_info_card.dart';
import 'package:matching_cats/providers/user_data_provider.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  static const routeName = '/user-screen';

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool _isEditMode = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    final userData = Provider.of<UserDataProvider>(context, listen: false);
    nameController.text = userData.userName!;
    cityController.text = userData.userCity!;
    phoneController.text = userData.userPhoneNumber!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isEditMode =!_isEditMode;
              });
            },
            child: _isEditMode ? Icon(
              Icons.save,
            ) : Icon(Icons.edit),
          )
        ],
      ),
      body: _isEditMode == false
          ? ViewModeUserInfoCard(
              name: nameController.text,
              city: cityController.text,
              number: phoneController.text,
            )
          : EditModeUserInfoCard(
              nameController: nameController,
              cityController: cityController,
              phoneController: phoneController,
            ),
    );
  }
}
