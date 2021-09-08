import 'package:flutter/material.dart';
import 'package:hobby_collections/widgets/hobbyForm.dart';




class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 12),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HobbyForm() ));
          },

          child: Icon(Icons.add),elevation: 4,),
      ),
    );
  }
}