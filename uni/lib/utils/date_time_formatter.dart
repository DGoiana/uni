import 'package:intl/intl.dart';
import 'package:uni/model/entities/app_locale.dart';

extension DateTimeExtensions on DateTime {
  String weekDay(AppLocale locale) {
    return DateFormat.EEEE(locale.localeCode.languageCode)
        .dateSymbols
        .WEEKDAYS[weekday % 7];
  }

  String month(AppLocale locale) {
    return DateFormat.EEEE(locale.localeCode.languageCode)
        .dateSymbols
        .MONTHS[this.month - 1];
  }

  String formattedDate(AppLocale locale) {
    if (locale == AppLocale.pt) {
      return '${weekDay(locale)}, $day de ${month(locale)}';
    } else {
      return '${weekDay(locale)}, $day ${month(locale)}';
    }
  }
}
