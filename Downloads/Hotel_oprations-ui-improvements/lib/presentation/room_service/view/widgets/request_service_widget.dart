import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/presentation/room_service/view/widgets/request_tab.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

import '../../../../l10n/app_localizations.dart';


class ServiceRequestWidget extends StatefulWidget {
  const ServiceRequestWidget({
    super.key,
  });

  @override
  State<ServiceRequestWidget> createState() => _ServiceRequestWidgetState();
}

class _ServiceRequestWidgetState extends State<ServiceRequestWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: TabBar(
              controller: tabController,
              tabAlignment: TabAlignment.fill,
              dividerColor: MyColors.greenCDEADE,
              dividerHeight: 2,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: MyColors.primaryDark1D1929,
              unselectedLabelColor: MyColors.dark242424,
              labelColor: MyColors.primaryDark1D1929,
              labelStyle: myTextStyle.font_14w500.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16.h,
              ),
              unselectedLabelStyle: myTextStyle.font_16ww400,
              tabs:  [
                Tab(text: AppLocalizations.of(context)?.roomServiceRequests ?? "Room Service Requests"),
                Tab(text: AppLocalizations.of(context)?.orderDelivery ??"Order Delivery"),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                RequestTab(
                  isOrderDelivery: false,
                ),
                RequestTab(
                  isOrderDelivery: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
