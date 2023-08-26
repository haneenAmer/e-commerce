import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  // final _formkey = GlobalKey<FormState>();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String? validUsername = 'admin';
  final String? validPassword = '12345678';
  String? username = '';
  String? password = '';
  void _login() {
    // if (_formKey.currentState!.validate()) {
    if (username == validUsername && password == validPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Credentials'),
          content: const Text('Please enter valid username and password.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff4313a3),
          elevation: 0,
          title: const Text('LoginScreen'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/logo.png')),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.blueGrey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Form(
                      // key: _formkey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        username = value;
                                      });
                                    },
                                    validator: (value) {
                                      if (value == '') {
                                        return 'Please enter username';
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        hintText: 'user name',
                                        labelText: 'user name',
                                        prefixIcon: Icon(
                                          Icons.person,
                                        ),
                                        errorStyle: TextStyle(fontSize: 16.0),
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(9.0)))))),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == '') {
                                    return 'Please enter username';
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Colors.green,
                                  ),
                                  errorStyle: TextStyle(fontSize: 18.0),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.0))),
                                ),
                              ),
                            ),
                            Container(
                              //margin: EdgeInsets.symmetric(horizontal: 100),
                              child: Text('Forget Password!'),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xff4313a3)),
                                    ),
                                    child: Text(
                                      'LoginScreen',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                    onPressed: _login,
                                  ),
                                ),
                              ),
                            )
                          ]),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
