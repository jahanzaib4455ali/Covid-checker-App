import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_loader_elevated_button.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';


import '../../../../l10n/app_localizations.dart';

class RoomServiceMinibarScreen extends StatefulWidget {
  const RoomServiceMinibarScreen({super.key});

  @override
  State<RoomServiceMinibarScreen> createState() =>
      _RoomServiceMinibarScreenState();
}

class _RoomServiceMinibarScreenState extends State<RoomServiceMinibarScreen> {
  String selectedRoom = "1";
  String person = "Rahul Kumar";
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: false,
      isProfile: false,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(MyIcons.rightArrow2),
                        ),
                        SizedBox(
                          width: 11.w,
                        ),
                        TextView(
                          AppLocalizations.of(context)?.miniBarRefill ?? "Mini Bar Refill",
                          style: myTextStyle.font_20wMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 21.h,
                        ),
                      ],
                    ),


                  ],
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              Row(
                children: [
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 34.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: MyColors.grayE5E5E5,
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(MyIcons.calendar),
                        SizedBox(
                          width: 6.w,
                        ),
                        TextView(
                          "22-02-2023",
                          style: myTextStyle.font_14w400
                              .copyWith(color: MyColors.dark18181B),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        SvgPicture.asset(MyIcons.arrowDrop),
                      ],
                    ),
                  ),
                ],
              ),
              TextView(
                padding: EdgeInsets.only(left: 25.w),
                AppLocalizations.of(context)?.selectRoomNo ?? "Select Room No",
                style: myTextStyle.font_16ww500,
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 26.w, right: 22.w),
                child: DropdownButtonFormField(
                  value: selectedRoom,
                  items: ["1", "2", "3"].map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: myTextStyle.font_16ww500.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                          ),
                    );
                  }).toList(),
                  onChanged: (p0) {
                    selectedRoom = p0 ?? "1";
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MyColors.grayF6F6F6,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: MyColors.grayD0D5DD,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: MyColors.grayD0D5DD,
                      ),
                    ),
                  ),
                  dropdownColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextView(
                padding: EdgeInsets.only(left: 25.w),
                AppLocalizations.of(context)?.reportedBy ?? "Reported By",
                style: myTextStyle.font_16ww500,
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 26.w, right: 22.w),
                child: DropdownButtonFormField(
                  value: person,
                  items: [
                    "Rahul Kumar",
                  ].map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: myTextStyle.font_16ww500.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (p0) {
                    person = p0 ?? "1";
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MyColors.grayF6F6F6,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: MyColors.grayD0D5DD,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: MyColors.grayD0D5DD,
                      ),
                    ),
                  ),
                  dropdownColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              TextView(
                padding: EdgeInsets.only(left: 25.w),
                "RedBull 250ml (4 Pcs)",
                style: myTextStyle.font_16ww500.copyWith(
                  fontSize: 18.h,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextView(
                padding: EdgeInsets.only(left: 25.w),
                AppLocalizations.of(context)?.howManyAdded ?? "How Many Added?",
                style: myTextStyle.font_16ww400,
              ),
              SizedBox(
                height: 14.h,
              ),
              const MiniBarQuantityButtonRow(),
              SizedBox(
                height: 29.h,
              ),
              TextView(
                padding: EdgeInsets.only(left: 25.w),
                 "Chocolates (4 Pcs)",
                style: myTextStyle.font_16ww500.copyWith(
                  fontSize: 18.h,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextView(
                padding: EdgeInsets.only(left: 25.w),
                AppLocalizations.of(context)?.howManyAdded ?? "How Many Added?",
                style: myTextStyle.font_16ww400,
              ),
              SizedBox(
                height: 14.h,
              ),
              const MiniBarQuantityButtonRow(),
              SizedBox(
                height: 29.h,
              ),
              TextView(
                padding: EdgeInsets.only(left: 25.w),
                "Juice 250ml (4 Pcs)",
                style: myTextStyle.font_16ww500.copyWith(
                  fontSize: 18.h,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextView(
                padding: EdgeInsets.only(left: 25.w),
                AppLocalizations.of(context)?.howManyAdded ?? "How Many Added?",
                style: myTextStyle.font_16ww400,
              ),
              SizedBox(
                height: 14.h,
              ),
              const MiniBarQuantityButtonRow(),
              SizedBox(
                height: 29.h,
              ),
              MyLoaderElvButton(
                borderRadius: 10,
                padding: EdgeInsets.only(left: 26.w, right: 22.w),
                height: 55,
                onPressed: () {
                  Navigator.pop(context);
                },
                text: AppLocalizations.of(context)?.submit ?? "Submit",
                textStyle: myTextStyle.font_30w700.copyWith(
                  fontSize: 18.h,
                  color: MyColors.whiteFFFFFF,
                ),
                state: null,
              ),
              SizedBox(
                height: 14.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiniBarQuantityButtonRow extends StatefulWidget {
  const MiniBarQuantityButtonRow({
    super.key,
    this.isChangeAmenties,
  });

  final bool? isChangeAmenties;
  @override
  State<MiniBarQuantityButtonRow> createState() =>
      _MiniBarQuantityButtonRowState();
}

class _MiniBarQuantityButtonRowState extends State<MiniBarQuantityButtonRow> {
  String selectedValue = "0";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.isChangeAmenties ?? false ? 0 : 28.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: ["0", "1", "2", "3"].map((i) {
          return Padding(
            padding: EdgeInsets.only(
                left: widget.isChangeAmenties ?? false ? 5.w : 0),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedValue = i;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.isChangeAmenties ?? false ? 13.w : 35.w,
                ),
                alignment: Alignment.center,
                height: widget.isChangeAmenties ?? false ? 40.h : 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: selectedValue == i
                      ? MyColors.primaryDark1D1929
                      : MyColors.whiteFFFFFF,
                  border: Border.all(
                    color: MyColors.grayD0D5DD,
                  ),
                ),
                child: TextView(
                  i,
                  style: myTextStyle.font_20wMedium.copyWith(
                    fontWeight: FontWeight.w400,
                    color: selectedValue == i
                        ? MyColors.whiteFFFFFF
                        : MyColors.dark000000,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
