enum NotificationType {
  loginRequest,
  maintenanceApproval,
  maintenanceApprovalMulti,
  leaveRequest,
  maintenanceRepair,
  lowInventory,
  guestCheckIn,
  guestCheckOut,
  taskAssignment,
}

class NotificationModel {
  final String id;
  final String time;
  final String title;
  final String message;
  final NotificationType notificationType;
  final bool hasViewButton;
  final bool hasMoreMenu;
  final bool isRead;
  final bool isNew;
  final DateTime createdAt;
  final Map<String, dynamic>? additionalData;

  NotificationModel({
    required this.id,
    required this.time,
    required this.title,
    required this.message,
    required this.notificationType,
    this.hasViewButton = true,
    this.hasMoreMenu = true,
    this.isRead = false,
    this.isNew = false,
    required this.createdAt,
    this.additionalData,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      time: json['time'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      notificationType: _parseNotificationType(json['notification_type'] as String),
      hasViewButton: json['has_view_button'] as bool? ?? true,
      hasMoreMenu: json['has_more_menu'] as bool? ?? true,
      isRead: json['is_read'] as bool? ?? false,
      isNew: json['is_new'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      additionalData: json['additional_data'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time,
      'title': title,
      'message': message,
      'notification_type': notificationType.name,
      'has_view_button': hasViewButton,
      'has_more_menu': hasMoreMenu,
      'is_read': isRead,
      'is_new': isNew,
      'created_at': createdAt.toIso8601String(),
      'additional_data': additionalData,
    };
  }

  static NotificationType _parseNotificationType(String type) {
    switch (type) {
      case 'login_request':
        return NotificationType.loginRequest;
      case 'maintenance_approval':
        return NotificationType.maintenanceApproval;
      case 'maintenance_approval_multi':
        return NotificationType.maintenanceApprovalMulti;
      case 'leave_request':
        return NotificationType.leaveRequest;
      case 'maintenance_repair':
        return NotificationType.maintenanceRepair;
      case 'low_inventory':
        return NotificationType.lowInventory;
      case 'guest_check_in':
        return NotificationType.guestCheckIn;
      case 'guest_check_out':
        return NotificationType.guestCheckOut;
      case 'task_assignment':
        return NotificationType.taskAssignment;
      default:
        return NotificationType.maintenanceApproval;
    }
  }

  NotificationModel copyWith({
    String? id,
    String? time,
    String? title,
    String? message,
    NotificationType? notificationType,
    bool? hasViewButton,
    bool? hasMoreMenu,
    bool? isRead,
    bool? isNew,
    DateTime? createdAt,
    Map<String, dynamic>? additionalData,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      time: time ?? this.time,
      title: title ?? this.title,
      message: message ?? this.message,
      notificationType: notificationType ?? this.notificationType,
      hasViewButton: hasViewButton ?? this.hasViewButton,
      hasMoreMenu: hasMoreMenu ?? this.hasMoreMenu,
      isRead: isRead ?? this.isRead,
      isNew: isNew ?? this.isNew,
      createdAt: createdAt ?? this.createdAt,
      additionalData: additionalData ?? this.additionalData,
    );
  }

  String get notificationTypeDisplay {
    switch (notificationType) {
      case NotificationType.loginRequest:
        return 'Login Request';
      case NotificationType.maintenanceApproval:
        return 'Maintenance Approval';
      case NotificationType.maintenanceApprovalMulti:
        return 'Multiple Maintenance Approvals';
      case NotificationType.leaveRequest:
        return 'Leave Request';
      case NotificationType.maintenanceRepair:
        return 'Maintenance Repair';
      case NotificationType.lowInventory:
        return 'Low Inventory';
      case NotificationType.guestCheckIn:
        return 'Guest Check In';
      case NotificationType.guestCheckOut:
        return 'Guest Check Out';
      case NotificationType.taskAssignment:
        return 'Task Assignment';
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NotificationModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, type: $notificationType, isRead: $isRead)';
  }
}