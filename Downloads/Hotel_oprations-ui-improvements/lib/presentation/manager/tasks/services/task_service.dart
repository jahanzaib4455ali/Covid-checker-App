import '../models/task_model.dart';

class TaskService {
  static final TaskService _instance = TaskService._internal();
  factory TaskService() => _instance;
  TaskService._internal();

  // In-memory storage for demo purposes
  final List<TaskModel> _tasks = [];

  // Get all tasks
  Future<List<TaskModel>> getTasks({
    TaskStatus? status,
    TaskPriority? priority,
    String? department,
    String? assignedEmployee,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));
    
    List<TaskModel> filteredTasks = List.from(_tasks);
    
    if (status != null) {
      filteredTasks = filteredTasks.where((task) => task.status == status).toList();
    }
    
    if (priority != null) {
      filteredTasks = filteredTasks.where((task) => task.priority == priority).toList();
    }
    
    if (department != null && department.isNotEmpty) {
      filteredTasks = filteredTasks.where((task) => 
        task.department.toLowerCase().contains(department.toLowerCase())).toList();
    }
    
    if (assignedEmployee != null && assignedEmployee.isNotEmpty) {
      filteredTasks = filteredTasks.where((task) => 
        task.assignedEmployee.toLowerCase().contains(assignedEmployee.toLowerCase())).toList();
    }
    
    // Sort by creation date (newest first)
    filteredTasks.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    
    return filteredTasks;
  }

  // Create new task
  Future<TaskModel> createTask({
    required String title,
    required String description,
    required String department,
    required String assignedEmployee,
    required String taskType,
    required String taskLocation,
    required TaskPriority priority,
    required DateTime startTime,
    required DateTime endTime,
    bool isAutomated = false,
    String? automationType,
    String? eventType,
    bool roomQRScanValidation = false,
    bool validationTaskStarted = false,
    bool validationTaskCompleted = false,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    final task = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      department: department,
      assignedEmployee: assignedEmployee,
      taskType: taskType,
      taskLocation: taskLocation,
      priority: priority,
      startTime: startTime,
      endTime: endTime,
      isAutomated: isAutomated,
      automationType: automationType,
      eventType: eventType,
      roomQRScanValidation: roomQRScanValidation,
      validationTaskStarted: validationTaskStarted,
      validationTaskCompleted: validationTaskCompleted,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    
    _tasks.add(task);
    return task;
  }

  // Update task
  Future<TaskModel> updateTask(TaskModel task) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task.copyWith(updatedAt: DateTime.now());
      return _tasks[index];
    }
    
    throw Exception('Task not found');
  }

  // Update task status
  Future<TaskModel> updateTaskStatus(String taskId, TaskStatus status) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 400));
    
    final index = _tasks.indexWhere((t) => t.id == taskId);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(
        status: status,
        updatedAt: DateTime.now(),
      );
      return _tasks[index];
    }
    
    throw Exception('Task not found');
  }

  // Delete task
  Future<void> deleteTask(String taskId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    _tasks.removeWhere((task) => task.id == taskId);
  }

  // Get task by ID
  Future<TaskModel?> getTaskById(String taskId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 200));
    
    try {
      return _tasks.firstWhere((task) => task.id == taskId);
    } catch (e) {
      return null;
    }
  }

  // Get pending tasks
  Future<List<TaskModel>> getPendingTasks() async {
    return await getTasks(status: TaskStatus.pending);
  }

  // Get completed tasks
  Future<List<TaskModel>> getCompletedTasks() async {
    return await getTasks(status: TaskStatus.completed);
  }

  // Get tasks by priority
  Future<List<TaskModel>> getTasksByPriority(TaskPriority priority) async {
    return await getTasks(priority: priority);
  }

  // Get tasks by department
  Future<List<TaskModel>> getTasksByDepartment(String department) async {
    return await getTasks(department: department);
  }

  // Get overdue tasks
  Future<List<TaskModel>> getOverdueTasks() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 400));
    
    final now = DateTime.now();
    return _tasks.where((task) => 
      task.status != TaskStatus.completed && 
      task.status != TaskStatus.cancelled &&
      task.endTime.isBefore(now)
    ).toList();
  }

  // Get task statistics
  Future<Map<String, int>> getTaskStatistics() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    return {
      'total': _tasks.length,
      'pending': _tasks.where((t) => t.status == TaskStatus.pending).length,
      'inProgress': _tasks.where((t) => t.status == TaskStatus.inProgress).length,
      'completed': _tasks.where((t) => t.status == TaskStatus.completed).length,
      'cancelled': _tasks.where((t) => t.status == TaskStatus.cancelled).length,
      'urgent': _tasks.where((t) => t.priority == TaskPriority.urgent).length,
      'high': _tasks.where((t) => t.priority == TaskPriority.high).length,
      'overdue': _tasks.where((t) => 
        t.status != TaskStatus.completed && 
        t.status != TaskStatus.cancelled &&
        t.endTime.isBefore(DateTime.now())
      ).length,
    };
  }

  // Initialize with sample data
  void initializeSampleData() {
    if (_tasks.isEmpty) {
      _tasks.addAll(_getSampleTasks());
    }
  }

  List<TaskModel> _getSampleTasks() {
    final now = DateTime.now();
    
    return [
      TaskModel(
        id: '1',
        title: 'Room 102 Deep Cleaning',
        description: 'Complete deep cleaning of Room 102 including bathroom sanitization',
        department: 'Housekeeping',
        assignedEmployee: 'Rahul Niel',
        taskType: 'Cleaning',
        taskLocation: 'Room A-102',
        priority: TaskPriority.urgent,
        status: TaskStatus.pending,
        startTime: now.add(const Duration(hours: 1)),
        endTime: now.add(const Duration(hours: 3)),
        createdAt: now.subtract(const Duration(hours: 2)),
        updatedAt: now.subtract(const Duration(hours: 2)),
      ),
      TaskModel(
        id: '2',
        title: 'AC Maintenance Check',
        description: 'Routine AC maintenance and filter replacement',
        department: 'Maintenance',
        assignedEmployee: 'Ahmed Ali',
        taskType: 'Maintenance',
        taskLocation: 'Room B-205',
        priority: TaskPriority.normal,
        status: TaskStatus.inProgress,
        startTime: now.subtract(const Duration(hours: 1)),
        endTime: now.add(const Duration(hours: 2)),
        createdAt: now.subtract(const Duration(hours: 3)),
        updatedAt: now.subtract(const Duration(minutes: 30)),
      ),
      TaskModel(
        id: '3',
        title: 'Guest Welcome Setup',
        description: 'Prepare welcome amenities for VIP guest arrival',
        department: 'Housekeeping',
        assignedEmployee: 'Sara Khan',
        taskType: 'Guest Experience',
        taskLocation: 'Room C-301',
        priority: TaskPriority.high,
        status: TaskStatus.completed,
        startTime: now.subtract(const Duration(hours: 4)),
        endTime: now.subtract(const Duration(hours: 2)),
        createdAt: now.subtract(const Duration(hours: 5)),
        updatedAt: now.subtract(const Duration(hours: 2)),
      ),
    ];
  }

  // Clear all tasks (for testing)
  void clearAllTasks() {
    _tasks.clear();
  }
}