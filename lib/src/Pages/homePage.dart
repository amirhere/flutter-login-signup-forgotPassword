
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
    HomePage({Key key, this.title}) : super(key: key);
    final String title;

    @override
    _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    SharedPreferences prefs;
    String photo_url;


    @override
    void initState() {
        getSavedValuesFromSharedPreference();
    }


    void getSavedValuesFromSharedPreference () async {
        prefs = await SharedPreferences.getInstance();
        photo_url = "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    }

    void setLogOutStateInSharedPreference () async {
        prefs = await SharedPreferences.getInstance();
        prefs.setBool('isUserLoggedIn', false);
    }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(title: Text("Home", style: TextStyle(
                color: Colors.white
            )),
                backgroundColor: Color(0xFF573555),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(
                            Icons.notifications,
                            color: Colors.white,
                        ),
                        onPressed: () {
                            // do something
                        },
                    )


                ],),
            drawer: Drawer(
                // Add a ListView to the drawer. This ensures the user can scroll
                // through the options in the drawer if there isn't enough vertical
                // space to fit everything.
                child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                        UserAccountsDrawerHeader(
                            decoration: BoxDecoration(
                                color: Color(0xFF573555),
                            ),
                            accountName: Text("Good Day!"),
                            accountEmail: Text("powered by pitstopsystems"),
                            currentAccountPicture: CircleAvatar(
                                backgroundColor: Colors.red,
                                backgroundImage: NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),

                            ),
                        ),
                        ListTile(
                            title: Text('Edit Profile'),
                            onTap: () {

                            }
                        ),
                        ListTile(
                            title: Text('Terms and Conditions'),
                            onTap: () {

                            }
                        ),
                        ListTile(
                            title: Text('Manage Notifications'),
                            onTap: () {

                            }
                        ),

                        ListTile(
                            title: Text('About'),
                            onTap: () {

                            }
                        ),

                        ListTile(
                            title: Text('Contact Us'),
                            onTap: () {

                            }
                        ),

                        ListTile(
                            title: Text('Logout'),
                            onTap: () {
                                setLogOutStateInSharedPreference();

                                Navigator.pop(context);
                                Navigator.pop(context);


                                // Update the state of the app.
                                // ...
                            },
                        ),
                    ],
                ),
            ),

            body: Container(),


        );

    }













}
