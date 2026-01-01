class RevenueReport {
  final DateTime date;
  final double totalRevenue;
  final double roomRevenue;
  final double serviceRevenue;
  final double foodRevenue;
  final int totalBookings;
  final int checkIns;
  final int checkOuts;
  final double averageRoomRate;

  RevenueReport({
    required this.date,
    required this.totalRevenue,
    required this.roomRevenue,
    required this.serviceRevenue,
    required this.foodRevenue,
    required this.totalBookings,
    required this.checkIns,
    required this.checkOuts,
    required this.averageRoomRate,
  });

  factory RevenueReport.fromJson(Map<String, dynamic> json) {
    return RevenueReport(
      date: DateTime.parse(json['date'] as String),
      totalRevenue: (json['total_revenue'] as num).toDouble(),
      roomRevenue: (json['room_revenue'] as num).toDouble(),
      serviceRevenue: (json['service_revenue'] as num).toDouble(),
      foodRevenue: (json['food_revenue'] as num).toDouble(),
      totalBookings: json['total_bookings'] as int,
      checkIns: json['check_ins'] as int,
      checkOuts: json['check_outs'] as int,
      averageRoomRate: (json['average_room_rate'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'total_revenue': totalRevenue,
      'room_revenue': roomRevenue,
      'service_revenue': serviceRevenue,
      'food_revenue': foodRevenue,
      'total_bookings': totalBookings,
      'check_ins': checkIns,
      'check_outs': checkOuts,
      'average_room_rate': averageRoomRate,
    };
  }
}

class OccupancyReport {
  final DateTime date;
  final int totalRooms;
  final int occupiedRooms;
  final int availableRooms;
  final int maintenanceRooms;
  final double occupancyRate;
  final double averageDailyRate;
  final double revPar; // Revenue per available room

  OccupancyReport({
    required this.date,
    required this.totalRooms,
    required this.occupiedRooms,
    required this.availableRooms,
    required this.maintenanceRooms,
    required this.occupancyRate,
    required this.averageDailyRate,
    required this.revPar,
  });

  factory OccupancyReport.fromJson(Map<String, dynamic> json) {
    return OccupancyReport(
      date: DateTime.parse(json['date'] as String),
      totalRooms: json['total_rooms'] as int,
      occupiedRooms: json['occupied_rooms'] as int,
      availableRooms: json['available_rooms'] as int,
      maintenanceRooms: json['maintenance_rooms'] as int,
      occupancyRate: (json['occupancy_rate'] as num).toDouble(),
      averageDailyRate: (json['average_daily_rate'] as num).toDouble(),
      revPar: (json['rev_par'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'total_rooms': totalRooms,
      'occupied_rooms': occupiedRooms,
      'available_rooms': availableRooms,
      'maintenance_rooms': maintenanceRooms,
      'occupancy_rate': occupancyRate,
      'average_daily_rate': averageDailyRate,
      'rev_par': revPar,
    };
  }
}

class DepartmentReport {
  final String departmentName;
  final int totalTasks;
  final int completedTasks;
  final int pendingTasks;
  final int overdueTasks;
  final double efficiency;
  final int staffCount;
  final int activeStaff;

  DepartmentReport({
    required this.departmentName,
    required this.totalTasks,
    required this.completedTasks,
    required this.pendingTasks,
    required this.overdueTasks,
    required this.efficiency,
    required this.staffCount,
    required this.activeStaff,
  });

  factory DepartmentReport.fromJson(Map<String, dynamic> json) {
    return DepartmentReport(
      departmentName: json['department_name'] as String,
      totalTasks: json['total_tasks'] as int,
      completedTasks: json['completed_tasks'] as int,
      pendingTasks: json['pending_tasks'] as int,
      overdueTasks: json['overdue_tasks'] as int,
      efficiency: (json['efficiency'] as num).toDouble(),
      staffCount: json['staff_count'] as int,
      activeStaff: json['active_staff'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'department_name': departmentName,
      'total_tasks': totalTasks,
      'completed_tasks': completedTasks,
      'pending_tasks': pendingTasks,
      'overdue_tasks': overdueTasks,
      'efficiency': efficiency,
      'staff_count': staffCount,
      'active_staff': activeStaff,
    };
  }
}

class FinancialSummary {
  final DateTime startDate;
  final DateTime endDate;
  final double totalRevenue;
  final double totalExpenses;
  final double netProfit;
  final double profitMargin;
  final Map<String, double> revenueByCategory;
  final Map<String, double> expensesByCategory;

  FinancialSummary({
    required this.startDate,
    required this.endDate,
    required this.totalRevenue,
    required this.totalExpenses,
    required this.netProfit,
    required this.profitMargin,
    required this.revenueByCategory,
    required this.expensesByCategory,
  });

  factory FinancialSummary.fromJson(Map<String, dynamic> json) {
    return FinancialSummary(
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      totalRevenue: (json['total_revenue'] as num).toDouble(),
      totalExpenses: (json['total_expenses'] as num).toDouble(),
      netProfit: (json['net_profit'] as num).toDouble(),
      profitMargin: (json['profit_margin'] as num).toDouble(),
      revenueByCategory: Map<String, double>.from(json['revenue_by_category']),
      expensesByCategory: Map<String, double>.from(json['expenses_by_category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'total_revenue': totalRevenue,
      'total_expenses': totalExpenses,
      'net_profit': netProfit,
      'profit_margin': profitMargin,
      'revenue_by_category': revenueByCategory,
      'expenses_by_category': expensesByCategory,
    };
  }
}