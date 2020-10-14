import 'package:flutter/material.dart';
import 'package:side_nav/model.dart';

class CollapsingSideBar extends StatefulWidget {
  @override
  _CollapsingSideBarState createState() => _CollapsingSideBarState();
}

class _CollapsingSideBarState extends State<CollapsingSideBar> {
  double maxWidth = 250;
  double minWidth = 70;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth,
      color: Colors.blueGrey,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return SideBarTile(
                    title: items[index].title, icon: items[index].icon);
              },
              itemCount: items.length,
            ),
          ),
          Icon(
            Icons.chevron_left,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class SideBarTile extends StatefulWidget {
  final String title;
  final IconData icon;
  SideBarTile({this.title, this.icon});
  @override
  _SideBarTileState createState() => _SideBarTileState();
}

class _SideBarTileState extends State<SideBarTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(widget.icon, color: Colors.white),
          SizedBox(width: 10),
          Text(widget.title)
        ],
      ),
    );
  }
}
