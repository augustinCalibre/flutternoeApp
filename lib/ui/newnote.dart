import 'package:challenge_note/dataBase/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewNoteInput extends StatefulWidget {
  const NewNoteInput({
    Key key
  }):super(key:key);
  @override
  _NewNoteInputState createState() => _NewNoteInputState();
}

class _NewNoteInputState extends State<NewNoteInput> {
  TextEditingController controller; 
  @override
  void initState() {
    
    super.initState();
    controller=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        _buildTextField(context),
        _buildDateButton(context),
      ],),
      
    );
  }

  Expanded  _buildTextField (BuildContext context){
    return Expanded(
      child:TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText:'Vote Note',
          
        ),
        onSubmitted: (inputName){
          final database=Provider.of(context)<AppDatabase>(context);
          final note=NoteData(
            note: inputName,
            
            );
            database.insertNote(note);
            
        },

      ),
    );
    
  }
 IconButton _buildDateButton(BuildContext context){
   return IconButton(icon: Icon(Icons.send), onPressed: (){
     setState(() {
        controller.clear();
      });
   });
 }
}