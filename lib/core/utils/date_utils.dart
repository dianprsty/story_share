import 'package:intl/intl.dart';

String timeAgoFromString(String dateString) {
  final date = DateTime.tryParse(dateString);

  if (date == null) return 'Invalid date';

  final now = DateTime.now();
  final diff = now.difference(date);

  if (diff.inSeconds < 60) {
    return 'Just now';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes} minute${diff.inMinutes > 1 ? 's' : ''} ago';
  } else if (diff.inHours < 24) {
    return '${diff.inHours} hour${diff.inHours > 1 ? 's' : ''} ago';
  } else if (diff.inDays < 7) {
    return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';
  } else {
    return DateFormat('dd MMMM yyyy').format(date);
  }
}