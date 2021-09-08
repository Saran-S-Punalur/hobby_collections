import 'package:flutter/material.dart';
import 'package:hobby_collections/home.dart';
import 'package:hobby_collections/widgets/appBarFile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HobbyForm extends StatefulWidget {
  const HobbyForm({Key? key}) : super(key: key);

  @override
  _HobbyFormState createState() => _HobbyFormState();
}

class _HobbyFormState extends State<HobbyForm> {

  final  _hobbyName = TextEditingController();
  final   _hobbyDetail= TextEditingController();
  final   _owner= TextEditingController();
  final   _id= TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  final db = FirebaseFirestore.instance;
  final  userid = FirebaseAuth.instance.currentUser!.uid;

    late String title = "";
   late String detail = "";
   late String owner = "";
   late String id ="";



  //===================================================================
  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.collections_bookmark),
        hintText: "Enter Collection  Title",
        labelText: "Title"
      ),
      controller: _hobbyName,
      validator: (String? val){
        if(val!.isEmpty){return "Required";}
        else{return null;}},

      onChanged: (val){
        title = val;
      },

    );
  }


  Widget _buildDetail(){
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.description),
          hintText: "Enter short details",
          labelText: "Detail"
      ),
      controller: _hobbyDetail,

      validator: (String? val){
        if(val!.isEmpty){
          return "Required";
        } else{return null;}},

      onChanged: (val){
        detail = val;
      },

    );
  }

  Widget _buildOwner(){
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: "Enter Owner's Name",
          labelText: "Owner"
      ),
      controller: _owner,

      validator: (String? val){
        if(val!.isEmpty){
          return "Required";
        }
        else{return null;}},

      onChanged: (val){
        owner = val;
      },

    );
  }

  Widget _buildId(){
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.confirmation_num),
          hintText: "Enter Hobby ID",
          labelText: "ID"
      ),
      controller: _id,

      validator: (String? val){
        if(val!.isEmpty){
          return "Required";
        }
        else{return null;}},

      onChanged: (val){
        id = val;
      },

    );
  }

  //===================================================================
 void _saveForm(){

  if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Processing..."), duration: Duration(seconds: 1),));

      db.collection(userid).add({'title' : title,
        'Details' : detail,
        'Owner' : owner,
        'ID' : id  });
      Navigator.pop(context,
          MaterialPageRoute(builder: (context) => Home()));
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
    Text("Please fill all required fields"), duration: Duration(seconds: 2),));
  }


 }


//---------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBar: AppBar(),),
      body: Container(

        child: Form(
          key: _formKey,
          child: ListView(

              children: [
                SizedBox(height: 50,),
                _buildName(),
                SizedBox(height: 10,),
                _buildDetail(),
                SizedBox(height: 10,),
                _buildOwner(),
                SizedBox(height: 10,),
                _buildId(),
                SizedBox(height: 20,),
                Padding(
                  padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.3),
                  child: ElevatedButton(
                      onPressed: _saveForm,
                      child: Text("Add")),
                )
              ],

          ),
        ),

      ),
    );
  }
}
