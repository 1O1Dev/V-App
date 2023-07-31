import 'package:intl/intl.dart';

String formateDate(String date) {
  DateTime dateTime = DateTime.parse(date);
  DateTime now = DateTime.now();
  Duration duration = now.difference(dateTime);

  if (duration.inDays >= 7) {
    // Format the date to "Month day, year" (e.g., "July 12, 2023")
    String formattedDate = DateFormat('MMMM d, y').format(dateTime);
    return formattedDate;
  } else if (duration.inDays > 0) {
    return "${duration.inDays} days ago";
  } else if (duration.inHours > 0) {
    return "${duration.inHours} hours ago";
  } else if (duration.inMinutes > 0) {
    return "${duration.inMinutes} mins ago";
  } else {
    return "${duration.inSeconds} secs ago";
  }
}
