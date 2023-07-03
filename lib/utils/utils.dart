import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landlord/data/network/api/api_provider.dart';
import 'package:landlord/utils/dio_utils.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'dialog/loading_dialog.dart';

class Utils {
  static initDio() {
    DioUtils.init(
        baseUrl: ApiProvider.baseUrl,
        style: GoogleFonts.manrope(),
        primary: AppColors.colorPrimary,
        authLink: '',
        language: '',
        dismissFunc: EasyLoading.dismiss,
        authClick: null,
        showLoadingFunc: LoadingDialog.showLoadingDialog);
  }
}
