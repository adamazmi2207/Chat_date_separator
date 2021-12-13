import 'package:intl/intl.dart';

/// DateTime extension
extension DateTimeTimeExtension on DateTime {
  /// return true if input date is same
  bool isSameDate(DateTime inputDate) {
    return year == inputDate.year &&
        month == inputDate.month &&
        day == inputDate.day;
  }
}

/// Date Utility class
class DateUtil {
  /// get tomorrow's date
  static DateTime tomorrow() {
    // current date
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day + 1);
  }

  /// convert to [H:mm] format
  static String hMMFormat(DateTime dateTime) {
    return DateFormat('H:mm').format(dateTime);
  }

  /// convert to [M/d (day)] format
  static String dateWithDayFormat(DateTime dateTime) {
    // get name of days of the week
    final weekName = _weekNames()[dateTime.weekday];

    // get date string value
    final date = DateFormat('M/d').format(dateTime);

    return date + ' ($weekName)';
  }

  // List of days of week
  static List<String> _weekNames() {
    return <String>[
      '',
      'Mon',
      'Tue',
      'Wed',
      'Thur',
      'Fri',
      'Sat',
      'Sun',
    ];
  }
}
