import 'package:moor_flutter/moor_flutter.dart';


part 'moor_database.g.dart';



class Note extends Table {
  // auto Incremenation de la cle primaire
  IntColumn get id => integer().autoIncrement()();
  TextColumn get note =>text().withLength(min:1,max:60)();
  TextColumn get description =>text().withLength(min:1,max:120)();
  BoolColumn get effectuer => boolean().withDefault(Constant(false))();
  DateTimeColumn get date =>dateTime().nullable()();
}

@UseMoor(tables: [Note])
class AppDatabase extends _$AppDatabase {

  AppDatabase(): super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite',
  logStatements: true));

@override
int get schemaVersion=>1;

Future<List<NoteData>> getAllNote()=>select(note).get();
Stream<List<NoteData>> watchAllNote()=>select(note).watch();
Future insertNote(NoteData notes)=>into(note).insert(notes);
Future updatetNote(NoteData notes)=>update(note).replace(notes);
Future deleteNote(NoteData notes)=>delete(note).delete(notes);

}

