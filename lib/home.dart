import 'package:flutter/material.dart';
import 'package:googlekeep/SideMenuBar.dart';
import 'package:googlekeep/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _drawerKey,
      drawer: SideMenu(),
      endDrawerEnableOpenDragGesture: true,
      backgroundColor: bgColor,
      body: SafeArea(
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
                        SizedBox(width: 16,),
                        Container(
                          height: 55,
                          width: 200,
                          // decoration: BoxDecoration(
                          //     //border: Border.all(color: Colors.white)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Search your Notes", style: TextStyle(color: white.withOpacity(0.5),fontSize: 19),)
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
                            child: Icon(Icons.grid_view,
                              color: white,
                            )
                          ),
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    children: [
                      Text("ALL", style: TextStyle(color: white.withOpacity(0.5),
                      fontSize: 14, fontWeight: FontWeight.bold),),

                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
