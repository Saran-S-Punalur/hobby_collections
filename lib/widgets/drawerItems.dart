import 'package:flutter/material.dart';


class DrawerItems extends StatelessWidget {
  const DrawerItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Collections App')),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Rate Collections App"),
              leading: Icon(Icons.star),
            ),
            ListTile(
              title: Text("Restart App"),
              leading: Icon(Icons.restart_alt),
            ),
            ListTile(
              title: Text("Share Collections App"),
              leading: Icon(Icons.share),
            ),
            ListTile(
              title: Text("About Collections App"),
              leading: Icon(Icons.help_outlined),
            ),
          ],
        )
    );
  }
}
