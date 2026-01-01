import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/presentation/counter_sale/view/screens/counter_sale_cart_view.dart';
import 'counter_menu_container.dart';

class CounterMenuListView extends StatefulWidget {
  final VoidCallback? onCartChanged;
  const CounterMenuListView({super.key, this.onCartChanged});

  @override
  CounterMenuListViewState createState() => CounterMenuListViewState();
}

class CounterMenuListViewState extends State<CounterMenuListView> {
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
  ];

  void _addItem(int i) {
    setState(() {
      items[i]['inCart'] = true;
      items[i]['quantity'] = (items[i]['quantity'] as int) + 1;
    });
    widget.onCartChanged?.call();
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
    widget.onCartChanged?.call();
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
            CounterMenuContainer(
              onAdd: () => _addItem(i),
              onRemove: () => _removeItem(i),
              inCart: items[i]['inCart'] as bool,
              quantity: items[i]['quantity'] as int,
            ),
          ],
        );
      },
    );
  }
}
