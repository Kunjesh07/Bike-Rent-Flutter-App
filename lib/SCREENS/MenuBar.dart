

import 'package:bike_rent/SCREENS/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class MenuBar extends StatefulWidget {
  @override
  State<MenuBar> createState() => _MenuBarState();

}

class _MenuBarState extends State<MenuBar> {
  Future getImagefromcamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      var _image = image;
    });
  }

  Future getImagefromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      var _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(25, 26, 45, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Accessories',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),

           decoration: BoxDecoration(
                color: Color.fromRGBO(25, 26, 45, 1),
                image: DecorationImage(
                    fit: BoxFit.fill, image: null,

                )
           ),
          ),
          ListTile(
            leading: Icon(Icons.verified_user, color: Colors.cyanAccent,),
            title: Text('Profile',
            style: TextStyle(color: Colors.white),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.cyanAccent,),
            title: Text('Settings',style: TextStyle(color: Colors.white),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color, color: Colors.cyanAccent,),
            title: Text('Feedback',style: TextStyle(color: Colors.white),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.cyanAccent,),
            title: Text('Logout',style: TextStyle(color: Colors.white),),
            onTap: () => {Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LoginPage()))},
          ),
        ],
      ),
    );
  }
}