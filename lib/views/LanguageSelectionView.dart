import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:rentllin_flutter/utiities/demoLocalizations.dart';
import 'package:rentllin_flutter/utiities/demoLocalizationsDelegate.dart';
import 'package:rentllin_flutter/views/loggedUserView.dart';

class LanguageSelectionView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguageSelectionState();
}

class LanguageSelectionState extends State<LanguageSelectionView> {
  var vesion_no = "0.0";
  DemoLocalizationsDelegate lng_delegate;

  _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      vesion_no = "v"+packageInfo.version;
    });
  }


  _changeLocale(String locale){
    lng_delegate.load(Locale(locale));

  }

  TextStyle textStyl =
      TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold);

  TextStyle textSty2 =
      TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w300);


  @override
  void initState() {
    super.initState();
    lng_delegate=DemoLocalizationsDelegate();
    _getVersion();
  }

  @override
  Widget build(BuildContext context) {


    _onSelectText(int type) {
      setState(() {
        if (type == 0) {
          _changeLocale("en");
          textStyl = TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold);

          textSty2 = TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w300);
        } else if (type == 1) {
          _changeLocale("nl");
          textStyl = TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w300);

          textSty2 = TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold);
        }
      });
    }


    _goNextScreen(){
      var next_route= MaterialPageRoute(builder: (BuildContext context)=> LoggedUserView());
      Navigator.push(context, next_route);
    }

    var contianer = Scaffold(
        body: Container(
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
                      child:
                          Image.asset('assets/images/comfi_renallin_logo.png')),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Center(
                      child: Text(
                    DemoLocalizations.of(context).getText("select_language"),
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Center(
                      child: ListView(
                    children: <Widget>[
                      Center(
                        child: GestureDetector(
                          onTap: () => _onSelectText(0),
                          child: Text(
                            DemoLocalizations.of(context).getText("english"),
                            style: textStyl,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          )),
                      Center(
                        child: GestureDetector(
                          onTap: () => _onSelectText(1),
                          child: Text(
                            DemoLocalizations.of(context).getText("dutch"),
                            style: textSty2,
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 20,
                    onPressed: () => _goNextScreen() ,
                    splashColor: Colors.orange,
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.orange,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Center(
                child: Text(
              "$vesion_no",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                 ),
            )),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                color: Colors.black,
                child: Opacity(
                  child: Image.asset('assets/images/cars_ic.png'),
                  opacity: 0.5,
                ),
              ),
            ),
          )
        ],
      ),
    ));
    return contianer;
  }
}
