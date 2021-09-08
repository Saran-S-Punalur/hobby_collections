import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hobby_collections/home.dart';


class LoginPageTwo extends StatefulWidget {
  const LoginPageTwo({Key? key}) : super(key: key);

  @override
  _LoginPageTwoState createState() => _LoginPageTwoState();
}

class _LoginPageTwoState extends State<LoginPageTwo> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final   _eMail= TextEditingController();
  final   _password= TextEditingController();

  late String emailv;
  late String passv;

  //======================================================================

  Widget _buildemail(){
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: "Enter your Email ID", labelText: "Email"),
      controller: _eMail,
      validator: (String? val){if(val!.isEmpty){return "Required";} else{return null;}},
      onChanged: (val){emailv = val;},);}


  Widget _buildpass(){
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: "Enter password", labelText: "Password"),
      controller: _password,
      obscureText: true,
      validator: (String? valp){if(valp!.isEmpty){return "Required";} else{return null;}},
      onChanged: (valp){passv = valp;},);}



  Future loginFunc () async {
    try{
      User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword
        (email: _eMail.text, password: _password.text)).user;

      if(user != null){

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));}
    }
    catch(e)
    {print(e);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
    Text(" "), duration: Duration(seconds: 2),));
    }}




      //=======================================================================


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade400,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              _buildemail(),
              _buildpass(),


              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if (_formKey.currentState!.validate()){
                  loginFunc();
                }}, child: Text("Login"))


            ],
          ),

        ),
      ),
    );
  }
}
