import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_login_signup/src/Pages/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _AccountPageState createState() => _AccountPageState();

}

class _AccountPageState extends State<AccountPage> {


    String currentGenderValue = 'Male';

    List <String> genderSpinnerItems = [
        'Male',
        'Female'
    ] ;

    TextEditingController passwordTextEditingController = new TextEditingController();

    TextEditingController confirmPasswordTextEditingController = new TextEditingController();

    TextEditingController nameTextEditingController = new TextEditingController();

    TextEditingController nickNameTextEditingController = new TextEditingController();

    TextEditingController familyNameTextEditingController = new TextEditingController();

    TextEditingController emailTextEditingController = new TextEditingController();

    TextEditingController telephoneTextEditingController = new TextEditingController();

    TextEditingController mobileTextEditingController = new TextEditingController();

    TextEditingController dobTextEditingController = new TextEditingController();

    TextEditingController genderTextEditingController = new TextEditingController();

    TextEditingController bloodTypeTextEditingController = new TextEditingController();

    TextEditingController maritalStatusTextEditingController = new TextEditingController();

    TextEditingController occupationTextEditingController = new TextEditingController();

    TextEditingController linkedInUsernameTextEditingController = new TextEditingController();

    TextEditingController linkedInUrlTextEditingController = new TextEditingController();

    TextEditingController countryTextEditingController = new TextEditingController();

    TextEditingController cityTextEditingController = new TextEditingController();

    TextEditingController streetTextEditingController = new TextEditingController();

    TextEditingController zipCodeTextEditingController = new TextEditingController();

    TextEditingController stateTextEditingController = new TextEditingController();




    Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

