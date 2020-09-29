import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'registration.dart';
import 'homePage.dart';
import 'forgotPasswordPage.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isProgressBarVisible = false;
  bool isRememberMeTextBoxChecked = false;

  Widget _submitButton() {
    return GestureDetector(
        onTap: (){
            makeLoginRequest();
        },
        child: new Container(

            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(2, 4),
                        blurRadius: 5,
                        spreadRadius: 2)
                ],
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xff91638f), Color(0xFF573555)]),),
            child: Text(
                'Login',
                style: TextStyle(fontSize: 20, color: Colors.white),
            ),
        )
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AccountPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xFF573555),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }



  TextEditingController userNameTextEditingController = new TextEditingController();

  TextEditingController passwordTextEditingController = new TextEditingController();

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        TextField(
        controller: userNameTextEditingController,
        keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
        decoration: InputDecoration(
            labelText: 'Username',
            labelStyle: TextStyle(
                color: Color(0xFF573555)
            ),

            prefixIcon: Icon(Icons.person, color: Color(0xFF573555),),
            enabledBorder: UnderlineInputBorder(
            //    borderSide: BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF573555)),


            )
        ),
    ),
          SizedBox(height:20),
          TextField(
              controller: passwordTextEditingController,
              obscureText: true,
              keyboardType: TextInputType.text,
              cursorColor: Color(0xFF573555),
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                     color: Color(0xFF573555)
                    ),

                  prefixIcon: Icon(Icons.lock, color: Color(0xFF573555),),
                  enabledBorder: UnderlineInputBorder(
                      //    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF573555)),


                  )
              ),
          )
      ],
    );
  }



  void makeLoginRequest () async {

      setState(() {
          isProgressBarVisible = true;
      });


      final http.Response response = await http.post(
          'http://2e5133174e77.ngrok.io/iloveae/public/login',
          headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
              'email': userNameTextEditingController.text,
              'password': passwordTextEditingController.text
          }),
      );


      setState(() {
          isProgressBarVisible = false;
      });

      print(response.body);

      Map resp = json.decode(response.body);
      if(resp['status'].toString() == "true"){

          print(resp['token'].toString());
          print(resp['user']['name'].toString());

         SharedPreferences prefs = await SharedPreferences.getInstance();
         prefs.setString('token', resp['token'].toString());
         prefs.setString('name', resp['user']['name'].toString());
         prefs.setString('nick_name', resp['user']['nick_name'].toString());
         prefs.setString('family_name', resp['user']['family_name'].toString());
         prefs.setString('email', resp['user']['email'].toString());
         prefs.setString('phone_number', resp['user']['phone_number'].toString());
         prefs.setString('mobile', resp['user']['mobile'].toString());
         prefs.setString('dob', resp['user']['dob'].toString());
         prefs.setString('gender', resp['user']['gender'].toString());
         prefs.setString('blood_type', resp['user']['blood_type'].toString());
         prefs.setString('marital_status', resp['user']['marital_status'].toString());
         prefs.setString('occupation', resp['user']['occupation'].toString());
         prefs.setString('linkedin_username', resp['user']['linkedin_username'].toString());
         prefs.setString('linkedin_url', resp['user']['linkedin_url'].toString());
         prefs.setString('country', resp['user']['country'].toString());
         prefs.setString('city', resp['user']['city'].toString());
         prefs.setString('state', resp['user']['state'].toString());
         prefs.setString('zip_code', resp['user']['zip_code'].toString());
         prefs.setString('photo_url', resp['user']['photo_url'].toString());

         prefs.setBool('isUserLoggedIn', isRememberMeTextBoxChecked);


        Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));



      }else{
          Toast.show(resp['message'].toString(), context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

      }

  }



  var showProgressBar  = Visibility(
      child: Image(
          image: AssetImage('assets/progressBar.gif'),
          width: 50,
          height: 50
      ),
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: true,
  );


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height-200;
    return Scaffold(
        bottomNavigationBar: new Container(
            height: 20.0,
            color: Color(0xFF573555),
        ),
        appBar: AppBar(
            backgroundColor: Color(0xFF573555),
            iconTheme: new IconThemeData(color: Color(0xffffffff)),
            title: const Text('Login Form', style: TextStyle(
                color: Color(0xFFFFFFFF),
            ),),
            leading: IconButton (
                icon:Icon(Icons.arrow_back_ios),
                color: Color(0xFFFFFFFF),
                onPressed: () => Navigator.pop(context, false),


            ),
        ),
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                 // _title(),
                //  SizedBox(height: 30),
                  _emailPasswordWidget(),
                CheckboxListTile(
                    title: Text("Remember Me"),
                    value: isRememberMeTextBoxChecked,

                    onChanged: (newValue) {
                        setState(() {
                            isRememberMeTextBoxChecked = !isRememberMeTextBoxChecked;
                        });
                    },
                    controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                  SizedBox(height: 5),
                    (isProgressBarVisible) ? showProgressBar :  //,
                    SizedBox(height: 5),
                  _submitButton(),
                  GestureDetector(
                      onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerRight,
                          child: Text('Forgot Password ?',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                  ),
                  _divider(),
                 // _facebookButton(),

                  _createAccountLabel(),
                ],
              ),
            ),
          ),
         // Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ),
    );
  }
}
