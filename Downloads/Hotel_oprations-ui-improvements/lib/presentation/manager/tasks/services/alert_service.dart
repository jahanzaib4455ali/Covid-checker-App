import '../models/alert_model.dart';

class AlertService {
  static final AlertService _instance = AlertService._internal();
  factory AlertService() => _instance;
  AlertService._internal();

  // In-memory storage for demo purposes
  // In production, this would connect to a real backend/database
  final List<AlertModel> _alerts = [];

  // Get all alerts
  Future<List<AlertModel>> getAlerts({String? department, String? priority}) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    List<AlertModel> filteredAlerts = List.from(_alerts);
    
    if (department != null && department.isNotEmpty) {
      filteredAlerts = filteredAlerts.where((alert) => 
        alert.department.toLowerCase().contains(department.toLowerCase())).toList();
    }
    
    if (priority != null && priority.isNotEmpty) {
      filteredAlerts = filteredAlerts.where((alert) => 
        alert.priority.toLowerCase() == priority.toLowerCase()).toList();
    }
    
    // Sort by creation date (newest first)
    filteredAlerts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    
    return filteredAlerts;
  }

  // Get sample alerts for demo
  List<AlertModel> getSampleAlerts() {
    return [
      AlertModel(
        id: '1',
        time: '10:10AM',
        recipient: 'Rahul Niel',
        department: 'Housekeeping',
        priority: 'Urgent',
        notificationTitle: null,
        createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
      AlertModel(
        id: '2',
        time: '10:10AM',
        recipient: 'Rahul Niel',
        department: 'Housekeeping',
        priority: 'Urgent',
        notificationTitle: 'Room A-102 Need Towel',
        createdAt: DateTime.now().subtract(const Duration(minutes: 20)),
      ),
      AlertModel(
        id: '3',
        time: '10:10AM',
        recipient: 'Rahul Niel',
        department: 'Housekeeping',
        priority: 'Urgent',
        notificationTitle: 'Room A-102 Need Towel',
        createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      AlertModel(
        id: '4',
        time: '09:45AM',
        recipient: 'Sarah Khan',
        department: 'Maintenance',
        priority: 'High',
        notificationTitle: 'AC Unit Repair Required',
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      AlertModel(
        id: '5',
        time: '09:30AM',
        recipient: 'Ahmed Ali',
        department: 'Front Desk',
        priority: 'Normal',
        notificationTitle: 'Guest Check-in Assistance',
        createdAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 15)),
      ),
    ];
  }

  // Create new alert
  Future<AlertModel> createAlert({
    required String recipient,
    required String department,
    required String priority,
    String? notificationTitle,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    final alert = AlertModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      time: _formatTime(DateTime.now()),
      recipient: recipient,
      department: department,
      priority: priority,
      notificationTitle: notificationTitle,
      createdAt: DateTime.now(),
    );
    
    _alerts.add(alert);
    return alert;
  }

  // Update alert
  Future<AlertModel> updateAlert(AlertModel alert) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    final index = _alerts.indexWhere((a) => a.id == alert.id);
    if (index != -1) {
      _alerts[index] = alert;
      return alert;
    }
    
    throw Exception('Alert not found');
  }

  // Mark alert as read
  Future<AlertModel> markAsRead(String alertId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    final index = _alerts.indexWhere((a) => a.id == alertId);
    if (index != -1) {
      _alerts[index] = _alerts[index].copyWith(isRead: true);
      return _alerts[index];
    }
    
    throw Exception('Alert not found');
  }

  // Delete alert
  Future<void> deleteAlert(String alertId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    _alerts.removeWhere((alert) => alert.id == alertId);
  }

  // Get alert by ID
  Future<AlertModel?> getAlertById(String alertId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 200));
    
    try {
      return _alerts.firstWhere((alert) => alert.id == alertId);
    } catch (e) {
      return null;
    }
  }

  // Get unread alerts count
  Future<int> getUnreadAlertsCount() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    
    return _alerts.where((alert) => !alert.isRead).length;
  }

  // Get alerts by priority
  Future<List<AlertModel>> getAlertsByPriority(String priority) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    return _alerts.where((alert) => 
      alert.priority.toLowerCase() == priority.toLowerCase()).toList();
  }

  // Get alerts by department
  Future<List<AlertModel>> getAlertsByDepartment(String department) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    return _alerts.where((alert) => 
      alert.department.toLowerCase() == department.toLowerCase()).toList();
  }

  // Initialize with sample data
  void initializeSampleData() {
    if (_alerts.isEmpty) {
      _alerts.addAll(getSampleAlerts());
    }
  }

  // Helper method to format time
  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute;
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    
    return '${displayHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}$period';
  }

  // Clear all alerts (for testing)
  void clearAllAlerts() {
    _alerts.clear();
  }
}