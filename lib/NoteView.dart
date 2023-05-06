import 'package:flutter/material.dart';
import 'package:googlekeep/EditNoteView.dart';
import 'package:googlekeep/colors.dart';
import 'package:googlekeep/model/MyNoteModel.dart';

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
          IconButton(
              onPressed: () {},
              splashRadius: 18,
              icon: Icon(Icons.push_pin_outlined)),
          IconButton(
              onPressed: () {},
              splashRadius: 18,
              icon: Icon(Icons.archive_outlined)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView(note: widget.note)));
              },
              splashRadius: 18,
              icon: Icon(Icons.edit_outlined))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.note.title ,style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(widget.note.content,style: TextStyle(color: Colors.white),),
          ],
        )
      ),
    );
  }
}
