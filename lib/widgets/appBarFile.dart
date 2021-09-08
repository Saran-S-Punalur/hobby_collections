import 'package:flutter/material.dart';



class MyAppBar extends StatelessWidget implements PreferredSizeWidget{


  final AppBar appBar;

  const MyAppBar({Key? key, required this.appBar }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Collections"),
      centerTitle: true,

      actions: [
        IconButton(onPressed: (){} , icon: Icon(Icons.refresh)),
        //IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
