enum HKTaskStatus { newTask, myTask, done }

class HKTaskModel {
  final String time;
  final String title;
  final String subtitle;
  final String guestName;
  final String roomNo;
  final String requestId;
  final String roomStatus;
  final bool urgent;
  HKTaskStatus status;

  HKTaskModel({
    required this.time,
    required this.title,
    required this.subtitle,
    required this.guestName,
    required this.roomNo,
    required this.requestId,
    required this.roomStatus,
    required this.urgent,
    required this.status,
  });
}
