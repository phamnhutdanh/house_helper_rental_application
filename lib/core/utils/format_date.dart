import 'package:intl/intl.dart';

String formatDateByDDMMYYYY(DateTime dateTime) {
  return DateFormat("dd/MM/yyyy").format(dateTime);
}

DateTime? convertDateFromMillisecondsString(String? milliseconds) {
  if (milliseconds != null) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(milliseconds));
    return dateTime;
  }
  return null;
}
