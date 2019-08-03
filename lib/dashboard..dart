import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("sumbal"),
              accountEmail: Text("sumbal@xyz"),
              currentAccountPicture:CircleAvatar(
                radius: 30,
                backgroundColor:Colors.red,
                child: Icon(Icons.person)
          

            ),
              
            ),
            ListTile(
              title: Text("Pending Orfers"),
              trailing: Icon(
                Icons.add_alert,
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text("Completed Orders"),
              trailing: Icon(Icons.done_all, color: Colors.green),
            ),
            ListTile(
              title: Text("Pending Bills"),
              trailing: Icon(
                Icons.attach_money,
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text("Notifications"),
              trailing: Icon(
                Icons.notifications,
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("Settings"),
              trailing: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      body: Container(
        height: 500,
        width: 500,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Hero(
              tag: "flutter",
              child: FlutterLogo(
                size: 70.0,
              ),
            ),
            Container(
              height: 390,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 48),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                            left: 40,
                          )),
                      FlatButton(
                        onPressed: () {},
                        color: Color.fromRGBO(255, 255, 255, 1),
                        child: Text(
                          "Pending Orders",
                          style: TextStyle(fontSize: 20),
                        ),
                        padding: EdgeInsets.only(left: 20, right: 40),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                      ),
                      Padding(padding: EdgeInsets.only(left: 90)),
                      Icon(
                        Icons.notification_important,
                        size: 30,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                            left: 40,
                          )),
                      FlatButton(
                        onPressed: () {},
                        color: Color.fromRGBO(255, 255, 255, 1),
                        child: Text(
                          "Completed Orders",
                          style: TextStyle(fontSize: 20),
                        ),
                        padding: EdgeInsets.only(left: 20, right: 40),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                      ),
                      Padding(padding: EdgeInsets.only(left: 64)),
                      Icon(
                        Icons.done_all,
                        size: 30,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                            left: 60,
                          )),
                      FlatButton(
                        onPressed: () {},
                        color: Color.fromRGBO(255, 255, 255, 1),
                        child: Text(
                          "Pending Bills",
                          style: TextStyle(fontSize: 20),
                        ),
                        splashColor: Colors.white,
                        focusColor: Colors.red,
                        highlightColor: Colors.white,
                        padding: EdgeInsets.only(left: 2, right: 40),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                      ),
                      Padding(padding: EdgeInsets.only(left: 105)),
                      Icon(
                        Icons.attach_money,
                        size: 30,
                        color: Colors.amberAccent,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                            left: 60,
                          )),
                      FlatButton(
                        onPressed: () {},
                        color: Color.fromRGBO(255, 255, 255, 1),
                        child: Text(
                          "Notifications",
                          style: TextStyle(fontSize: 20),
                        ),
                        padding: EdgeInsets.only(left: 0, right: 40),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                      ),
                      Padding(padding: EdgeInsets.only(left: 105)),
                      Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}