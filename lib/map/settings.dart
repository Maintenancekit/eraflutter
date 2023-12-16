/*import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'dart:math' as math show pi;
class Parent extends StatefulWidget {
  const Parent({super.key});

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  late String _headline = 'Default';
  List<CollapsibleItem> get _items {
    return [
      CollapsibleItem(
          text: 'Shop',
          iconImage: AssetImage("assets/shop_icon.png"), //`iconImage` has priority over `icon` property
          icon: Icons.ac_unit,
          onPressed: () => setState(() => _headline = 'Shop'),
          onHold: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text("Shop"))
          ),
          isSelected: true,
          subItems: [
            CollapsibleItem(
              text: 'Cart',
              icon: Icons.shopping_cart,
              onPressed: () => setState(() => _headline = 'Cart'),
              onHold: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text("Cart"))
              ),
              isSelected: true,
            )
          ]
      ),
      CollapsibleItem(
        text: 'Dashboard',
        badgeCount: 7,
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'DashBoard'),
        onHold: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text("DashBoard"))
        ),
      ),
      CollapsibleItem(
        text: 'Ice-Cream',
        icon: Icons.icecream,
        onPressed: () => setState(() => _headline = 'Ice-Cream'),
        onHold: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text("Ice-Cream"))
        ),
      ),
      CollapsibleItem(
        text: 'Search',
        icon: Icons.search,
        onPressed: () => setState(() => _headline = 'Search'),
        onHold: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text("Search"))
        ),
      ),
    ];
  }

  @override
  Widget build(Size size,BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child:CollapsibleSidebar(items: _items,
      body: _body(size,context)
  }
  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.3, -size.width * 0.23),
            child: Text(
              _headline,
              style: Theme.of(context).textTheme.displayLarge,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
*/