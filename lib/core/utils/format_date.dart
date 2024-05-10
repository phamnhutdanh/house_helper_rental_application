import 'package:intl/intl.dart';

String formatDateByDDMMYYYY(DateTime dateTime) {
  return DateFormat("dd/MM/yyyy").format(dateTime);
}

DateTime convertDateFromMillisecondsString(String milliseconds) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(milliseconds));
  return dateTime;
}
