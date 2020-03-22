import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:rentllin_flutter/models/User.dart';
import 'package:rentllin_flutter/utiities/demoLocalizations.dart';
import 'package:rentllin_flutter/views/loginView.dart';
import 'package:toast/toast.dart';

class LoggedUserView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoggedUserState();
}

class LoggedUserState extends State<LoggedUserView> {
  var vesion_no = "0.0";
  int dragItem_index=-1;
  bool _isShow = false;
  List<User> _userList = [];

  _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      vesion_no = "v"+packageInfo.version;
    });
  }

  _createUser() {
    for (int i = 0; i < 3; i++) {
      User user = User(1, 1, "xyz", "xyz@gmail.com", 11,
          "assets/images/comfi_renallin_logo.png", 76, "", 0, 0, "", "abc");
      _userList.add(user);
    }
  }

  void setShow(bool val) {
    setState(() {
      _isShow = val;
    });
  }

  void removeItem(){
    setState(() {
      _userList.removeAt(dragItem_index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createUser();
    _getVersion();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[

            Positioned(
              right: 10.0,
              top: 5.0,
              child: PopupMenuButton(
                color: Colors.white,
                icon: Icon(Icons.more_vert,color: Colors.white,size: 40,),
                onSelected: (String result) {

                  if(result=="1"){Navigator.pop(context);}
                  else if(result=="2"){}
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    height: 30.0,
                    value: "1",
                    child: Text(DemoLocalizations.of(context)
                        .getText("change_language"),style: TextStyle(fontWeight: FontWeight.w500)),
                  ),

                  PopupMenuItem(
                    height: 30.0,
                    value: "2",
                    child:Text("Help",style: TextStyle(fontWeight: FontWeight.w500)),
                  ),

                  PopupMenuItem(
                    height: 20.0,
                    child:Align(alignment:Alignment.centerRight,child:Text("$vesion_no",style: TextStyle(fontWeight: FontWeight.w700),),),
                  ),
                ],
              ),
            ),
            Positioned(top: 0.0, right: 0.0,
              child:DragTarget(
                  onLeave: (data){
                    removeItem();
                    return false;
                  },

                 /* onAccept: (data){return false;},
                  onWillAccept: (data){return false;},*/

                  builder: (context, List<String> candidateData, rejectedData) {
                    return Container(
                      child:!_isShow ? Container() :ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          width: 100,
                          height: 100,
                          child: Icon(
                            Icons.add,
                            size: 50,
                          ),
                        ),
                      ),

                    );
                  }
              ),


            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child:Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  height: 100,
                  child: Center(
                      child:
                          Image.asset('assets/images/comfi_renallin_logo.png')),
                ),
                Expanded(
                    child: Container(
                  height: 200,
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: _userList.asMap().entries.map((entry) {
                      int index = entry.key;
                      User user = entry.value;

                      if (index == _userList.length - 1) {
                        return GestureDetector(
                          onTap: (){
                            var login_route = MaterialPageRoute(builder: (BuildContext context)=>LoginView());
                            Navigator.push(context, login_route);
                          },
                          child:Container(
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  color: Colors.white,
                                  width: 100,
                                  height: 80,
                                  child: Icon(
                                    Icons.add,
                                    size: 50,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text(
                                  DemoLocalizations.of(context)
                                      .getText("add_profile"),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Toast.show("hello", context);
                          },
                          child: Draggable(
                            onDragEnd: (dtails)=> setShow(false),
                            onDragStarted: () {
                              dragItem_index=index;
                              setShow(true);
                              },
                            feedback:  ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.white,
                                width: 100,
                                height: 100,
                                child: Image.asset(user.profile_image),
                              ),
                            ),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      color: Colors.white,
                                      width: 100,
                                      height: 100,
                                      child: Image.asset(user.profile_image),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      "(" + user.client_name + ")",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                    child: Text(
                                      user.username,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    }).toList(),
                  ),
                )),
              ],
            ),
            ),

          ],
        ),

      ),
    );
  }
}
