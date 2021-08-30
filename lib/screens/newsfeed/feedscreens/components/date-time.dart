import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatTimestamp(Timestamp timestamp) {
  var format = new DateFormat('dd-mm-yyyy, HH:mm a'); // 'hh:mm' for hour & min
  return format.format(timestamp.toDate().toLocal());
}
