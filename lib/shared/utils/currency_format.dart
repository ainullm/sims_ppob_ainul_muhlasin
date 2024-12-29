import 'package:intl/intl.dart';

class CurrencyFormatHelper {
  static convertIdr(price) {
    return NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(price);
  }

  static convertIdrString(String price) {
    return NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(int.parse(price));
  }
}
