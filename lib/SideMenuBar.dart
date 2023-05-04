import 'package:flutter/material.dart';
import 'package:googlekeep/ArchiveView.dart';
import 'package:googlekeep/Setting.dart';
import 'package:googlekeep/colors.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: bgColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: Text(
                  "Keep Notes",
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Divider(
                color: white.withOpacity(0.3),
              ),
              sectionOne(),
              SizedBox(height: 8,),
              sectionTwo(),
              SizedBox(height: 8,),
              sectionSettings(),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionOne(){
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                ),
              )
          ),
        ),
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            children: [
              Icon(Icons.lightbulb,
                size:25 ,
                color: white.withOpacity(0.6),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Notes",
                style: TextStyle(color: white.withOpacity(0.6),
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget sectionTwo(){
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
          //backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                ),
              )
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ArchiveView()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            children: [
              Icon(Icons.archive_outlined,
                size:25 ,
                color: white.withOpacity(0.6),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Archive",
                style: TextStyle(color: white.withOpacity(0.6),
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget sectionSettings(){
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
          //backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                ),
              )
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            children: [
              Icon(Icons.settings_outlined,
                size:25 ,
                color: white.withOpacity(0.6),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Settings",
                style: TextStyle(color: white.withOpacity(0.6),
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
