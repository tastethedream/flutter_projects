import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/home/tab_item.dart';

class  CupertinoHomeScaffold extends StatelessWidget {
  const CupertinoHomeScaffold({Key key, @required this.currentTab, @required this.onSelectTab}) : super(key: key);
  //currently selected tab
  final TabItem currentTab;
  //changed tab
  final ValueChanged<TabItem> onSelectTab;


  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            _buildItem(TabItem.jobs),
            _buildItem(TabItem.entries),
            _buildItem(TabItem.account),
          ],
          onTap: (index) => onSelectTab(TabItem.values[index]),
        ),
          tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return Container();
            },
          );
          },
        );
  }
  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem];
    // highlight selected item indigo and others grey
    final color = currentTab == tabItem ? Colors.indigo : Colors.grey;
    return BottomNavigationBarItem(
        icon: Icon(
            itemData.icon,
            color: color,
            ),
        title: Text(
            itemData.title,
            style: TextStyle(color: color),
        ),
    );
  }
}