import '../../models/notification_model.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  // In-memory storage for demo purposes
  final List<NotificationModel> _notifications = [];

  // Get all notifications
  Future<List<NotificationModel>> getNotifications({
    bool? isRead,
    NotificationType? type,
    bool? isNew,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    List<NotificationModel> filteredNotifications = List.from(_notifications);
    
    if (isRead != null) {
      filteredNotifications = filteredNotifications.where((notification) => 
        notification.isRead == isRead).toList();
    }
    
    if (type != null) {
      filteredNotifications = filteredNotifications.where((notification) => 
        notification.notificationType == type).toList();
    }
    
    if (isNew != null) {
      filteredNotifications = filteredNotifications.where((notification) => 
        notification.isNew == isNew).toList();
    }
    
    // Sort by creation date (newest first)
    filteredNotifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    
    return filteredNotifications;
  }

  // Get new notifications
  Future<List<NotificationModel>> getNewNotifications() async {
    return await getNotifications(isNew: true);
  }

  // Get other notifications (not new)
  Future<List<NotificationModel>> getOtherNotifications() async {
    return await getNotifications(isNew: false);
  }

  // Get sample notifications for demo
  List<NotificationModel> getSampleNotifications() {
    return [
      // New notification
      NotificationModel(
        id: '1',
        time: '5h ago',
        title: 'Rahul Kumar, Cook',
        message: 'Sent login request for mobile app',
        notificationType: NotificationType.loginRequest,
        isNew: true,
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      // Other notifications
      NotificationModel(
        id: '2',
        time: '5h ago',
        title: 'Low Inventory',
        message: 'Chicken quantity is below threshold!',
        notificationType: NotificationType.lowInventory,
        createdAt: DateTime.now().subtract(const Duration(hours: 5, minutes: 10)),
      ),
      NotificationModel(
        id: '3',
        time: '5h ago',
        title: 'Leave Request Submitted',
        message: 'Rahul, Chef Applies for 2 days leave',
        notificationType: NotificationType.leaveRequest,
        createdAt: DateTime.now().subtract(const Duration(hours: 5, minutes: 15)),
      ),
      NotificationModel(
        id: '4',
        time: '10h ago',
        title: 'Maintenance Required',
        message: 'Room 101 AC is not working properly',
        notificationType: NotificationType.maintenanceRepair,
        createdAt: DateTime.now().subtract(const Duration(hours: 10)),
      ),
      NotificationModel(
        id: '5',
        time: '12h ago',
        title: 'Task Assignment',
        message: 'New housekeeping task assigned to your team',
        notificationType: NotificationType.taskAssignment,
        createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      ),
    ];
  }

  // Create new notification
  Future<NotificationModel> createNotification({
    required String title,
    required String message,
    required NotificationType notificationType,
    bool hasViewButton = true,
    bool hasMoreMenu = true,
    bool isNew = false,
    Map<String, dynamic>? additionalData,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    final notification = NotificationModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      time: _formatTimeAgo(DateTime.now()),
      title: title,
      message: message,
      notificationType: notificationType,
      hasViewButton: hasViewButton,
      hasMoreMenu: hasMoreMenu,
      isNew: isNew,
      createdAt: DateTime.now(),
      additionalData: additionalData,
    );
    
    _notifications.add(notification);
    return notification;
  }

  // Mark notification as read
  Future<NotificationModel> markAsRead(String notificationId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
      return _notifications[index];
    }
    
    throw Exception('Notification not found');
  }

  // Mark all notifications as read
  Future<void> markAllAsRead() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    for (int i = 0; i < _notifications.length; i++) {
      _notifications[i] = _notifications[i].copyWith(isRead: true);
    }
  }

  // Delete notification
  Future<void> deleteNotification(String notificationId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    _notifications.removeWhere((notification) => notification.id == notificationId);
  }

  // Get notification by ID
  Future<NotificationModel?> getNotificationById(String notificationId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 200));
    
    try {
      return _notifications.firstWhere((notification) => notification.id == notificationId);
    } catch (e) {
      return null;
    }
  }

  // Get unread notifications count
  Future<int> getUnreadNotificationsCount() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    
    return _notifications.where((notification) => !notification.isRead).length;
  }

  // Get new notifications count
  Future<int> getNewNotificationsCount() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    
    return _notifications.where((notification) => notification.isNew).length;
  }

  // Update notification
  Future<NotificationModel> updateNotification(NotificationModel notification) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    final index = _notifications.indexWhere((n) => n.id == notification.id);
    if (index != -1) {
      _notifications[index] = notification;
      return notification;
    }
    
    throw Exception('Notification not found');
  }

  // Initialize with sample data
  void initializeSampleData() {
    if (_notifications.isEmpty) {
      _notifications.addAll(getSampleNotifications());
    }
  }

  // Helper method to format time ago
  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }

  // Clear all notifications (for testing)
  void clearAllNotifications() {
    _notifications.clear();
  }

  // Get notifications by type
  Future<List<NotificationModel>> getNotificationsByType(NotificationType type) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    return _notifications.where((notification) => 
      notification.notificationType == type).toList();
  }
}