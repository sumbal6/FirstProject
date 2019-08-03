import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'sumbal2.dart';
import 'package:google_sign_in/google_sign_in.dart';
// package ka e miss tha our flutter ka t miss tha


class Login extends StatefulWidget {

_LoginState createState()=>_LoginState();
}
class _LoginState extends State<Login>{
  final useremail=TextEditingController();
   final userpasssword=TextEditingController();
  final GoogleSignIn _googleSignIn=GoogleSignIn();

final FirebaseAuth _firebaseAuth=FirebaseAuth.instance; 




  @override
  void dispose(){
    super.dispose();
    useremail.dispose();
    userpasssword.dispose();
  }
  Widget build(BuildContext cotext){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
        ),
        body: Container(
          height: 500,
          width: 500,
          child:Column(
            mainAxisAlignment: 
            MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: <Widget>[
            Hero(
              tag: 'Logo',
              child: FlutterLogo(
                size: 70,
              
              ),
            ),
            Padding(
              padding: 
              EdgeInsets.only(left:50,right: 50),
              child: TextFormField(keyboardType: TextInputType.emailAddress,
                decoration: 
                InputDecoration(hintText: "Email"),
                validator: validationEmail,
              )
            ),
            Padding(
              padding: 
              EdgeInsets.only(left:40,right:40),
              child:TextFormField(
                obscureText: true,
                decoration: 
                InputDecoration(hintText:"Password")
              )
            ),
            Padding(
              padding: 
              EdgeInsets.only(left:40,right:40,top:20),
              child: Align(
                alignment: 
              Alignment.centerRight,
              child: Text("Forget password")
              )
            ),
            Padding(
              padding: 
              EdgeInsets.only(left:30,right:30,top:15),
              child: Align(
                alignment: 
                Alignment.bottomCenter,
                child: Text("Become a Partner")
              ),
              
            ),
            Padding(
              padding:
              EdgeInsets.only(left:30,right:30,top:10) ,
              child: RaisedButton(
                child: Text('Login'),
                onPressed: (){
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Signup()),
  );
                },
              )),

              Padding(
              padding:EdgeInsets.only(left:30,right:30,top:10) ,
              child: RaisedButton(
                child: Text('sign in through Gmail'),
                onPressed: () => _signInWithGoogle,
            ))]))));

  }
  String validationEmail(String value){
    Pattern pattern=r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if(!regex.hasMatch(value))
    return 'Enter valid Email';
    else
    return null;
  }
  Future<void> _signInWithGoogle(BuildContext context) async{
    final GoogleSignInAccount googleuser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleauth=
    await googleuser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleauth.accessToken,
      idToken: googleauth.idToken,
    );
    var userDetail = await _firebaseAuth.signInWithCredential(credential);

    print('user Details');
}
}
