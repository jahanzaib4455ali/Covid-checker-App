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

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = "English";
  String searchQuery = '';

  Map<String, Map<String, String>> get languageDetails => {
    "en": {"code": "US", "name": "English", "sub": "English"},
    "es": {"code": "ES", "name": "Española", "sub": "Spain"},
    "fr": {"code": "FR", "name": "Français", "sub": "French"},
    "de": {"code": "DE", "name": "Deutsch", "sub": "German"},
    "it": {"code": "IT", "name": "Italiano", "sub": "Italian"},
    "hi": {"code": "HI", "name": "Hindi", "sub": "Indian"},
    "ur": {"code": "PK", "name": "Urdu", "sub": "Pakistan"},
  };

  @override
  Widget build(BuildContext context) {
    final filteredEntries = languageMap.entries.where((entry) {
      final details = languageDetails[entry.key];
      final name = details != null ? details["name"]! : entry.value;
      return name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 32.h),
            _buildGlobeHeader(),
            SizedBox(height: 24.h),
            _buildTitle(),
            SizedBox(height: 16.h),
            _buildSearchBar(),
            SizedBox(height: 24.h),
            _buildSectionHeader(),
            SizedBox(height: 12.h),
            _buildLanguageList(filteredEntries),
            _buildContinueButton(),
          ],
        ),
      ),
    );
  }

  // --- UI Components ---

  Widget _buildGlobeHeader() {
    return Center(
      child: Container(
        width: 80.w,
        height: 80.w,
        decoration: const BoxDecoration(color: Color(0xFF18181B), shape: BoxShape.circle),
        child: Center(
          child: SvgPicture.asset(MyIcons.manager, width: 40.w, height: 40.w, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Select Language',
      style: myTextStyle.font_16ww500.copyWith(
        fontSize: 28.h,
        color: MyColors.dark07090D,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextField(
        onChanged: (value) => setState(() => searchQuery = value),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Color(0xFFBDBDBD)),
          hintText: 'Search',
          filled: true,
          fillColor: const Color(0xFFF6F6F6),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'All Languages',
          style: myTextStyle.font_14w400.copyWith(color: const Color(0xFF7B7B7B), fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildLanguageList(List<MapEntry<String, String>> filteredEntries) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: filteredEntries.length,
        itemBuilder: (context, index) {
          final entry = filteredEntries[index];
          final details = languageDetails[entry.key];
          final countryCode = details != null ? details["code"]! : entry.key.toUpperCase();
          final language = details != null ? details["name"]! : entry.value;
          final sub = details != null ? details["sub"]! : entry.value;
          final isSelected = language == selectedLanguage;

          return InkWell(
            onTap: () => _showLanguageConfirmationModal(context, language, entry.key),
            child: Container(
              margin: EdgeInsets.only(bottom: 8.h),
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFF1FAF5) : Colors.transparent,
                border: Border.all(color: isSelected ? MyColors.primaryGreen00A35E : const Color(0xFFE0E0E0), width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(countryCode, style: myTextStyle.font_14w400.copyWith(fontWeight: FontWeight.bold, fontSize: 18.h)),
                  SizedBox(width: 18.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(language, style: myTextStyle.font_14w400.copyWith(fontWeight: FontWeight.w600, fontSize: 18.h)),
                        Text(sub, style: myTextStyle.font_12w500.copyWith(color: const Color(0xFF7B7B7B), fontSize: 14.h)),
                      ],
                    ),
                  ),
                  if (isSelected) Icon(Icons.check, color: MyColors.primaryGreen00A35E, size: 28.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
      child: MyElevatedButton(
        text: 'Continue',
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
          );
        },
        height: 70,
        buttonBGColor: MyColors.primaryDark1D1929,
        textStyle: myTextStyle.font_20wMedium.copyWith(
          fontSize: 20.h,
          color: MyColors.whiteFFFFFF,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
    );
  }

  // --- Modal Logic ---

  void _showLanguageConfirmationModal(BuildContext context, String language, String code) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.none,
      builder: (BuildContext context) {
        return CommonBlurModal(
          topOffset: -65.h,
          onClose: () => Navigator.pop(context),
          child: Container(
            height: 0.5.sh, // Screen ke mid tak height
            padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 40.h), // Top padding barhai hai
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // Title: Isko bara aur bold kiya hai
                    TextView(
                      "Language Confirmation",
                      style: myTextStyle.font_20wMedium.copyWith(
                        fontSize: 26.h, // Size 22 se 26 kar diya
                        fontWeight: FontWeight.w800, // Zyada Bold
                        color: MyColors.primaryDark1D1929,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Subtitle: Iska size bhi barha diya
                    TextView(
                      "Please review and confirm your selected language",
                      style: myTextStyle.font_14w400.copyWith(
                        fontSize: 16.h, // Size 14 se 16 kar diya
                        color: MyColors.gray6E7C87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 35.h),

                    // Selected Language Box
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h), // Padding barhai
                      decoration: BoxDecoration(
                        color: MyColors.grayF7F7F8,
                        borderRadius: BorderRadius.circular(16.r), // Border radius barhai
                        border: Border.all(color: MyColors.grayE5E5E5, width: 1.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            "Selected Language",
                            style: myTextStyle.font_14w400.copyWith(
                              fontSize: 16.h, // Bara text
                              color: MyColors.gray525252,
                            ),
                          ),
                          TextView(
                            language,
                            style: myTextStyle.font_14w500.copyWith(
                              fontSize: 18.h, // Bara text
                              fontWeight: FontWeight.bold,
                              color: MyColors.primaryDark1D1929,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Confirm Button: Height aur Font size dono barha diye
                MyElevatedButton(
                  text: "Confirm Selection", // Text ko thoda bara kiya
                  onPressed: () {
                    final localeCubit = BlocProvider.of<LocaleCubit>(context);
                    setState(() {
                      selectedLanguage = language;
                      AppConstants.selectedLanguage = code;
                    });
                    localeCubit.setLocale(Locale(code));
                    Navigator.pop(context);
                  },
                  width: double.infinity,
                  height: 70.h, // Height 54 se 62 kar di (Bara button)
                  buttonBGColor: MyColors.primaryDark1D1929,
                  textStyle: myTextStyle.font_16ww500.copyWith(
                    fontSize: 20.h, // Font size 16 se 20 kar diya
                    color: MyColors.whiteFFFFFF,
                    fontWeight: FontWeight.w700, // Extra Bold
                  ),
                  borderRadius: BorderRadius.circular(16.r), // Zyada rounded premium look
                ),
              ],
            ),
          ),
        );
      },
    );
  }}
final Map<String, String> languageMap = {
  "en": "English",
  "es": "Spanish",
  "de": "German",
  "fr": "French",
  "it": "Italian",
  "hi": "Hindi",
  "ur": "Urdu",
};