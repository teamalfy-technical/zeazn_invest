import 'package:intl/intl.dart';

class ZFormatter {
  ZFormatter._();

  /// --- format date & time
  static String formatDateTime(DateTime dateTime) {
    final date = DateFormat('dd-MM-yyyy').format(dateTime); // e.g. 12-05-2025
    final time =
        DateFormat('hha').format(dateTime).toLowerCase(); // e.g. 07PM -> 7pm
    return '$date ${time.replaceAll(':00', '')}'; // clean up to match your format
  }

  /// --- format date
  static String formatDate({required DateFormat dateFormat, DateTime? date}) {
    date ??= DateTime.now();
    return dateFormat.format(date);
  }

  static String formatPhone({required String code, required String phone}) {
    var formatted = phone.startsWith('0') ? phone.substring(1) : phone;
    return '$code$formatted';
  }

  /// --- format time to 12 hour
  static String formatTime12Hour(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  /// --- format time to 24 hour
  static String formatTime24Hour(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  /// --- format time
  static String formatTime({DateTime? date, DateFormat? dateFormat}) {
    date ??= DateTime.now();
    final dtFormat = dateFormat ?? DateFormat.jmv();
    return dtFormat.format(date);
  }

  /// --- format currency
  static String formatCurrency({required double amount}) {
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: 0,
    ).format(amount);
  }

  static String formatMoneyValue(String rawValue) {
    final value = int.tryParse(rawValue) ?? 0;

    final formatter = NumberFormat(
      '#,###',
      'en_GH',
    ); // 'en_GH' for Ghana locale

    // return '₵${formatter.format(value)}';

    if (value >= 1000000000) {
      // Format as Billion (₵1.0B)
      return '₵${formatter.format(value / 1000000000)}B';
    } else if (value >= 1000000) {
      // Format as Million (₵700M)
      return '₵${formatter.format(value / 1000000)}M';
    } else if (value >= 1000) {
      // Format as Thousand (₵700K)
      return '₵${formatter.format(value / 1000)}K';
    } else {
      // For values less than 1000, just add the Cedi symbol
      return '₵${formatter.format(value)}';
    }
  }

  static String convertToAgo(DateTime input) {
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays > 1) {
      return '${diff.inDays} days ago';
    } else if (diff.inDays == 1) {
      return '${diff.inDays} day ago';
    } else if (diff.inHours > 1) {
      return '${diff.inHours} hours ago';
    } else if (diff.inHours == 1) {
      return '${diff.inHours} hour ago';
    } else if (diff.inMinutes > 1) {
      return '${diff.inMinutes} minutes ago';
    } else if (diff.inMinutes == 1) {
      return '${diff.inMinutes} minute ago';
    } else if (diff.inSeconds > 1) {
      return '${diff.inSeconds} seconds ago';
    } else if (diff.inSeconds == 1) {
      return '${diff.inSeconds} second ago';
    } else {
      return 'just now';
    }
  }
}
