import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rentllin_flutter/utiities/demoLocalizations.dart';
import 'package:rentllin_flutter/views/homeView.dart';
import 'package:rentllin_flutter/views/loggedUserView.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  bool isShowpassword = true;
  bool isCheck_remember = false;
  bool isCheck_staylogin = false;

  Color icon_color_user = Colors.grey;
  Color icon_color_pass = Colors.grey;

  showpassword(bool val) {
    setState(() {
      isShowpassword = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Container(
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        color: Colors.black,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                              height: 100,
                              child: Center(
                                  child: Image.asset(
                                      'assets/images/comfi_renallin_logo.png')),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: TextField(
                                      onTap: () {
                                        setState(() {
                                          icon_color_pass = Colors.grey;
                                          icon_color_user = Colors.white;
                                        });
                                      },
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20.0,
                                          color: icon_color_user),
                                      keyboardType: TextInputType.emailAddress,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.account_box,
                                          color: icon_color_user,
                                        ),
                                        hintText: DemoLocalizations.of(context)
                                            .getText("username"),
                                        hintStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 18.0,
                                            color: icon_color_user),
                                        contentPadding: EdgeInsets.all(10),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: TextField(
                                      onTap: () {
                                        setState(() {
                                          icon_color_pass = Colors.white;
                                          icon_color_user = Colors.grey;
                                        });
                                      },
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20.0,
                                          color: icon_color_pass),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: isShowpassword,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: icon_color_pass,
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            showpassword(!isShowpassword);
                                          },
                                          child: Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.white,
                                          ),
                                        ),
                                        fillColor: Colors.white,
                                        hintText: DemoLocalizations.of(context)
                                            .getText("password"),
                                        hintStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 18.0,
                                            color: icon_color_pass),
                                        contentPadding: EdgeInsets.all(10),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(15, 0, 20, 0),
                                        width: 20,
                                        height: 20,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.grey),
                                          child: Checkbox(
                                            value: isCheck_remember,
                                            checkColor: Colors.black,
                                            // color of tick Mark
                                            activeColor: Colors.white,
                                            onChanged: (bool value) {
                                              setState(() {
                                                isCheck_remember = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Text(
                                        DemoLocalizations.of(context)
                                            .getText("remeber_me"),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(15, 0, 20, 0),
                                        width: 20,
                                        height: 20,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.grey),
                                          child: Checkbox(
                                            value: isCheck_staylogin,
                                            checkColor: Colors.black,
                                            // color of tick Mark
                                            activeColor: Colors.white,
                                            onChanged: (bool value) {
                                              setState(() {
                                                isCheck_staylogin = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Text(
                                        DemoLocalizations.of(context)
                                            .getText("stay_login"),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                    height: 50,
                                    child: RaisedButton(
                                      color: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      elevation: 20,
                                      onPressed: () {

                                        Navigator.pop(context);
                                        var home_route=MaterialPageRoute(builder: (BuildContext context)=>HomeView());
                                        Navigator.pushReplacement(context, home_route);
                                      },
                                      splashColor: Colors.white,
                                      child: Center(
                                        child: Text(
                                          DemoLocalizations.of(context)
                                            .getText("login").toUpperCase(),style: TextStyle(fontSize: 20,
                                          color: Colors.white,fontWeight: FontWeight.bold,
                                        ),),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))));
    }));
  }
}
