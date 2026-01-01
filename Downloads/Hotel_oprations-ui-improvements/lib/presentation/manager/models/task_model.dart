enum TaskStatus { pending, inProgress, completed, cancelled }

enum TaskPriority { low, normal, high, urgent }

class TaskModel {
  final String id;
  final String title;
  final String description;
  final String department;
  final String assignedEmployee;
  final String taskType;
  final String taskLocation;
  final TaskPriority priority;
  final TaskStatus status;
  final DateTime startTime;
  final DateTime endTime;
  final bool isAutomated;
  final String? automationType;
  final String? eventType;
  final bool roomQRScanValidation;
  final bool validationTaskStarted;
  final bool validationTaskCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.department,
    required this.assignedEmployee,
    required this.taskType,
    required this.taskLocation,
    required this.priority,
    this.status = TaskStatus.pending,
    required this.startTime,
    required this.endTime,
    this.isAutomated = false,
    this.automationType,
    this.eventType,
    this.roomQRScanValidation = false,
    this.validationTaskStarted = false,
    this.validationTaskCompleted = false,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      department: json['department'] as String,
      assignedEmployee: json['assigned_employee'] as String,
      taskType: json['task_type'] as String,
      taskLocation: json['task_location'] as String,
      priority: TaskPriority.values.firstWhere(
        (e) => e.name == (json['priority'] as String).toLowerCase(),
        orElse: () => TaskPriority.normal,
      ),
      status: TaskStatus.values.firstWhere(
        (e) => e.name == (json['status'] as String).toLowerCase(),
        orElse: () => TaskStatus.pending,
      ),
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      isAutomated: json['is_automated'] as bool? ?? false,
      automationType: json['automation_type'] as String?,
      eventType: json['event_type'] as String?,
      roomQRScanValidation: json['room_qr_scan_validation'] as bool? ?? false,
      validationTaskStarted: json['validation_task_started'] as bool? ?? false,
      validationTaskCompleted: json['validation_task_completed'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'department': department,
      'assigned_employee': assignedEmployee,
      'task_type': taskType,
      'task_location': taskLocation,
      'priority': priority.name,
      'status': status.name,
      'start_time': startTime.toIso8601String(),
      'end_time': endTime.toIso8601String(),
      'is_automated': isAutomated,
      'automation_type': automationType,
      'event_type': eventType,
      'room_qr_scan_validation': roomQRScanValidation,
      'validation_task_started': validationTaskStarted,
      'validation_task_completed': validationTaskCompleted,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    String? department,
    String? assignedEmployee,
    String? taskType,
    String? taskLocation,
    TaskPriority? priority,
    TaskStatus? status,
    DateTime? startTime,
    DateTime? endTime,
    bool? isAutomated,
    String? automationType,
    String? eventType,
    bool? roomQRScanValidation,
    bool? validationTaskStarted,
    bool? validationTaskCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      department: department ?? this.department,
      assignedEmployee: assignedEmployee ?? this.assignedEmployee,
      taskType: taskType ?? this.taskType,
      taskLocation: taskLocation ?? this.taskLocation,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isAutomated: isAutomated ?? this.isAutomated,
      automationType: automationType ?? this.automationType,
      eventType: eventType ?? this.eventType,
      roomQRScanValidation: roomQRScanValidation ?? this.roomQRScanValidation,
      validationTaskStarted: validationTaskStarted ?? this.validationTaskStarted,
      validationTaskCompleted: validationTaskCompleted ?? this.validationTaskCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get priorityDisplayName {
    switch (priority) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.normal:
        return 'Normal';
      case TaskPriority.high:
        return 'High';
      case TaskPriority.urgent:
        return 'Urgent';
    }
  }

  String get statusDisplayName {
    switch (status) {
      case TaskStatus.pending:
        return 'Pending';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.cancelled:
        return 'Cancelled';
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TaskModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, department: $department, priority: $priority, status: $status)';
  }
}