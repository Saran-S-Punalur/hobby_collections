import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:hobby_collections/widgets/appBarFile.dart';
import 'package:hobby_collections/widgets/buttons.dart';
import 'package:hobby_collections/widgets/drawerItems.dart';
import 'package:hobby_collections/widgets/room.dart';

import 'loginScreen.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final db = FirebaseFirestore.instance;
  final  userid = FirebaseAuth.instance.currentUser!.uid;


  Widget logoutButton(){
    return FloatingActionButton(
      child: Text("Log Out"),
      onPressed: ()  {signOutCloud();},);}

  Future signOutCloud() async {
    setState(() {
      Navigator.pop(context,
          MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    await FirebaseAuth.instance.signOut();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Collections App"),
        actions: [
          IconButton(onPressed: logoutButton , icon: Icon(Icons.logout)),
        ],
      ),
      drawer: DrawerItems(),

      body: Stack(
        children: [
          Container(
            child: StreamBuilder<QuerySnapshot>(
              builder: (context, snapshot){
                if (snapshot.hasData){
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index){
                        DocumentSnapshot ds = snapshot.data!.docs[index];
                        return Room(hobbyName: ds["title"], hobbyDetail: ds['Details'],);
                      });
                }


                else if(snapshot.hasError){ return CircularProgressIndicator();}
                else{ return CircularProgressIndicator();}
              },
              stream: db.collection(userid).snapshots(),
            ),
          ),

          AddButton()
        ],
      ),
    );
  }
}





