import 'package:intl/intl.dart';

abstract class FormatNumber {
  static String money(num number) {
    NumberFormat formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    );

    return formatter.format(number ?? 0);
  }
}
