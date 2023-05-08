import 'package:flutter/material.dart';
import 'package:googlekeep/ArchiveView.dart';
import 'package:googlekeep/EditNoteView.dart';
import 'package:googlekeep/colors.dart';
import 'package:googlekeep/home.dart';
import 'package:googlekeep/model/MyNoteModel.dart';
import 'package:googlekeep/services/db.dart';
import 'package:intl/intl.dart';

class NoteView extends StatefulWidget {
  Note note;
  NoteView ({required this.note});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [
          //pin
          IconButton(
              onPressed: () async{
                await NotesDatabse.instance.pinNote(widget.note);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              },
              splashRadius: 18,
              icon: Icon(widget.note!.pin ? Icons.push_pin : Icons.push_pin_outlined)),
          //archived
          IconButton(
              onPressed: () async{
                await NotesDatabse.instance.aechivedNote(widget.note);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
              splashRadius: 18,
              icon: Icon(widget.note!.isArchived ? Icons.archive : Icons.archive_outlined)),
          //edit
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView(note: widget.note)));
              },
              splashRadius: 18,
              icon: Icon(Icons.edit_outlined)),
          //delete
          IconButton(
              onPressed: () async{
                await NotesDatabse.instance.delteNote(widget.note);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              },
              splashRadius: 18,
              icon: Icon(Icons.delete_outline_outlined))
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Created On ${DateFormat("dd-MM-yyyy - h:mm a").format(widget.note!.createdTime)}",style: TextStyle(color: Colors.white,fontSize: 11,fontStyle: FontStyle.italic),),
              SizedBox(height: 10,),
              Text(widget.note.title ,style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(widget.note.content,style: TextStyle(color: Colors.white),),
            ],
          )
        ),
      ),
    );
  }
}
