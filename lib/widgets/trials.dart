import 'package:flutter/material.dart';
import 'package:hobby_collections/widgets/room.dart';


class TrialPage extends StatelessWidget {
  const TrialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ListView(
            children: [
              Room(hobbyDetail: "Stamp Collection", hobbyName: "Philately",),
              Room(),
            ],
          ),
          
          // Add button
          
          Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),  ),
          )
        ],
      ),

    );
  }
}


/*   TO DO LATER


1. MAKE GRID


 */

