import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentllin_flutter/utiities/demoLocalizations.dart';
import 'package:rentllin_flutter/views/carinouthomeview.dart';
import 'package:rentllin_flutter/views/drawersettingview.dart';
import 'package:rentllin_flutter/views/loggedUserView.dart';

import 'loginView.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {

  var sel_color=Colors.grey;
  var unsel_color=Colors.white;

  var sel_color_txt=Colors.red;
  var unsel_color_txt=Colors.black;


  bool carinout=true;
  bool setting=false;
  bool switcguser=false;
  bool logout=false;
  double label_height=50;

  int sel_tab_index=0;
  var tab_screens =[CarinOutHomeView(),DrawerSettingView()];

  @override
  Widget build(BuildContext context) {

    setTabIndex(int index){
      setState(() {

          sel_tab_index = index;

      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Home"),
      ),
      body: tab_screens[sel_tab_index],

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.red,
              child:Column(
              children: <Widget>[
                Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://mcdn.wallpapersafari.com/medium/8/77/NPERCA.jpg")))),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "Danny",
                    style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ),
            GestureDetector(
             onTap: (){

               setState(() {
                 carinout=true;
                 setting =false;
                 switcguser=false;
                 logout=false;
                 setTabIndex(0);
                 Navigator.pop(context);
               });
             },
             child:  Container(
              alignment: Alignment.center,
              height: label_height,
              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              color: carinout?sel_color:unsel_color,
              child: Row(children: <Widget>[

                Icon(Icons.directions_car,color: carinout?sel_color_txt:unsel_color_txt,),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child:Text(DemoLocalizations.of(context)
                      .getText("carinout"),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: carinout?sel_color_txt:unsel_color_txt,),
                  ),
                ),

              ],
              ),
            )

           ),
            GestureDetector(
                onTap: (){

                  setState(() {
                    setting =true;
                    carinout=false;
                    switcguser=false;
                    logout=false;
                    setTabIndex(1);
                    Navigator.pop(context);
                  });
                },
                child:  Container(
                  alignment: Alignment.center,
                  height: label_height,
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  color: setting?sel_color:unsel_color,
                  child: Row(children: <Widget>[

                    Icon(Icons.settings,color: setting?sel_color_txt:unsel_color_txt,),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child:Text(DemoLocalizations.of(context)
                          .getText("menu_setting"),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: setting?sel_color_txt:unsel_color_txt,),
                      ),
                    ),

                  ],
                  ),
                )

            ),
            GestureDetector(
                onTap: (){

                  setState(() {
                    setting =false;
                    carinout=false;
                    switcguser=true;
                    logout=false;
                    Navigator.pop(context);
                    var next_route= MaterialPageRoute(builder: (BuildContext context)=> LoggedUserView());
                    Navigator.pushReplacement(context, next_route);
                  });
                },
                child:  Container(
                  alignment: Alignment.center,
                  height: label_height,
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  color: switcguser?sel_color:unsel_color,
                  child: Row(children: <Widget>[

                    Icon(Icons.group,color: switcguser?sel_color_txt:unsel_color_txt,),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child:Text(DemoLocalizations.of(context)
                          .getText("menu_switchuser"),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: switcguser?sel_color_txt:unsel_color_txt,),
                      ),
                    ),

                  ],
                  ),
                )

            ),
            GestureDetector(
                onTap: (){

                  setState(() {
                    setting =false;
                    carinout=false;
                    switcguser=false;
                    logout=true;
                    Navigator.pop(context);
                    var next_route= MaterialPageRoute(builder: (BuildContext context)=> LoginView());
                    Navigator.pushReplacement(context, next_route);
                  });
                },
                child:  Container(
                  alignment: Alignment.center,
                  height: label_height,
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  color: logout?sel_color:unsel_color,
                  child: Row(children: <Widget>[

                    Icon(Icons.lock,color: logout?sel_color_txt:unsel_color_txt,),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child:Text(DemoLocalizations.of(context)
                          .getText("menu_logout"),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: logout?sel_color_txt:unsel_color_txt,),
                      ),
                    ),

                  ],
                  ),
                )

            )
          ],
        ),
      ),
    );
  }
}
