
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentllin_flutter/views/loginView.dart';

class Drawer_LogoutView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Navigator.pop(context);
    var next_route= MaterialPageRoute(builder: (BuildContext context)=> LoginView());
    Navigator.push(context, next_route);
    return null;
  }

}