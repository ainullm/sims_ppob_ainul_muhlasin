import 'package:intl/intl.dart';

class DateFormatHelper {
  static convertDate(DateTime date) {
    var formatter = DateFormat('dd MMMM yyyy');
    String formatted = formatter.format(date);
    return formatted;
  }

  static convertTime(DateTime date) {
    var formatter = DateFormat('HH:mm');
    String formatted = formatter.format(date);
    return formatted;
  }

  static convertDateTime(DateTime date) {
    var formatter = DateFormat('dd MMMM yyyy HH:mm');
    String formatted = formatter.format(date);
    return formatted;
  }
}
