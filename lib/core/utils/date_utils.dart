import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../extension/build_context_extension.dart';

String timeAgoFromString(String dateString, BuildContext context) {
  final date = DateTime.tryParse(dateString);

  if (date == null) return 'Invalid date';

  final now = DateTime.now();
  final diff = now.difference(date);

  if (diff.inSeconds < 60) {
    return context.l10n.justNow;
  } else if (diff.inMinutes < 60) {
    return context.l10n.minutesAgo(diff.inMinutes);
  } else if (diff.inHours < 24) {
    return context.l10n.hoursAgo(diff.inHours);
  } else if (diff.inDays < 7) {
    return context.l10n.daysAgo(diff.inDays);
  } else {
    return DateFormat('dd MMMM yyyy').format(date);
  }
}
