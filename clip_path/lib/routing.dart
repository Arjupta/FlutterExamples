import 'package:flutter/material.dart';

class SideNavRouteItem {
  Key key;
  String name;
  IconData icon;
  SideNavRouteItem({this.name, this.icon}) {
    this.key = Key(name);
  }
}

// List<SideNavRouteItem> screenList = [
//   SideNavRouteItem(name: "Home", isSelected: false),
//   SideNavRouteItem(name: "Profile", isSelected: false),
//   SideNavRouteItem(name: "Notification", isSelected: false),
//   SideNavRouteItem(name: "Search", isSelected: false),
//   SideNavRouteItem(name: "Favourite", isSelected: false),
// ];
