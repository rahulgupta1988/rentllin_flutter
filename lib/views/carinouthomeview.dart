
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentllin_flutter/utiities/demoLocalizations.dart';

class CarinOutHomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> CarinOutHomeViewState();
}

class CarinOutHomeViewState extends State<CarinOutHomeView>{
  @override
  Widget build(BuildContext context) {

    var scaffold = DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: TabBar(
              indicatorPadding: EdgeInsets.zero,
              isScrollable: false,
              tabs: <Widget>[
                Tab(child: Text(DemoLocalizations.of(context)
                    .getText("car_in"),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
                Tab(child: Text(DemoLocalizations.of(context)
                    .getText("car_out"),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
              ],
            ),
            leading: Text(""),


          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car,),
              Icon(Icons.directions_transit),

            ],
          ),

        ));

    return scaffold;

  }

}
