import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Room extends StatefulWidget {

  final String hobbyName;
  final IconData hobbyIcon;
  final String hobbyDetail;

  Room({
    this.hobbyIcon = Icons.collections,
    this.hobbyName = "No Hobby name Given",
    this.hobbyDetail= "Short description"
  });

  @override
  _RoomState createState() => _RoomState();
}

enum Options{AddItem, RemoveItem, Select, Delete, Edit}

class _RoomState extends State<Room> {

  final db = FirebaseFirestore.instance;

  Future<void> _optionDialog() async {
    switch (await showDialog<Options>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                child: Text("Add item "),
                onPressed: (){Navigator.pop(context, Options.AddItem);},

              ),

              SimpleDialogOption(
                child: Text("Remove item "),
                onPressed: (){Navigator.pop(context, Options.RemoveItem);},
              ),

              SimpleDialogOption(
                child: Text("Select Collection "),
                onPressed: (){Navigator.pop(context, Options.Select);},
              ),

              SimpleDialogOption(
                child: Text("Edit Collection "),
                onPressed: (){Navigator.pop(context, Options.Edit);},
              ),

              SimpleDialogOption(
                child: Text("Delete Collection "),
                onPressed: (){Navigator.pop(context, Options.Delete);},
              ),
            ],
          ); } ))
    {

      case Options.AddItem:

        break;

      case Options.Delete:

        db.collection('hobbyAppID').doc().delete();

        break;

      case Options.Edit:
        break;

      case Options.RemoveItem:
        break;

      case Options.Select:
        break;

      case null:
        break;


    }}




  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.blueGrey,
      elevation: 4,
      margin: EdgeInsets.only(top: 8, left: 3, right: 3),
      child: ListTile(

        leading: Icon(widget.hobbyIcon),
        title: Text(widget.hobbyName),
        trailing: IconButton(onPressed: _optionDialog, icon: Icon(Icons.more_vert)),
        tileColor: Colors.yellowAccent,
        subtitle: Text(widget.hobbyDetail),
        onTap: (){},

      ),
    );
  }
}

