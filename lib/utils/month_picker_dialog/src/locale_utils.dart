import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

String getLocale(
  BuildContext context, {
  Locale? selectedLocale,
}) {
  if (selectedLocale != null) {
    return '${selectedLocale.languageCode}_${selectedLocale.countryCode}';
  }
  var locale = Localizations.localeOf(context);
  Intl.systemLocale;
 /* if (locale == null) {
    return Intl.systemLocale;
  }*/
  return '${locale.languageCode}_${locale.countryCode}';
}
