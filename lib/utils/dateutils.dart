class DateUtil {
  static final DateTime initialDate = DateTime(1900);
  static final endDate = DateTime.now();

  static String formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
