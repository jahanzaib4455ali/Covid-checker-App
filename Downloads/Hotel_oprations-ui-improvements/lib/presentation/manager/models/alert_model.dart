class AlertModel {
  final String id;
  final String time;
  final String recipient;
  final String department;
  final String priority;
  final String? notificationTitle;
  final DateTime createdAt;
  final bool isRead;

  AlertModel({
    required this.id,
    required this.time,
    required this.recipient,
    required this.department,
    required this.priority,
    this.notificationTitle,
    required this.createdAt,
    this.isRead = false,
  });

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      id: json['id'] as String,
      time: json['time'] as String,
      recipient: json['recipient'] as String,
      department: json['department'] as String,
      priority: json['priority'] as String,
      notificationTitle: json['notification_title'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      isRead: json['is_read'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time,
      'recipient': recipient,
      'department': department,
      'priority': priority,
      'notification_title': notificationTitle,
      'created_at': createdAt.toIso8601String(),
      'is_read': isRead,
    };
  }

  AlertModel copyWith({
    String? id,
    String? time,
    String? recipient,
    String? department,
    String? priority,
    String? notificationTitle,
    DateTime? createdAt,
    bool? isRead,
  }) {
    return AlertModel(
      id: id ?? this.id,
      time: time ?? this.time,
      recipient: recipient ?? this.recipient,
      department: department ?? this.department,
      priority: priority ?? this.priority,
      notificationTitle: notificationTitle ?? this.notificationTitle,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AlertModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'AlertModel(id: $id, recipient: $recipient, department: $department, priority: $priority)';
  }
}