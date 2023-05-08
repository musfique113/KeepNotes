import 'package:flutter/material.dart';
import 'package:googlekeep/colors.dart';
import 'package:googlekeep/login_info.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late bool value;
  getSyncSet() async{
    LocalDataSaver.getSyncSet().then((valueFromDB){
      setState(() {
        value = valueFromDB!;
      });
    });
  }
  @override
  void initState() {
    getSyncSet();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text("Sync", style: TextStyle(color: white, fontSize: 16)),
                Spacer(),
                Transform.scale(
                  scale: 1,
                  child: Switch.adaptive(
                      value: value,
                      onChanged: (switchValue) {
                        setState(() {
                          this.value = switchValue;
                          LocalDataSaver.saveSyncSet(switchValue);
                        });
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
