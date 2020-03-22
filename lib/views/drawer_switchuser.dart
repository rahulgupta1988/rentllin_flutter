

import 'package:flutter/material.dart';

import 'loggedUserView.dart';

class Drawer_SwitchUser extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Navigator.pop(context);
    var next_route= MaterialPageRoute(builder: (BuildContext context)=> LoggedUserView());
    Navigator.push(context, next_route);
    return null;
  }

}