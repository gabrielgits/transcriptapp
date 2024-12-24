import 'package:easy_localization/easy_localization.dart';

String dateHelper({required String date, String format = 'MMM dd, yyyy'}) {
  var inputDate = DateTime.parse(date); // <-- dd/MM 24H format
  return DateFormat(format).format(inputDate);
}