import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:small_jobs_app/model/user_model.dart';
import 'package:small_jobs_app/screens/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

//our form key

  final _formKey = GlobalKey<FormState>(); //learn what is this

//editing controller
  final nameEditingController = new TextEditingController();
  final ageEditingController = new TextEditingController();
  final nicEditingController = new TextEditingController();
  final addressEditingController = new TextEditingController();
  final locationEditingController = new TextEditingController();
  final professionEditingController = new TextEditingController();
  final affiliationEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //name field

    final nameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("User name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter a Valid Name (min. 3 characters)");
        }
        return null;
      },
      onSaved: (value) {
        nameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next, //next button on down right corner
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "User Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //mobile number field

    final mobileNumberField = TextFormField(
      autofocus: false,
      controller: ageEditingController,
      keyboardType: TextInputType.number,
      //validator: () {},
      onSaved: (value) {
        ageEditingController.text = value!;
      },
      textInputAction: TextInputAction.next, //next button on down right corner
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Age",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //NIC field

    final nicField = TextFormField(
      autofocus: false,
      controller: nicEditingController,
      keyboardType: TextInputType.text,
      //validator: () {},
      onSaved: (value) {
        nicEditingController.text = value!;
      },
      textInputAction: TextInputAction.next, //next button on down right corner
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.badge),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "NIC Number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //address field

    final addressField = TextFormField(
      autofocus: false,
      controller: addressEditingController,
      keyboardType: TextInputType.text,

      onSaved: (value) {
        nicEditingController.text = value!;
      },
      textInputAction: TextInputAction.next, //next button on down right corner
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.badge),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Address Field",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //location field

    final locationField = TextFormField(
      autofocus: false,
      controller: locationEditingController,
      keyboardType: TextInputType.text,

      onSaved: (value) {
        nicEditingController.text = value!;
      },
      textInputAction: TextInputAction.next, //next button on down right corner
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_on),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Location",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

//location field

    final professionField = TextFormField(
      autofocus: false,
      controller: professionEditingController,
      keyboardType: TextInputType.text,

      onSaved: (value) {
        nicEditingController.text = value!;
      },
      textInputAction: TextInputAction.next, //next button on down right corner
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.work),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Profession",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

//affiliation field

    final affiliationField = TextFormField(
      autofocus: false,
      controller: affiliationEditingController,
      keyboardType: TextInputType.text,

      onSaved: (value) {
        nicEditingController.text = value!;
      },
      textInputAction: TextInputAction.next, //next button on down right corner
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.man),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Affiliation",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //email field

    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        //reg expression for email validation
        if (!RegExp("^[a-zA-z0-9+_.-]+@[a-zA-z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid Email");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next, //next button on down right corner
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //password field

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter a Valid Password (min. 6 characters)");
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next, //next button on down right corner
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //confirm password field

    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,

      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "Password don't match";
        }
        return null;
      },

      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done, //next button on down right corner
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //signup button

    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            //passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "Let's Sign up...",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    nameField,
                    SizedBox(
                      height: 16,
                    ),
                    mobileNumberField,
                    SizedBox(
                      height: 16,
                    ),
                    nicField,
                    SizedBox(
                      height: 16,
                    ),
                    addressField,
                    SizedBox(
                      height: 16,
                    ),
                    locationField,
                    SizedBox(
                      height: 16,
                    ),
                    professionField,
                    SizedBox(
                      height: 16,
                    ),
                    affiliationField,
                    SizedBox(
                      height: 16,
                    ),
                    emailField,
                    SizedBox(
                      height: 16,
                    ),
                    passwordField,
                    SizedBox(
                      height: 16,
                    ),
                    confirmPasswordField,
                    SizedBox(
                      height: 16,
                    ),
                    signUpButton,
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.uname = nameEditingController.text;
    userModel.mnum = ageEditingController.text;
    userModel.nic = nicEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created succefully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
