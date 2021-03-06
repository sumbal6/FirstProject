import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sumbal_churail/dashboard..dart';
import 'auth.dart';
import 'dashboard..dart';
import 'package:cloud_firestore/cloud_firestore.dart';
  




class Signup extends StatefulWidget {
  final BaseAuth auth;
Signup({this.auth});
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final userName = TextEditingController();
  final userCNIC = TextEditingController();
  final userAccountNo = TextEditingController();
  final userContectNo = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    userName.dispose();
    userCNIC.dispose();
    userAccountNo.dispose();
    userContectNo.dispose();
    userEmail.dispose();
    userPassword.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign up"),
        ),
        drawer: Container(
          color: Colors.green,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text('sumbal Drower'),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Maryam'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Ayesha'),
                ),
              ),
            ],
          ),
        ),
        body: Container(
            height: 500,
            width: 500,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(hintText: 'Entter Name'),
                        controller: userName,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: "Enter CNIC"),
                        controller: userCNIC,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: "Account No"),
                        controller: userAccountNo,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(hintText: " Enter Contect No"),
                        controller: userContectNo,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: " Enter Email"),
                        controller: userEmail,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: TextField(
                        decoration:
                            InputDecoration(hintText: " Enter Password"),
                        controller: userPassword,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 10),
                      child: RaisedButton(
                        onPressed: ()async {
                          if (userEmail.text.isEmpty ||
                              userPassword.text.isEmpty) {
                               

                                String user=await widget.auth.createUserWithEmailAndPassword(userEmail.text, userPassword.text);
                                 print('$user');
                         if(user!=null){
                           Firestore.instance.collection('user').document(user.toString()).setData({
                             'Name':userName.text,
                             'Cnic': userCNIC.text,
                             'Adress': userAccountNo.text,
                             'Contact No': userContectNo,
                             'Email':userEmail.text,
                             'Password':userPassword,
                           });




                        Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (cotext)=>DashboardScreen()),
                        );}
                            
                                  
                                  
                          }
                        },
                        child: Text('Submit'),


                      ))
                ])));
              
  }
}
