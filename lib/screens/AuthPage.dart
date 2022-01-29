import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workify/utils/sizes.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _passwordIsVisible = false;
  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff2082ff), Colors.teal],
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              height: device.size.height / 1.3,
              width: device.size.width / 1.2,
              alignment: Alignment.center,
              child: Card(
                elevation: 100,
                color: Colors.grey.shade300,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Banner(),
                    Expanded(
                      flex: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
// LoginInfo                               
                            LoginInfo(),
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
// UserIdField                                    
                                    UserIdField(),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: TextFormField(
                                        obscureText: !_passwordIsVisible,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _passwordIsVisible =
                                                      !_passwordIsVisible;
                                                });
                                              },
                                              icon: Icon(
                                                _passwordIsVisible
                                                    ? Icons.visibility_sharp
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color: Colors.black,
                                              )),
                                          labelText: 'Password',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 2),
                                          ),
                                        ),
                                      ),
                                    ),
// ForgotPassword                                      
                                    ForgotPassword(),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
// Login Buttons                                  
                                  LoginButton(),
                                  Option(),
                                  LoginGoogleButton(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}

class Banner extends StatelessWidget {
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Image.asset(
        'assets/images/banner512_nobg.png',
      ),
    );
  }
}

class LoginInfo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LOGIN',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Please Login to Your Account',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserIdField extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'User ID',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 4),
            child: Text(
              'Forgot Password ?',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 120),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).primaryColor),
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            //fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class Option extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        'or',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class LoginGoogleButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: Colors.grey.shade50, onPrimary: Colors.black),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.android,
                color: Colors.greenAccent,
              ),
              SizedBox(width: 12),
              Text('Sign in with Google'),
            ],
          ),
        ),
      ),
    );
  }
}
