import 'package:intl/intl.dart';

/// DateTime extension
extension DateTimeTimeExtension on DateTime {
  /// [other]と同じ年月日かを判定する
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

class DateUtil {
  /// 明日を取得(テストなどに使う)
  static DateTime checkIfTomorrow() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day + 1);
  }

  /// H:mmの文字にして返す
  static String hMMFormat(DateTime dateTime) {
    return DateFormat('H:mm').format(dateTime);
  }

  /// M月d日 (月)の文字にして返す
  /// [context] BuildContext, [dateTime] DateTime
  static String dateWithDayFormat(DateTime dateTime) {
    // 曜日
    final weekName = _weekNames()[dateTime.weekday];
    final date = DateFormat('M月d日').format(dateTime);
    // debugPrint('date -> $date');
    return date + ' ($weekName)';
  }

  // 曜日取得
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
