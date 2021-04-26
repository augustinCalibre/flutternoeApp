import 'package:challenge_note/dataBase/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Note App'),
         backgroundColor:Colors.red,

      ),
      body: Column(
        children: [
          Expanded(
            child:_buildNote(context)),
          // NewTaskInput( ),           
        ],
      ),

    );
  }
  StreamBuilder<List<NoteData>> _buildNote(context){
    final database=Provider.of(context)<AppDatabase>(context);
    return StreamBuilder(
      stream: database.watchAllNote(),
      builder: (context, AsyncSnapshot<List<NoteData>> snapshot){
        final notes =snapshot.data ?? List();
        return ListView.builder(
          itemCount: notes.length ,
          itemBuilder: (BuildContext context, int index) {
            final itemnote=notes[index];
          return _buildListNote(itemnote,database);
         },
        );


      },
    );
  }
  Widget _buildListNote (NoteData itemnote, AppDatabase database){
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
       secondaryActions: [
        IconSlideAction(caption: 'Delete',
      color: Colors.red,
      icon: Icons.delete,
      onTap: ()=>database.deleteNote(itemnote),)
    
      ],
      
       
      child:CheckboxListTile(
        value: itemnote.effectuer, 
        subtitle: Text(itemnote.date?.toString() ?? 'No date'),
        onChanged:(newValue){
        database.updatetNote(itemnote.copyWith(effectuer:newValue));

      })

       );
  }

}