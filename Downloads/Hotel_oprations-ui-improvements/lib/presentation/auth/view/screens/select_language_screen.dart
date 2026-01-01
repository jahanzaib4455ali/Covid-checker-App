import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/common_blur_modal.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_elevated_button.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/service/locale_cubit/localCubit.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_constants/app_constants.dart';
import 'package:kunggy_operational_app/presentation/auth/view/screens/role_selection_screen.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  String selectedLanguage = "English";
  String selectedLanguageCode = "en";
  String searchQuery = '';

  // Language details with country codes and subtitles
  final Map<String, Map<String, String>> languageDetails = {
    "en": {"code": "US", "name": "English", "sub": "English"},
    "es": {"code": "ES", "name": "Española", "sub": "Spain"},
    "fr": {"code": "FR", "name": "Français", "sub": "French"},
    "de": {"code": "DE", "name": "Deutsch", "sub": "German"},
    "it": {"code": "IT", "name": "Italiano", "sub": "Italian"},
    "pt": {"code": "PT", "name": "Português", "sub": "Portuguese"},
    "ar": {"code": "AR", "name": "العربية", "sub": "Arabic"},
    "hi": {"code": "IN", "name": "हिंदी", "sub": "Hindi"},
    "ur": {"code": "PK", "name": "اردو", "sub": "Urdu"},
    "id": {"code": "ID", "name": "Indonesia", "sub": "Indonesian"},
    "zh": {"code": "CN", "name": "中文", "sub": "Chinese"},
    "ru": {"code": "RU", "name": "Русский", "sub": "Russian"},
    "ta": {"code": "IN", "name": "தமிழ்", "sub": "Tamil"},
    "th": {"code": "TH", "name": "ไทย", "sub": "Thai"},
    "vi": {"code": "VN", "name": "Tiếng Việt", "sub": "Vietnamese"},
  };

  @override
  Widget build(BuildContext context) {
    final filteredEntries = languageDetails.entries.where((entry) {
      final name = entry.value["name"]!;
      final sub = entry.value["sub"]!;
      return name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          sub.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: MyColors.whiteFFFFFF,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 32.h),
            
            // Globe icon
            Center(
              child: Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  color: MyColors.primaryDark1D1929,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.language,
                    size: 40.w,
                    color: MyColors.whiteFFFFFF,
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 24.h),
            
            // Title
            TextView(
              'Select Language',
              style: myTextStyle.font_30w700.copyWith(
                fontSize: 28.h,
                color: MyColors.primaryDark1D1929,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 16.h),
            
            // Search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.grayF7F7F8,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: TextField(
                  onChanged: (value) => setState(() => searchQuery = value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search, 
                      color: MyColors.grayBDBDBD,
                      size: 20.w,
                    ),
                    hintText: 'Search',
                    hintStyle: myTextStyle.font_14w400.copyWith(
                      color: MyColors.grayBDBDBD,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.h, 
                      horizontal: 16.w,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 24.h),
            
            // All Languages section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextView(
                  'All Languages',
                  style: myTextStyle.font_14w500.copyWith(
                    color: MyColors.gray7B7B7B,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 12.h),
            
            // Language list
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: filteredEntries.length,
                itemBuilder: (context, index) {
                  final entry = filteredEntries[index];
                  final code = entry.key;
                  final details = entry.value;
                  final countryCode = details["code"]!;
                  final language = details["name"]!;
                  final sub = details["sub"]!;
                  final isSelected = language == selectedLanguage;

                  return InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    onTap: () => _showLanguageConfirmationModal(
                      context, 
                      language, 
                      code,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h, 
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected 
                            ? MyColors.cyanF2FDFC 
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected 
                              ? MyColors.primaryGreen00A35E 
                              : MyColors.grayE5E5E5,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          // Country code
                          Container(
                            width: 40.w,
                            child: TextView(
                              countryCode,
                              style: myTextStyle.font_16ww500.copyWith(
                                color: isSelected 
                                    ? MyColors.primaryGreen00A35E 
                                    : MyColors.primaryDark1D1929,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.h,
                              ),
                            ),
                          ),
                          
                          SizedBox(width: 16.w),
                          
                          // Language and subtext
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  language,
                                  style: myTextStyle.font_16ww500.copyWith(
                                    color: isSelected 
                                        ? MyColors.primaryGreen00A35E 
                                        : MyColors.primaryDark1D1929,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.h,
                                  ),
                                ),
                                TextView(
                                  sub,
                                  style: myTextStyle.font_12w400.copyWith(
                                    color: MyColors.gray7B7B7B,
                                    fontSize: 12.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Checkmark
                          if (isSelected)
                            Icon(
                              Icons.check_circle,
                              color: MyColors.primaryGreen00A35E,
                              size: 24.w,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Continue button
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
              child: MyElevatedButton(
                text: 'Continue',
                onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoleSelectionScreen(),
                      ),
                    );
                },
                height: 56,
                buttonBGColor: MyColors.primaryDark1D1929,
                textStyle: myTextStyle.font_20wMedium.copyWith(
                  color: MyColors.whiteFFFFFF,
                  fontSize: 18.h,
                  fontWeight: FontWeight.w600,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageConfirmationModal(
    BuildContext context, 
    String language, 
    String code,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return CommonBlurModal(
          topOffset: -30,
          child: Container(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16.h),
                
                // Title
                TextView(
                  "Language Confirmation",
                  style: myTextStyle.font_20wMedium.copyWith(
                    fontSize: 22.h,
                    fontWeight: FontWeight.w700,
                    color: MyColors.primaryDark1D1929,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 12.h),
                
                // Subtitle
                TextView(
                  "Please review and confirm your selected language",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 14.h,
                    color: MyColors.gray6E7C87,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 24.h),
                
                // Selected language container
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w, 
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.grayF7F7F8,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: MyColors.grayE5E5E5,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        "Selected Language",
                        style: myTextStyle.font_14w400.copyWith(
                          fontSize: 14.h,
                          color: MyColors.gray525252,
                        ),
                      ),
                      TextView(
                        language,
                        style: myTextStyle.font_14w500.copyWith(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w600,
                          color: MyColors.primaryDark1D1929,
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 32.h),
                
                // Confirm button
                MyElevatedButton(
                  onPressed: () {
                    // Apply language selection
                    final localeCubit = BlocProvider.of<LocaleCubit>(context);
                    if (mounted) {
                      setState(() {
                        selectedLanguage = language;
                        selectedLanguageCode = code;
                        AppConstants.selectedLanguage = code;
                      });
                      localeCubit.setLocale(Locale(code));
                    }
                    Navigator.pop(context); // Close modal
                  },
                  text: "Confirm",
                  width: double.infinity,
                  height: 48,
                  buttonBGColor: MyColors.primaryDark1D1929,
                  textStyle: myTextStyle.font_16ww500.copyWith(
                    fontSize: 16.h,
                    color: MyColors.whiteFFFFFF,
                    fontWeight: FontWeight.w600,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                
                SizedBox(height: 16.h),
              ],
            ),
          ),
        );
      },
    );
  }
}