import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  final String username, password;
  LoginScreen({Key? key, required this.username, required this.password}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/backgroung-login.jpg"), fit: BoxFit.cover)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
                child: ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(22),
                        color: Colors.white.withOpacity(0.6),
                        child: ClipRRect(
                          borderRadius: BorderRadius.zero,
                          child:  BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Column(
                                children: [
                                  _headerContainer(),
                                  const Icon(Icons.account_circle_rounded, size: 50,),
                                  _usernameField(),
                                  _passwordField(),
                                  _loginButton(widget.username, widget.password),
                                  _registerButton(widget.username, widget.password),
                                ],
                              )
                          ),
                        ),
                      ),
                      _addOn()
                    ]
                ),
              )
          )
      ),
    );
  }

  Widget _headerContainer(){
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Text('LOGIN',
        style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _usernameField(){
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: TextField(
        controller: _usernameController,
        autofocus: true,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Colors.green,
                    width: 2.5)
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            hintText: 'Email',
            prefixIcon: const Icon(Icons.account_box_outlined, color: Colors.black,)
        ),
      ),
    );
  }

  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2.5)
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              hintText: 'Password',
              prefixIcon: Icon(Icons.wifi_password_outlined, color: Colors.black,)
          )
      ),
    );
  }

  Widget _loginButton(String checkUser, String checkPass){
    return Container(
        width: 200,
        height: 45,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.green),
          child: const Text("Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              )
          ),
          onPressed: (){
            String users = _usernameController.text;
            String pass = _passwordController.text;
            String text = "";
            if(users.isEmpty || pass.isEmpty){
              text = "Login Failed, please enter your name and password";
            }else if(users ==  "user" || pass == "pass"){
              Navigator.pushNamed(context, '/home');
              text = "Login Success";
            }else if(users !=  checkUser || pass != checkPass){
              text = "Login Failed, you'r username or password is wrong";
            } else{
              Navigator.pushNamed(context, '/home');
              text = "Login Success";
            }

            SnackBar snackBar = SnackBar(
              content: Text(text),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        )
    );
  }

  Widget _registerButton(String checkUser, String checkPass){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account ?",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal
            )
        ),
        MaterialButton(
            color: null,
            padding: const EdgeInsets.all(20),
            onPressed: (){
            },
            child: const Text("Register",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.w700
                )
            )
        )
      ],
    );
  }

  Widget _addOn(){
    return Column(
        children: [
          const SizedBox(height: 20),
          const Text('Social Media',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500
              )
          ),
          const SizedBox(height: 20,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/images/logo-twt.png", height: 50, width: 50),
                Image.asset("assets/images/logo-fb.png", height: 50, width: 50),
                Image.asset("assets/images/logo-ggl.png", height: 50, width: 50)
              ]
          )
        ]
    );
  }
}