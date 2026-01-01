import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';

class PersistentBottomBarScaffold extends StatefulWidget {
  final List<PersistentTabItem> items;

  const PersistentBottomBarScaffold({super.key, required this.items});

  @override
  State<PersistentBottomBarScaffold> createState() =>
      _PersistentBottomBarScaffoldState();
}

class _PersistentBottomBarScaffoldState
    extends State<PersistentBottomBarScaffold> {
  int _selectedTab = 0;
  // bool _isNavBarVisible = true;
  // List<MyRouteObserver> _routeObservers = [];

  @override
  void initState() {
    super.initState();

    // Initialize a separate RouteObserver for each tab
    // _routeObservers = List.generate(widget.items.length, (index) {
    //   return MyRouteObserver(
    //     onPop: (route, previousRoute) {
    //       if (route != null) {
    //         if (_isNavBarVisible == false) {
    //           if (route.settings.name == '/supportChatScreen') {
    //             setState(() {
    //               _isNavBarVisible = true;
    //             });
    //           }
    //         }
    //       }
    //     },
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didpop) {
        /// Check if curent tab can be popped
        if (widget.items[_selectedTab].navigatorkey?.currentState?.canPop() ??
            false) {
          widget.items[_selectedTab].navigatorkey?.currentState?.pop();
        } else {
          // if current tab can't be popped then use the root navigator
          SystemNavigator.pop();
        }
      },
      child: Scaffold(

          /// Using indexedStack to maintain the order of the tabs and the state of the
          /// previously opened tab
          body: IndexedStack(
            index: _selectedTab,
            children: widget.items.asMap().entries.map((entry) {
              // int index = entry.key;
              var page = entry.value;

              return Navigator(
                //  observers: [_routeObservers[index]],

                /// Each tab is wrapped in a Navigator so that naigation in
                /// one tab can be independent of the other tabs
                key: page.navigatorkey,
                onGenerateInitialRoutes: (navigator, initialRoute) {
                  return [
                    MaterialPageRoute(
                      builder: (context) => page.tab,
                      settings: RouteSettings(arguments: page.arguments),
                    )
                  ];
                },
                onGenerateRoute: (settings) {
                  // _isNavBarVisible = settings.name != '/supportChatScreen';
                  // if (_isNavBarVisible == false) {
                  //   setState(() {});
                  // }

                  return MaterialPageRoute(
                      builder: (context) {
                        return Routes.getRoutes[settings.name]!(context);
                      },
                      settings: settings);
                },
              );
            }).toList(),
          ),

          /// Define the persistent bottom bar
          bottomNavigationBar: Container(
            height: 88.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: MyColors.whiteFFFFFF,
              border: Border(
                top: BorderSide(color: MyColors.grayD0D5DD, width: 1.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.items
                    .map(
                      (item) => Expanded(
                        child: GestureDetector(
                          onTap: () {
                            int index = widget.items.indexOf(item);

                            /// Check if the tab that the user is pressing is currently selected
                            if (index == _selectedTab) {
                              /// if you want to pop the current tab to its root then use
                              widget.items[index].navigatorkey?.currentState
                                  ?.popUntil((route) => route.isFirst);

                              /// if you want to pop the current tab to its last page
                              /// then use
                              // widget.items[index].navigatorkey?.currentState?.pop();
                            } else {
                              setState(() {
                                // if (index == 2) {
                                //   changeStatusBarColorToDark();
                                // } else {
                                //   changeStatusBarColorToLight();
                                // }
                                _selectedTab = index;
                              });
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: _selectedTab == widget.items.indexOf(item)
                                      ? MyColors.primaryDark1D1929.withOpacity(0.1)
                                      : MyColors.transparent,
                                ),
                                child: SvgPicture.asset(
                                  item.icon,
                                  width: 24.w,
                                  height: 24.h,
                                  colorFilter: ColorFilter.mode(
                                    _selectedTab == widget.items.indexOf(item)
                                        ? MyColors.primaryDark1D1929
                                        : MyColors.gray9F9F9F,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              TextView(
                                item.title,
                                style: myTextStyle.font_12w500.copyWith(
                                  color: _selectedTab == widget.items.indexOf(item)
                                      ? MyColors.primaryDark1D1929
                                      : MyColors.gray9F9F9F,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
              //  : null,
          ),
    );
  }
}

/// Model class that holds the tab info for the [PersistentBottomBarScaffold]
class PersistentTabItem {
  final Widget tab;
  final GlobalKey<NavigatorState>? navigatorkey;
  final String title;
  final String icon;
  final List<Widget>? routes;
  final Object? arguments;

  PersistentTabItem(
      {required this.tab,
      this.navigatorkey,
      required this.title,
      required this.icon,
      this.routes,
      this.arguments});
}

class MyRouteObserver extends NavigatorObserver {
  final Function(Route<dynamic>?, Route<dynamic>?)? onPop;

  MyRouteObserver({this.onPop});

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    // Call the onPop function when a route is popped
    if (onPop != null) {
      onPop!(route, previousRoute);
    }
  }
}