    Widget _submitButton() {
    return Container(
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
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: Text(
        'Register Now',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

    Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

    Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'd',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'ev',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'rnz',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

    Widget getPasswordTextFieldWidget(){
        return new TextField(
            controller: passwordTextEditingController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
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
        );
    }

    Widget getConfirmPasswordTextFieldWidget(){
        return new TextField(

            controller:confirmPasswordTextEditingController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(
                    color: Color(0xFF573555)
                ),

                prefixIcon: Icon(Icons.confirmation_number, color: Color(0xFF573555),),
                enabledBorder: UnderlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF573555)),


                )
            ),
        );
    }

    Widget getNameTextFieldWidget(){
        return new TextField(
            controller:nameTextEditingController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Name',
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
        );
    }

    Widget getNickNameTextFieldWidget(){
        return new TextField(
            controller:nickNameTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Nick Name',
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
        );
    }

    Widget getFamilyNameTextFieldWidget(){
        return new TextField(
            controller:familyNameTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Family Name',
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
        );
    }

    Widget getEmailTextFieldWidget(){
        return new TextField(
            controller: emailTextEditingController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                    color: Color(0xFF573555)
                ),

                prefixIcon: Icon(Icons.email, color: Color(0xFF573555),),
                enabledBorder: UnderlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF573555)),


                )
            ),
        );
    }

    Widget getTelephoneTextFieldWidget(){
        return new TextField(
            controller: telephoneTextEditingController,
            keyboardType: TextInputType.phone,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Telephone',
                labelStyle: TextStyle(
                    color: Color(0xFF573555)
                ),

                prefixIcon: Icon(Icons.call, color: Color(0xFF573555),),
                enabledBorder: UnderlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF573555)),


                )
            ),
        );
    }

    Widget getMobileTextFieldWidget(){
        return new TextField(
            controller: mobileTextEditingController,
            keyboardType: TextInputType.phone,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Mobile',
                labelStyle: TextStyle(
                    color: Color(0xFF573555)
                ),

                prefixIcon: Icon(Icons.phone_android, color: Color(0xFF573555),),
                enabledBorder: UnderlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF573555)),


                )
            ),
        );
    }

    Widget getDOBTextFieldWidget(){
        return new TextField(
            controller: dobTextEditingController,
            keyboardType: TextInputType.datetime,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Date Of Birth',
                labelStyle: TextStyle(
                    color: Color(0xFF573555)
                ),

                prefixIcon: Icon(Icons.date_range, color: Color(0xFF573555),),
                enabledBorder: UnderlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF573555)),


                )
            ),
        );



    }

    Widget getGenderTextFieldWidget(){
        return new DropdownButton<String>(
            isExpanded: true,
            value: currentGenderValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Color(0xFF573555), fontSize: 18, ),
            underline: Container(
                height: 1,
                color: Color(0xFF573555),
            ),
            onChanged: (String data) {
                setState(() {
                    currentGenderValue = data;
                });
            },
            items: genderSpinnerItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                );
            }).toList(),
        );


    }

    Widget getBloodTypeTextFieldWidget(){
        return new TextField(
            controller: bloodTypeTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Blood',
                labelStyle: TextStyle(
                    color: Color(0xFF573555)
                ),

                prefixIcon: Icon(Icons.drag_handle, color: Color(0xFF573555),),
                enabledBorder: UnderlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF573555)),


                )
            ),
        );
    }

    Widget getMaritalTextFieldWidget(){
        return new TextField(
            controller: maritalStatusTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Marital Status',
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
        );
    }

    Widget getOccupationTextFieldWidget(){
        return new TextField(
            controller: occupationTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Occupation',
                labelStyle: TextStyle(
                    color: Color(0xFF573555)
                ),

                prefixIcon: Icon(Icons.person_outline, color: Color(0xFF573555),),
                enabledBorder: UnderlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF573555)),


                )
            ),
        );
    }

    Widget getLinkedInUsernameTextFieldWidget(){
        return new TextField(
            controller: linkedInUsernameTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'LinkedIn Username',
                labelStyle: TextStyle(
                    color: Color(0xFF573555)
                ),

                prefixIcon: Icon(Icons.link, color: Color(0xFF573555),),
                enabledBorder: UnderlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF573555)),


                )
            ),
        );
    }

    Widget getLinkedInUrlTextFieldWidget(){
        return new TextField(
            controller: linkedInUrlTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'LinkedIn Url',
                labelStyle: TextStyle(
                    color: Color(0xFF573555)
                ),

                prefixIcon: Icon(Icons.link, color: Color(0xFF573555),),
                enabledBorder: UnderlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF573555)),


                )
            ),
        );
    }

    Widget getCountryTextFieldWidget(){
        return new TextField(
            controller: countryTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Country',
                labelStyle: TextStyle(
                    color: Color(0xFF573555)
                ),

                prefixIcon: Icon(Icons.center_focus_weak, color: Color(0xFF573555),),
                enabledBorder: UnderlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF573555)),


                )
            ),
        );
    }

    Widget getCityTextFieldWidget(){
        return new TextField(
            controller: cityTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'City',
                labelStyle: TextStyle(
                    color: Color(0xFF573555)
                ),

                prefixIcon: Icon(Icons.location_city, color: Color(0xFF573555),),
                enabledBorder: UnderlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF573555)),


                )
            ),
        );
    }

    Widget getStreetTextFieldWidget(){
        return new TextField(
            controller: streetTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Street',
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
        );
    }

    Widget getStateTextFieldWidget(){
        return new TextField(
            controller: streetTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'State',
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
        );
    }

    Widget getZipTextFieldWidget(){
        return new TextField(
            controller: zipCodeTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFF573555),
            decoration: InputDecoration(
                labelText: 'Zip',
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
        );
    }





    /*   Stepper Functionality Snippet    */

      int currentStep = 0;
      bool complete = false;

      next() {

          if(currentStep + 1 != steps.length){
              //steps[currentStep]
              goTo(currentStep + 1);

          }else{
              setState(() => complete = true);
              saveInfoRequest();
          }


       /* currentStep + 1 != steps.length
            ? goTo(currentStep + 1)
            : setState(() => complete = true); */
      }

      cancel() {
        if (currentStep > 0) {
          goTo(currentStep - 1);
        }
      }

      goTo(int step) {
        setState((){
            currentStep = step;

        });
      }

        List<Step> steps;

        @override
        void initState() {
            steps = [
                Step(
                    isActive: true,
                    state: StepState.editing,
                    title: const Text('Password'),
                    content: Column(
                        children: <Widget>[

                            getPasswordTextFieldWidget(),

                            getConfirmPasswordTextFieldWidget(),

                        ],
                    ),
                ),
                Step(
                    isActive: true,
                    state: StepState.editing,
                    title: const Text('Basic Details'),
                    content: Column(
                        children: <Widget>[

                            getNameTextFieldWidget(),
                            SizedBox(height: 10,),

                            getNickNameTextFieldWidget(),
                            SizedBox(height: 10,),

                            getFamilyNameTextFieldWidget(),
                            SizedBox(height: 10,),

                            getEmailTextFieldWidget(),
                            SizedBox(height: 10,),

                            getTelephoneTextFieldWidget(),
                            SizedBox(height: 10,),

                            getMobileTextFieldWidget(),
                        ],
                    ),
                ),
                Step(
                    isActive: true,
                    state: StepState.editing,
                    title: const Text('Personal Details'),
                    content: Column(
                        children: <Widget>[

                            getDOBTextFieldWidget(),
                            SizedBox(height: 10,),

                            getGenderTextFieldWidget(),

                            SizedBox(height: 10,),

                            getBloodTypeTextFieldWidget(),
                            SizedBox(height: 10,),

                            getMaritalTextFieldWidget(),
                            SizedBox(height: 10,),

                            getOccupationTextFieldWidget(),
                            SizedBox(height: 10,),

                            getLinkedInUsernameTextFieldWidget(),
                            SizedBox(height: 10,),

                            getLinkedInUrlTextFieldWidget(),
                            SizedBox(height: 10,),

                        ],
                    ),
                ),
                Step(
                    isActive: true,
                    state: StepState.editing,
                    title: const Text('Address'),
                    content: Column(
                        children: <Widget>[

                            getCountryTextFieldWidget(),
                            SizedBox(height: 10,),

                            getCityTextFieldWidget(),
                            SizedBox(height: 10,),

                            getStreetTextFieldWidget(),
                            SizedBox(height: 10,),

                            getZipTextFieldWidget(),
                            SizedBox(height: 10,),

                        ],
                    ),
                ),
                Step(
                    isActive: true,
                    state: StepState.complete,
                    title: const Text('Complete'),
                    subtitle: const Text(""),
                    content: Column(
                        children: <Widget>[

                        ],
                    ),
                ),
            ];

        }



  /*   Image Picker Snippet  */

  File _image;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }


  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }




 /* Http Requests */

  void saveInfoRequest () async {

      var request = http.MultipartRequest("POST", Uri.parse("http://53d5391ae5d1.ngrok.io/iloveae/public/register"));
      //add text fields
      request.fields["name"] = nameTextEditingController.text;
      request.fields["email"] = emailTextEditingController.text;
      request.fields["password"] = passwordTextEditingController.text;
      request.fields["password_confirm"] = confirmPasswordTextEditingController.text;
      request.fields["phone_number"] = telephoneTextEditingController.text;
      request.fields["nick_name"] = nickNameTextEditingController.text;
      request.fields["family_name"] = familyNameTextEditingController.text;
      request.fields["dob"] = dobTextEditingController.text;
      request.fields["mobile"] = mobileTextEditingController.text;
      request.fields["gender"] = genderTextEditingController.text;
      request.fields["blood_type"] = bloodTypeTextEditingController.text;
      request.fields["marital_status"] = maritalStatusTextEditingController.text;
      request.fields["occupation"] =  occupationTextEditingController.text;
      request.fields["country"] = countryTextEditingController.text;
      request.fields["city"] = cityTextEditingController.text;
      request.fields["street"] = streetTextEditingController.text;
      request.fields["zip_code"] = zipCodeTextEditingController.text;
      request.fields["state"] = stateTextEditingController.text;
      request.fields["linkedin_username"] = linkedInUsernameTextEditingController.text;
      request.fields["linkedin_url"] = linkedInUrlTextEditingController.text;

      //create multipart using filepath, string or bytes
      var pic = await http.MultipartFile.fromPath("photo_url", _image.path);
      //add multipart to request
      request.files.add(pic);
      var response = await request.send();

      //Get the response from the server
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print(responseString);


  }





  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(

        bottomNavigationBar: new Container(
            height: 20.0,
            color: Color(0xFF573555),
        ),
        appBar: AppBar(
            backgroundColor: Color(0xFF573555),
            title: const Text('Registration Form', style: TextStyle(
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
              child: Column(
                children: <Widget>[
                SizedBox(height: 30,),
                    Center(
                    child: GestureDetector(
                      onTap:(){
                        _showPicker(context);
                      },
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Color(0xff573555),
                        child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                _image,
                                width: 100,
                                height:100,
                                fit: BoxFit.fitHeight,
                              ),
                        )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50),
                            ),
                          width: 100,
                          height: 100,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                      )
                    )
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                      child: Theme(
                          data:ThemeData(
                            //  accentColor: Color(0xFF000000),
                              primaryColor: Color(0xFF573555)
                          ),
                          child:Stepper(
                              steps: steps,
                              currentStep: currentStep,
                              onStepContinue: next,
                              onStepTapped: (step) => goTo(step),
                              onStepCancel: cancel,
                          )
                      ),
                  ),
                ],
              ),
            ),
            //Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
