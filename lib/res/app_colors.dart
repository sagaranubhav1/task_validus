class AppColors {

  get appBackGroundColor => getColorHexFromStr("#171734");
  get cardColor => getColorHexFromStr("#1E1E3D");
  get greyColor => getColorHexFromStr("#FFC700");
  get darkGreyColor => getColorHexFromStr("#2F3444");
  get yellowColor => getColorHexFromStr("#FFC700");
  get editGrey => getColorHexFromStr("#A1A1A1");
  get grey => getColorHexFromStr("#A2A2AE");


  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw const FormatException(
            "An error occurred when converting a color");
      }
    }
    return val;
  }

  static final AppColors _appColors = AppColors._internal();

  factory AppColors() {
    return _appColors;
  }

  AppColors._internal();
}

AppColors appColors = AppColors();
