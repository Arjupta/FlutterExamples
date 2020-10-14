import 'package:flutter/material.dart';
import 'package:side_nav/model.dart';

class CollapsingSideBar extends StatefulWidget {
  @override
  _CollapsingSideBarState createState() => _CollapsingSideBarState();
}

class _CollapsingSideBarState extends State<CollapsingSideBar>
    with TickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 70;
  bool isCollpsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentTab = 0;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: widthAnimation.value,
          color: Colors.blueGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(color: Colors.grey, height: 40);
                    },
                    itemBuilder: (context, index) {
                      return SideBarTile(
                        title: items[index].title,
                        icon: items[index].icon,
                        animationController: _animationController,
                        isSelected: index == currentTab,
                        onTap: () {
                          setState(() {
                            currentTab = index;
                          });
                        },
                      );
                    },
                    itemCount: items.length,
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      isCollpsed = !isCollpsed;
                      isCollpsed
                          ? _animationController.reverse()
                          : _animationController.forward();
                    });
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.close_menu,
                    progress: _animationController,
                    color: Colors.white,
                    size: 50.0,
                  )),
            ],
          ),
        );
      },
    );
  }
}

class SideBarTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final bool isSelected;
  final Function onTap;
  SideBarTile(
      {this.title,
      this.icon,
      this.animationController,
      this.isSelected,
      this.onTap});
  @override
  _SideBarTileState createState() => _SideBarTileState();
}

class _SideBarTileState extends State<SideBarTile> {
  Animation<double> widthAnimation;
  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 250, end: 70).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: widget.isSelected
                ? Colors.transparent.withOpacity(0.3)
                : Colors.blueGrey),
        width: widthAnimation.value,
        child: Row(
          mainAxisAlignment: widthAnimation.value != 70
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Icon(widget.icon,
                color: widget.isSelected ? Colors.blue : Colors.white,
                size: 38.0),
            Visibility(
                visible: widthAnimation.value >= 220,
                child: SizedBox(width: 10)),
            Visibility(
                visible: widthAnimation.value >= 200, child: Text(widget.title))
          ],
        ),
      ),
    );
  }
}
