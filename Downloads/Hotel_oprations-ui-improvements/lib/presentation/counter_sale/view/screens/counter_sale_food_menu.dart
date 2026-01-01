import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/common/widget/common_blur_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/counter_filter_bloc.dart';
import '../widgets/counter_menu_listview.dart';
import 'counter_sale_cart_view.dart';

class CounterSaleFoodMenuScreen extends StatelessWidget {
  const CounterSaleFoodMenuScreen({super.key});

  static const List<String> _sortOptions = [
    'Price - low to high',
    'Price - high to low',
    'Rating - high to low',
  ];
  static const List<String> _vegOptions = [
    'Veg',
    'Non-Veg',
  ];
  static const List<String> _topPickOptions = [
    'Bestseller',
    'Rated 4+',
  ];
  static const List<String> _dietaryOptions = [
    'Sweets',
    'Spicy',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterFilterBloc(),
      child: _CounterSaleFoodMenuScreenContent(),
    );
  }
}

class _CounterSaleFoodMenuScreenContent extends StatefulWidget {
  @override
  State<_CounterSaleFoodMenuScreenContent> createState() => _CounterSaleFoodMenuScreenContentState();
}

class _CounterSaleFoodMenuScreenContentState extends State<_CounterSaleFoodMenuScreenContent>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isVegSelected = true;
  final _menuListKey = GlobalKey<CounterMenuListViewState>();

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  Widget buildOutlinedIconButton({
    required Widget icon,
    required String label,
    required VoidCallback onPressed,
    bool selected = false,
    Color borderColor = const Color(0xFFBDBDBD),
    Color? backgroundColor,
    double borderRadius = 8,
    TextStyle? textStyle,
  }) {
    return OutlinedButton.icon(
      icon: icon,
      label: Text(label, style: textStyle),
      style: OutlinedButton.styleFrom(
        backgroundColor: selected
            ? const Color(0xFFF5F5F5)
            : (backgroundColor ?? Colors.white),
        side: BorderSide(
          color: selected ? const Color(0xFF18181B) : borderColor,
          width: selected ? 2 : 1,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
      onPressed: onPressed,
    );
  }

  Widget buildElevatedButton({
    required String label,
    required VoidCallback onPressed,
    Color backgroundColor = const Color(0xFF18181B),
    double borderRadius = 8,
    TextStyle? textStyle,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
      child: Text(label,
          style: textStyle ??
              const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
    );
  }

  @override
  Widget build(BuildContext context) {
    const divider = Divider(height: 1, color: Color(0xFFE0E0E0));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.grayFFEFEFF4,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Counter Sale',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Color(0xFFBDBDBD)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return BlocProvider(
                              create: (_) => CounterFilterBloc(),
                              child: CommonBlurModal(
                                child: BlocBuilder<CounterFilterBloc, CounterFilterState>(
                                  builder: (context, filterState) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 24),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 24),
                                            child: Text(
                                              'Filter and Sorting',
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                            ),
                                          ),
                                          const SizedBox(height: 18),
                                          divider,
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
                                            child: const Text('Sort by', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                                            child: LayoutBuilder(
                                              builder: (context, constraints) {
                                                final double chipSpacing = 12;
                                                final double chipWidth = (constraints.maxWidth - chipSpacing) / 2;
                                                return Wrap(
                                                  spacing: chipSpacing,
                                                  runSpacing: chipSpacing,
                                                  children: List.generate(
                                                    CounterSaleFoodMenuScreen._sortOptions.length,
                                                    (i) => SizedBox(
                                                      width: chipWidth,
                                                      child: FilterChip(
                                                        label: Text(
                                                          CounterSaleFoodMenuScreen._sortOptions[i],
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight: filterState.selectedSortIndex == i ? FontWeight.bold : FontWeight.w400,
                                                          ),
                                                        ),
                                                        selected: filterState.selectedSortIndex == i,
                                                        backgroundColor: Colors.white,
                                                        selectedColor: Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(8),
                                                          side: BorderSide(color: Color(0xFFBDBDBD)),
                                                        ),
                                                        onSelected: (_) {
                                                          context.read<CounterFilterBloc>().add(CounterSelectSort(i));
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 18),
                                          divider,
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
                                            child: const Text('Veg /Non-Veg Preferences', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                                            child: Row(
                                              children: List.generate(
                                                CounterSaleFoodMenuScreen._vegOptions.length,
                                                (i) => Padding(
                                                  padding: EdgeInsets.only(right: i == 0 ? 12 : 0),
                                                  child: buildOutlinedIconButton(
                                                    icon: SvgPicture.asset(
                                                      i == 0 ? MyIcons.veg : MyIcons.nonVeg,
                                                      colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                                                    ),
                                                    label: CounterSaleFoodMenuScreen._vegOptions[i],
                                                    onPressed: () {
                                                      context.read<CounterFilterBloc>().add(CounterSelectVeg(i));
                                                    },
                                                    selected: filterState.selectedVegIndex == i,
                                                    borderColor: Color(0xFFBDBDBD),
                                                    textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: filterState.selectedVegIndex == i ? FontWeight.bold : FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 18),
                                          divider,
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
                                            child: const Text('Top picks', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                                            child: Row(
                                              children: List.generate(
                                                CounterSaleFoodMenuScreen._topPickOptions.length,
                                                (i) => Padding(
                                                  padding: EdgeInsets.only(right: i == 0 ? 12 : 0),
                                                  child: buildOutlinedIconButton(
                                                    icon: i == 0
                                                        ? SvgPicture.asset(MyIcons.bestSeller, colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn))
                                                        : Icon(Icons.star_border, color: Colors.black),
                                                    label: CounterSaleFoodMenuScreen._topPickOptions[i],
                                                    onPressed: () {
                                                      context.read<CounterFilterBloc>().add(CounterSelectTopPick(i));
                                                    },
                                                    selected: filterState.selectedTopPickIndex == i,
                                                    borderColor: Color(0xFFBDBDBD),
                                                    textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: filterState.selectedTopPickIndex == i ? FontWeight.bold : FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 18),
                                          divider,
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
                                            child: const Text('Dietary Preferences', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                                            child: Row(
                                              children: List.generate(
                                                CounterSaleFoodMenuScreen._dietaryOptions.length,
                                                (i) => Padding(
                                                  padding: EdgeInsets.only(right: i == 0 ? 12 : 0),
                                                  child: buildOutlinedIconButton(
                                                    icon: i == 0
                                                        ? SvgPicture.asset(MyIcons.sweets, colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn))
                                                        : SvgPicture.asset(MyIcons.spicy),
                                                    label: CounterSaleFoodMenuScreen._dietaryOptions[i],
                                                    onPressed: () {
                                                      context.read<CounterFilterBloc>().add(CounterSelectDietary(i));
                                                    },
                                                    selected: filterState.selectedDietaryIndex == i,
                                                    borderColor: Color(0xFFBDBDBD),
                                                    textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: filterState.selectedDietaryIndex == i ? FontWeight.bold : FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 24),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: buildOutlinedIconButton(
                                                    icon: SizedBox.shrink(),
                                                    label: 'Clear All',
                                                    onPressed: () {
                                                      context.read<CounterFilterBloc>().add(CounterClearAllFilters());
                                                    },
                                                    selected: false,
                                                    borderColor: Color(0xFFE23D3D),
                                                    textStyle: TextStyle(
                                                      color: Color(0xFFE23D3D),
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16),
                                                  ),
                                                ),
                                                SizedBox(width: 16),
                                                Expanded(
                                                  child: buildElevatedButton(
                                                    label: 'Apply',
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.tune, color: Color(0xFF18181B), size: 20),
                          SizedBox(width: 6),
                          Text('Filters', style: TextStyle(color: Color(0xFF18181B), fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Color(0xFFBDBDBD)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(MyIcons.veg, width: 18, height: 18),
                          SizedBox(width: 6),
                          Text('Veg', style: TextStyle(color: Color(0xFF18181B), fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Color(0xFFBDBDBD)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/nonVeg.svg', width: 18, height: 18),
                          SizedBox(width: 6),
                          Text('Non Veg', style: TextStyle(color: Color(0xFF18181B), fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Color(0xFFBDBDBD)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(MyIcons.bestSeller, width: 18, height: 18),
                          SizedBox(width: 6),
                          Text('Best Seller', style: TextStyle(color: Color(0xFF18181B), fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Food Menu For You',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: CounterMenuListView(
                key: _menuListKey,
                onCartChanged: () => setState(() {}),
              ),
            ),
            const SizedBox(height: 16),
            // Bottom cart summary bar (appears when at least one item added)
            Builder(
              builder: (context) {
                int itemCount = 0;
                if (_menuListKey.currentState != null) {
                  itemCount = _menuListKey.currentState!.items
                      .fold(0, (sum, item) => sum + (item['quantity'] as int));
                }
                if (itemCount == 0) return const SizedBox(height: 0);
                return Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 420, minHeight: 130),
                    decoration: const BoxDecoration(
                      color: Color(0xFF18181B),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              itemCount == 1 ? '1 item added' : '$itemCount items added',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const CounterSaleCartScreen()),
                                );
                              },
                              child: Container(
                                width: 35,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: MyColors.whiteFFFFFF,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.08),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const CounterSaleCartScreen()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Add items worth \$10 more to get discount',
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildVegToggle(bool isVeg, AppLocalizations l10n) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: (isVeg ? isVegSelected : !isVegSelected)
                ? MyColors.primaryDark1D1929
                : Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              isVeg ? l10n.veg : l10n.nonVeg,
              style: TextStyle(
                fontSize: 14,
                color: (isVeg ? isVegSelected : !isVegSelected)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
