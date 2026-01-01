import 'package:kunggy_operational_app/common/widget/snack_bar/my_snackbar.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

class ErrorMessages {
  static Future<void> display(String message) async {
    await MySnackbar.showSnackbar(
      message,
      bgColor: MyColors.red,
      msgColor: MyColors.whiteFFFFFF,
    );
  }
}
