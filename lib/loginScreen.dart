import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hobby_collections/home.dart';
import 'package:hobby_collections/loginPageTwo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final  _userName = TextEditingController();
  final   _eMail= TextEditingController();
  final   _password= TextEditingController();
  final   _cnfPassword= TextEditingController();

   late String userNv;
   late String emailv;
   late String passv;
   late String repassv;


  //===============================================================

  Widget _builduser(){
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: "Enter your userame", labelText: "Username"),
      controller: _userName,
      validator: (String? val){if(val!.isEmpty){return "Required";} else{return null;}},
      onChanged: (val){userNv = val;},);}

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

  Widget _buildrepass(){
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: "Reenter your password", labelText: "Re-enter Password"),
      obscureText: true,
      controller: _cnfPassword,
      validator: (String? val){
        if(val!.isEmpty){return "Required";}
        else if(_password.text != _cnfPassword.text){ return "Passwords did not match";}
        else{return null;}},
      onChanged: (val){repassv = val;},);}



  Widget registerButton(){

    return FloatingActionButton(
      child: Text("Register"),
      onPressed: ()  {
        if (_formKey.currentState!.validate()){
          registerToCloud();
        }},);}



  Future registerToCloud()async {
    try{
      User? user = (await FirebaseAuth.instance.createUserWithEmailAndPassword
        (email: _eMail.text, password: _password.text)).user;

      if(user != null){
        FirebaseAuth.instance.currentUser!.updateDisplayName(_userName.text);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));}
    }
    catch(e){print(e);}}

  Widget logoutButton(){
    return FloatingActionButton(
      child: Text("Log Out"),
      onPressed: ()  {signOutCloud();},);}

    Future signOutCloud() async {await FirebaseAuth.instance.signOut();}



    Future loginFunc () async {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPageTwo()));}


    Widget loginButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Already a user ?"),
        TextButton(onPressed: loginFunc, child: Text("Click Here to Login")),
      ],
    );
    }
  //===============================================================


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
              _builduser(),
              _buildemail(),
              _buildpass(),
              _buildrepass(),
              SizedBox(height: 20,),
              registerButton(),
              SizedBox(height: 20,),
              loginButton()


            ],
          ),

        ),
      ),
    );
  }
}
