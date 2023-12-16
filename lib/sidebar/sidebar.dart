import 'package:emergencyidea/main.dart';
import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:emergencyidea/map/maps.dart';

import '../Cubits/map_cubit.dart';
import '../alerts.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late List<CollapsibleItem> _items;
  late String _headline;

  late int Specificitem = 0;
  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<Widget> WidgetItems = [
    const MapSample(),
    const alerts(),
    const Placeholder(),
  ];
  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Map',
        icon: Icons.map_outlined,
        isSelected: true,
        onPressed: () => setState(() => Specificitem = 0),
      ),
      CollapsibleItem(
        text: 'Alerts',
        badgeCount: 3,
        icon: Icons.notifications,
        onPressed: () => setState(() => Specificitem = 1),
      ),
      CollapsibleItem(
          text: 'Patient Profile',
          icon: Icons.face,
          onPressed: () => setState(() => Specificitem = 2)),
      CollapsibleItem(
        text: 'Logout',
        icon: Icons.logout_outlined,
        onPressed: () => setState(() { Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => authpage()),
        );}),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Directionality(
                textDirection: TextDirection.ltr,
                child: SafeArea(
                  child: CollapsibleSidebar(
                    isCollapsed: MediaQuery.of(context).size.width <= 800,
                    items: _items,
                    collapseOnBodyTap: true,
                    title: 'Ambulance',
                    onTitleTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Yay! Flutter Collapsible Sidebar!')));
                    },
                    body: _body(size, context),
                    backgroundColor: Colors.black,
                    selectedTextColor: Colors.limeAccent,
                    textStyle:
                        TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                    titleStyle: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                    toggleTitleStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ))));
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50],
        child: WidgetItems[Specificitem]);
  }
}
