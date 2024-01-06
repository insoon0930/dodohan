import 'package:intl/intl.dart';

abstract class TimeUtility {
  static DateTime next(DateTime dateTime, int day) {
    return dateTime.add(
      Duration(
        days: (day - dateTime.weekday) % DateTime.daysPerWeek,
      ),
    );
  }

  static DateTime todaySimple() {
    return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  }

  static String todayWithSlash({int subtractDay = 0}) {
    return DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: subtractDay)));
  }

  static String formatDuration(Duration duration) {
    int days = duration.inDays;
    int hours = duration.inHours % 24;
    int minutes = duration.inMinutes % 60;
    int seconds = duration.inSeconds % 60;

    return '$days일 ${_twoDigits(hours)}시 ${_twoDigits(minutes)}분 ${_twoDigits(seconds)}초';
  }
  static String _twoDigits(int n) => n.toString().padLeft(2, '0');

  static String formatDateSimple(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

  static int birthYear({required int age}) => DateTime.now().year - age + 1;

}
