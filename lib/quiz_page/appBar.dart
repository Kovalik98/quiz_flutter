import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';



class AppBarNadigationState extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      height: 60,
      child: ClipRRect(
        borderRadius: new BorderRadius.all(
          Radius.circular(50),
        ),
        child: Column(
          children: <Widget>[
            CubertoBottomBar(
              // inactiveIconColor: inactiveColor,
              tabStyle: CubertoTabStyle.STYLE_FADED_BACKGROUND, // By default its CubertoTabStyle.STYLE_NORMAL
              initialSelection: 0, // By default its 0
              drawer: CubertoDrawer.NO_DRAWER, // By default its NO_DRAWER (Availble START_DRAWER and END_DRAWER as per where you want to how the drawer icon in Cuberto Bottom bar)
              tabs: [
                TabData(
                    iconData: Icons.headset_mic,
                    title: "Home",
                    tabColor: Colors.indigo),
                TabData(
                    iconData: Icons.insert_drive_file,
                    title: "Search",
                    tabColor: Colors.pink),
                TabData(
                    iconData: Icons.create,
                    title: "Alarm",
                    tabColor: Colors.amber),
                TabData(
                    iconData: Icons.mic,
                    title: "Settings",
                    tabColor: Colors.teal),
              ],
              onTabChangedListener: (position, title, color) {

              },
            ),
          ],
        ),
      ),
    );
  }

}
