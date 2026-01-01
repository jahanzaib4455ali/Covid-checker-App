import '../models/home_model.dart';

class HomeService {
  static final HomeService _instance = HomeService._internal();
  factory HomeService() => _instance;
  HomeService._internal();

  // Get dashboard statistics
  Future<DashboardStats> getDashboardStats() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    return DashboardStats(
      totalRooms: 150,
      occupiedRooms: 120,
      availableRooms: 25,
      maintenanceRooms: 5,
      occupancyRate: 80.0,
      revenue: 125000.50,
      totalTasks: 45,
      completedTasks: 32,
      pendingTasks: 13,
      totalStaff: 85,
      activeStaff: 78,
    );
  }

  // Get login requests
  Future<List<LoginRequest>> getLoginRequests() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));
    
    return [
      LoginRequest(
        id: '1',
        employeeName: 'Rahul Kumar',
        department: 'Kitchen',
        role: 'Cook',
        requestedAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      LoginRequest(
        id: '2',
        employeeName: 'Sarah Ahmed',
        department: 'Housekeeping',
        role: 'Room Attendant',
        requestedAt: DateTime.now().subtract(const Duration(hours: 4)),
      ),
      LoginRequest(
        id: '3',
        employeeName: 'Ali Hassan',
        department: 'Maintenance',
        role: 'Technician',
        requestedAt: DateTime.now().subtract(const Duration(hours: 6)),
      ),
      LoginRequest(
        id: '4',
        employeeName: 'Maria Santos',
        department: 'Front Desk',
        role: 'Receptionist',
        requestedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  // Approve login request
  Future<LoginRequest> approveLoginRequest(String requestId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // In a real app, this would make an API call
    // For now, return a mock approved request
    final requests = await getLoginRequests();
    final request = requests.firstWhere((r) => r.id == requestId);
    
    return request.copyWith(
      isApproved: true,
      isPending: false,
    );
  }

  // Reject login request
  Future<void> rejectLoginRequest(String requestId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // In a real app, this would make an API call to reject the request
  }


  // Get department performance
  Future<Map<String, Map<String, dynamic>>> getDepartmentPerformance() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    return {
      'Housekeeping': {
        'total_tasks': 120,
        'completed_tasks': 115,
        'pending_tasks': 5,
        'efficiency': 95.8,
        'staff_count': 25,
      },
      'Maintenance': {
        'total_tasks': 35,
        'completed_tasks': 32,
        'pending_tasks': 3,
        'efficiency': 91.4,
        'staff_count': 8,
      },
      'Front Desk': {
        'total_tasks': 80,
        'completed_tasks': 78,
        'pending_tasks': 2,
        'efficiency': 97.5,
        'staff_count': 12,
      },
      'Kitchen': {
        'total_tasks': 95,
        'completed_tasks': 90,
        'pending_tasks': 5,
        'efficiency': 94.7,
        'staff_count': 18,
      },
    };
  }

  // Get recent activities
  Future<List<Map<String, dynamic>>> getRecentActivities() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 400));
    
    return [
      {
        'id': '1',
        'type': 'check_in',
        'message': 'Guest checked in to Room 205',
        'time': DateTime.now().subtract(const Duration(minutes: 15)),
        'department': 'Front Desk',
      },
      {
        'id': '2',
        'type': 'task_completed',
        'message': 'Room 103 cleaning completed',
        'time': DateTime.now().subtract(const Duration(minutes: 32)),
        'department': 'Housekeeping',
      },
      {
        'id': '3',
        'type': 'maintenance_request',
        'message': 'AC repair requested for Room 156',
        'time': DateTime.now().subtract(const Duration(hours: 1)),
        'department': 'Maintenance',
      },
      {
        'id': '4',
        'type': 'inventory_alert',
        'message': 'Low stock alert: Towels',
        'time': DateTime.now().subtract(const Duration(hours: 2)),
        'department': 'Housekeeping',
      },
      {
        'id': '5',
        'type': 'check_out',
        'message': 'Guest checked out from Room 118',
        'time': DateTime.now().subtract(const Duration(hours: 3)),
        'department': 'Front Desk',
      },
    ];
  }

  // Get occupancy trends
  Future<List<Map<String, dynamic>>> getOccupancyTrends(int days) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));
    
    List<Map<String, dynamic>> trends = [];
    
    for (int i = days - 1; i >= 0; i--) {
      final date = DateTime.now().subtract(Duration(days: i));
      trends.add({
        'date': date,
        'occupancy_rate': 75.0 + (i % 10) * 2.5, // Mock data with variation
        'total_rooms': 150,
        'occupied_rooms': (150 * (75.0 + (i % 10) * 2.5) / 100).round(),
      });
    }
    
    return trends;
  }
}