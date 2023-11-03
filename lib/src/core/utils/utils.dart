import 'package:intl/intl.dart';

class Utils {
  static const Duration animationDuration = Duration(milliseconds: 200);
  static const Duration delayDuration = Duration(milliseconds: 500);

  static DateTime? parseDate(dynamic value, {String format = 'yyyy.MM.dd'}) {
    if (value == null || value == 'null' || value == '') {
      return null;
    }
    try {
      return DateFormat(format).parse(value.toString());
    } catch (e) {
      return null;
    }
  }

  static String formatDate(DateTime date, {String format = 'yyyy.MM.dd'}) {
    return DateFormat(format).format(date);
  }

  static String? numbersOnly(String? value) {
    if (value == null) return null;
    String temp = value.replaceAll(RegExp(r'[^0-9]'), '');
    return temp;
  }

  static String? formatPhone(String? phone) {
    if ((phone?.length ?? 0) < 11) {
      return phone;
    }
    phone = Utils.numbersOnly(phone);
    return '+${phone!.substring(0, 1)} '
        '(${phone.substring(1, 4)}) '
        '${phone.substring(4, 7)}-'
        '${phone.substring(7, 9)}-'
        '${phone.substring(9)}';
  }
}
