import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/presentation/order_food/view/widgets/menu_container.dart';

import '../screens/cart_view.dart';

class MenuListView extends StatefulWidget {
  final VoidCallback showCartPopup;
  final VoidCallback? onCartChanged;
  const MenuListView({super.key, required this.showCartPopup, this.onCartChanged});

  @override
  MenuListViewState createState() => MenuListViewState();
}

class MenuListViewState extends State<MenuListView> {
  List<Map<String, dynamic>> items = [
    {
      'name': 'Pizza vegan cheese',
      'inCart': true,
      'quantity': 1,
    },
    {
      'name': 'Chicken Tikka Pizza',
      'inCart': false,
      'quantity': 0,
    },
    {
      'name': 'Chicken Tikka Pizza',
      'inCart': false,
      'quantity': 0,
    },
    {
      'name': 'Chicken Tikka Pizza',
      'inCart': false,
      'quantity': 0,
    },
  ];

  void _addItem(int i) {
    setState(() {
      items[i]['inCart'] = true;
      items[i]['quantity'] = (items[i]['quantity'] as int) + 1;
    });
    if (widget.onCartChanged != null) widget.onCartChanged!();
  }

  void _removeItem(int i) {
    setState(() {
      if (items[i]['quantity'] > 1) {
        items[i]['quantity'] = (items[i]['quantity'] as int) - 1;
      } else {
        items[i]['inCart'] = false;
        items[i]['quantity'] = 0;
      }
    });
    if (widget.onCartChanged != null) widget.onCartChanged!();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, i) => const Divider(height: 1, color: Color(0xFFF2F2F2)),
      itemBuilder: (context, i) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
              child: MenuContainer(
                onAdd: () => _addItem(i),
                onRemove: () => _removeItem(i),
                inCart: items[i]['inCart'] as bool,
                quantity: items[i]['quantity'] as int,
              ),
            ),
          ],
        );
      },
    );
  }
}
