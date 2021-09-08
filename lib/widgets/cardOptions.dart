import 'package:flutter/material.dart';

class CardOptionDialog extends StatefulWidget {
  const CardOptionDialog({Key? key}) : super(key: key);

  @override
  _CardOptionDialogState createState() => _CardOptionDialogState();
}

enum Options{AddItem, RemoveItem, Select, Delete, Edit}

class _CardOptionDialogState extends State<CardOptionDialog> {

  Future<void> _optionDialog() async {
    switch (await showDialog<Options>(
        context: context,
        builder: (BuildContext context) {
    return SimpleDialog(
    children: [
    SimpleDialogOption(
    child: Text("Add item "),
    onPressed: (){},
    ),

    SimpleDialogOption(
    child: Text("Remove item "),
    onPressed: (){},
    ),

    SimpleDialogOption(
    child: Text("Select Collection "),
    onPressed: (){},
    ),

    SimpleDialogOption(
    child: Text("Edit Collection "),
    onPressed: (){},
    ),

    SimpleDialogOption(
    child: Text("Delete Collection "),
    onPressed: (){},
    ),
    ],
    ); } ))
    {

      case Options.AddItem:

        break;

      case Options.Delete:

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
    return Container();
  }
}
