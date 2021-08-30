import 'package:flutter/material.dart';
import 'package:ourvillage/Services/auth_service.dart';
import 'package:ourvillage/screens/components/roundedBtn.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email;
  String _password;
  String _village;
  String _name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0,
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontFamily: 'FredokaOne-Regular',
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  hintText: 'Enter your Full name.',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 45,
                    vertical: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: Colors.green),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: Colors.green),
                    gapPadding: 10,
                  ),
                ),
                onChanged: (value) {
                  _name = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Village',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontFamily: 'FredokaOne-Regular',
                  ),
                  prefixIcon: Icon(
                    Icons.group_add,
                    color: Colors.green,
                  ),
                  hintText: 'Enter your Village.',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 45,
                    vertical: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: Colors.green),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: Colors.green),
                    gapPadding: 10,
                  ),
                ),
                onChanged: (value) {
                  _village = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontFamily: 'FredokaOne-Regular',
                  ),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.green,
                  ),
                  hintText: 'Enter your Email.',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 45,
                    vertical: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: Colors.green),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: Colors.green),
                    gapPadding: 10,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _email = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontFamily: 'FredokaOne-Regular',
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.green,
                  ),
                  hintText: 'Enter your Password.',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 45,
                    vertical: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: Colors.green),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: Colors.green),
                    gapPadding: 10,
                  ),
                ),
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: 30,
              ),
              RoundedBtn(
                  submit: () async {
                    bool isValied = await AuthService.signup(
                        _name, _email, _password, _village);
                    if (isValied) {
                      Navigator.pop(context);
                    } else {
                      print("something went wrong");
                    }
                  },
                  text: "Register",
                  color: Colors.green,
                  textcolor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
