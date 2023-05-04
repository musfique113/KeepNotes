import 'package:flutter/material.dart';
import 'package:googlekeep/SideMenuBar.dart';
import 'package:googlekeep/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:googlekeep/NoteView.dart';
import 'package:googlekeep/CreateNoteView.dart';

class ArchiveView extends StatefulWidget {
  const ArchiveView({Key? key}) : super(key: key);

  @override
  State<ArchiveView> createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String note =
      "THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE";
  String note1 = "THIS IS NOTE THIS IS NOTE THIS IS NOTE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 35,),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNoteView()));

        },
        backgroundColor: cardColor,

      ),
      key: _drawerKey,
      drawer: SideMenu(),
      endDrawerEnableOpenDragGesture: true,
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3),
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              _drawerKey.currentState!.openDrawer();
                            },
                            icon: Icon(Icons.menu),
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 55,
                            width: 200,
                            // decoration: BoxDecoration(
                            //     //border: Border.all(color: Colors.white)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Search your Notes",
                                  style: TextStyle(
                                      color: white.withOpacity(0.5),
                                      fontSize: 19),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // row two
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.grid_view,
                                  color: white,
                                )),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                NoteSectionAll(),
                NotesListSection(),

                // Container(
                //     padding: EdgeInsets.symmetric(
                //       horizontal: 10,
                //       vertical: 15,
                //     ),
                //     child: StaggeredGridView.countBuilder(
                //         physics: NeverScrollableScrollPhysics(),
                //         shrinkWrap: true,
                //         itemCount: 10,
                //         mainAxisSpacing: 12,
                //         crossAxisSpacing: 12,
                //         crossAxisCount: 4,
                //         staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                //         itemBuilder: (context, index) => InkWell(
                //           onTap: () {
                //             //Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView()));
                //           },
                //           child: Container(
                //             padding: EdgeInsets.all(10),
                //             decoration: BoxDecoration(
                //               color: index.isEven ? Colors.green[900] : Colors.blue[900],
                //                 border:
                //                 Border.all(color:index.isEven ? Colors.green.withOpacity(0.4) : Colors.blue.withOpacity(0.4)),
                //                 borderRadius: BorderRadius.circular(7)),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text("HEADING",
                //                     style: TextStyle(
                //                         color: white,
                //                         fontSize: 20,
                //                         fontWeight: FontWeight.bold)),
                //                 SizedBox(
                //                   height: 10,
                //                 ),
                //                 Text(
                //                   index.isEven
                //                       ? note.length > 250
                //                       ? "${note.substring(0, 250)}..."
                //                       : note
                //                       : note1,
                //                   style: TextStyle(color: white),
                //                 )
                //               ],
                //             ),
                //           ),
                //         )
                //     )
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget NoteSectionAll() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Text(
                  "ALL",
                  style: TextStyle(
                      color: white.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                crossAxisCount: 4,
                staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: white.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("HEADING",
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          index.isEven
                              ? note.length > 250
                              ? "${note.substring(0, 250)}..."
                              : note
                              : note1,
                          style: TextStyle(color: white),
                        )
                      ],
                    ),
                  ),
                ))),
      ],
    );
  }

  Widget NotesListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Text(
                  "List View",
                  style: TextStyle(
                      color: white.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: white.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("HEADING",
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          index.isEven
                              ? note.length > 250
                              ? "${note.substring(0, 250)}..."
                              : note
                              : note1,
                          style: TextStyle(color: white),
                        ),
                      ],
                    ),
                  ),
                ))),
        //SizedBox(height: 10,)
      ],
    );
  }
}
