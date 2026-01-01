class DashboardStats {
  final int totalRooms;
  final int occupiedRooms;
  final int availableRooms;
  final int maintenanceRooms;
  final double occupancyRate;
  final double revenue;
  final int totalTasks;
  final int completedTasks;
  final int pendingTasks;
  final int totalStaff;
  final int activeStaff;

  DashboardStats({
    required this.totalRooms,
    required this.occupiedRooms,
    required this.availableRooms,
    required this.maintenanceRooms,
    required this.occupancyRate,
    required this.revenue,
    required this.totalTasks,
    required this.completedTasks,
    required this.pendingTasks,
    required this.totalStaff,
    required this.activeStaff,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) {
    return DashboardStats(
      totalRooms: json['total_rooms'] as int,
      occupiedRooms: json['occupied_rooms'] as int,
      availableRooms: json['available_rooms'] as int,
      maintenanceRooms: json['maintenance_rooms'] as int,
      occupancyRate: (json['occupancy_rate'] as num).toDouble(),
      revenue: (json['revenue'] as num).toDouble(),
      totalTasks: json['total_tasks'] as int,
      completedTasks: json['completed_tasks'] as int,
      pendingTasks: json['pending_tasks'] as int,
      totalStaff: json['total_staff'] as int,
      activeStaff: json['active_staff'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_rooms': totalRooms,
      'occupied_rooms': occupiedRooms,
      'available_rooms': availableRooms,
      'maintenance_rooms': maintenanceRooms,
      'occupancy_rate': occupancyRate,
      'revenue': revenue,
      'total_tasks': totalTasks,
      'completed_tasks': completedTasks,
      'pending_tasks': pendingTasks,
      'total_staff': totalStaff,
      'active_staff': activeStaff,
    };
  }
}

class LoginRequest {
  final String id;
  final String employeeName;
  final String department;
  final String role;
  final DateTime requestedAt;
  final bool isApproved;
  final bool isPending;

  LoginRequest({
    required this.id,
    required this.employeeName,
    required this.department,
    required this.role,
    required this.requestedAt,
    this.isApproved = false,
    this.isPending = true,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      id: json['id'] as String,
      employeeName: json['employee_name'] as String,
      department: json['department'] as String,
      role: json['role'] as String,
      requestedAt: DateTime.parse(json['requested_at'] as String),
      isApproved: json['is_approved'] as bool? ?? false,
      isPending: json['is_pending'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employee_name': employeeName,
      'department': department,
      'role': role,
      'requested_at': requestedAt.toIso8601String(),
      'is_approved': isApproved,
      'is_pending': isPending,
    };
  }

  LoginRequest copyWith({
    String? id,
    String? employeeName,
    String? department,
    String? role,
    DateTime? requestedAt,
    bool? isApproved,
    bool? isPending,
  }) {
    return LoginRequest(
      id: id ?? this.id,
      employeeName: employeeName ?? this.employeeName,
      department: department ?? this.department,
      role: role ?? this.role,
      requestedAt: requestedAt ?? this.requestedAt,
      isApproved: isApproved ?? this.isApproved,
      isPending: isPending ?? this.isPending,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LoginRequest && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'LoginRequest(id: $id, employeeName: $employeeName, department: $department)';
  }
}

