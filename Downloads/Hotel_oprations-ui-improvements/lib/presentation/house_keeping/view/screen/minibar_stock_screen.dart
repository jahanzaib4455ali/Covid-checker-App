import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/src_general_scaffold.dart';

import '../../../../common/widget/text_view.dart';
import '../../../../theme/my_colors.dart';
import '../../../../theme/my_text_styles.dart';

class MinibarStockScreen extends StatelessWidget {
  const MinibarStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SrcGeneralScaffold(
      isBackButton: false,
      showAppBar: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
              child: TextView(
                'Minibar Stock',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: MyColors.dark000000,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: MyColors.grayF4F4F6,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: MyColors.gray667085, size: 20.sp),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(color: MyColors.gray667085, fontSize: 16.sp, fontWeight: FontWeight.w400),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    height: 44.h,
                    width: 44.h,
                    decoration: BoxDecoration(
                      color: MyColors.whiteFFFFFF,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: MyColors.grayD0D5DD.withOpacity(0.5)),
                    ),
                    child: Icon(Icons.tune, color: MyColors.dark000000, size: 20.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextView(
                'Minibar Refill Essentials List',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.dark000000,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: _buildTable(),
            ),
          ],
      ),
    );
  }

  Widget _buildTable() {
    final List<Map<String, dynamic>> items = [
      {'name': 'Red Bull\n250 ml', 'assigned': 5, 'refilled': 1, 'available': 2},
      {'name': 'Diet Coke\n250 ml', 'assigned': 8, 'refilled': 5, 'available': 3},
      {'name': 'Kitkat\n250 ml', 'assigned': 4, 'refilled': 2, 'available': 4},
      {'name': 'Ferrero Rocher\n250 g', 'assigned': 3, 'refilled': 1, 'available': 2},
      {'name': 'Lays\n50 g', 'assigned': 5, 'refilled': 4, 'available': 1},
      {'name': 'Coke\n250 ml', 'assigned': 5, 'refilled': 0, 'available': 5},
    ];

    return Column(
      children: [
        // Header
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: MyColors.grayD0D5DD.withOpacity(0.3))),
          ),
          child: Row(
            children: [
              Expanded(flex: 3, child: _headerText('Minibar List', align: TextAlign.start)),
              Expanded(flex: 2, child: _headerText('Assigned Units')),
              Expanded(flex: 2, child: _headerText('Refilled Units')),
              Expanded(flex: 2, child: _headerText('Available')),
            ],
          ),
        ),
        // Rows
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: MyColors.grayD0D5DD.withOpacity(0.2))),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextView(
                        item['name'],
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: MyColors.dark000000,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextView(
                        '${item['assigned']}',
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextView(
                        '${item['refilled']}',
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextView(
                        '${item['available']}',
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _headerText(String text, {TextAlign align = TextAlign.center}) {
    return TextView(
      text,
      textAlign: align,
      style: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: MyColors.gray667085,
      ),
    );
  }
}
