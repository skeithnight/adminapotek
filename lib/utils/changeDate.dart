import 'package:intl/intl.dart';
// import "package:intl/intl_browser.dart";

String convertMilistoDate(int milis) {
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(milis);
  var format = new DateFormat("dd-MM-yyyy");
  var dateString = format.format(date);
  return dateString;
}

String changeDate(DateTime date) {
  var formatter = new DateFormat('dd-MM-yyyy');
  String formatted = formatter.format(date);
  return formatted;
}
