import 'package:flutter/material.dart';
import 'package:googlekeep/NoteView.dart';
import 'package:googlekeep/colors.dart';
import 'package:googlekeep/services/db.dart';

import 'home.dart';
import 'model/MyNoteModel.dart';

class EditNoteView extends StatefulWidget {
  Note note;
  EditNoteView({required this.note});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late String newTitle ;
  late String newNoteDetails ;

  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      this.newTitle = widget.note.title.toString();
      this.newNoteDetails = widget.note.content.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () async{
                Note newNote = Note(content: newNoteDetails , title: newTitle , createdTime:  widget.note!.createdTime, pin: widget.note!.pin ,isArchived: widget.note!.isArchived, uniqueID: widget.note!.uniqueID.toString());
                await NotesDatabse.instance.updateNote(newNote);
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NoteView(note: newNote,)));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
              },
              splashRadius: 17,
              icon: Icon(Icons.save_outlined))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Form(
              child: TextFormField(
                initialValue: newTitle,
                cursorColor: white,
                onChanged: (value){
                  newTitle = value;
                },
                style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.withOpacity(0.8))),
              ),
            ),
            Container(
              height: 300,
              child: Form(
                child: TextFormField(
                  initialValue: newNoteDetails,
                  keyboardType: TextInputType.multiline,
                  minLines: 50,
                  maxLines: null,
                  cursorColor: white,
                  onChanged: (value){
                    newNoteDetails = value;
                  },
                  style: TextStyle(fontSize: 17, color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Notes",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.8))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
