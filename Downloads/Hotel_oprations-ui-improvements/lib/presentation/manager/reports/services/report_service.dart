import '../models/report_model.dart';

class ReportService {
  static final ReportService _instance = ReportService._internal();
  factory ReportService() => _instance;
  ReportService._internal();

  // Get revenue report
  Future<RevenueReport> getRevenueReport({required DateTime date}) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 700));
    
    return RevenueReport(
      date: date,
      totalRevenue: 28500.75,
      roomRevenue: 22000.00,
      serviceRevenue: 4200.50,
      foodRevenue: 2300.25,
      totalBookings: 45,
      checkIns: 18,
      checkOuts: 22,
      averageRoomRate: 189.50,
    );
  }

  // Get revenue reports for date range
  Future<List<RevenueReport>> getRevenueReports({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 900));
    
    List<RevenueReport> reports = [];
    DateTime currentDate = startDate;
    
    while (currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
      reports.add(RevenueReport(
        date: currentDate,
        totalRevenue: 25000 + (currentDate.day % 10) * 1000.0,
        roomRevenue: 20000 + (currentDate.day % 8) * 800.0,
        serviceRevenue: 3000 + (currentDate.day % 5) * 200.0,
        foodRevenue: 2000 + (currentDate.day % 3) * 150.0,
        totalBookings: 40 + (currentDate.day % 15),
        checkIns: 15 + (currentDate.day % 10),
        checkOuts: 18 + (currentDate.day % 8),
        averageRoomRate: 180.0 + (currentDate.day % 20),
      ));
      
      currentDate = currentDate.add(const Duration(days: 1));
    }
    
    return reports;
  }

  // Get occupancy report
  Future<OccupancyReport> getOccupancyReport({required DateTime date}) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));
    
    return OccupancyReport(
      date: date,
      totalRooms: 150,
      occupiedRooms: 120,
      availableRooms: 25,
      maintenanceRooms: 5,
      occupancyRate: 80.0,
      averageDailyRate: 189.50,
      revPar: 151.60, // occupancyRate * averageDailyRate / 100
    );
  }

  // Get occupancy reports for date range
  Future<List<OccupancyReport>> getOccupancyReports({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    List<OccupancyReport> reports = [];
    DateTime currentDate = startDate;
    
    while (currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
      final occupancyRate = 75.0 + (currentDate.day % 10) * 2.0;
      final averageDailyRate = 180.0 + (currentDate.day % 15) * 2.0;
      
      reports.add(OccupancyReport(
        date: currentDate,
        totalRooms: 150,
        occupiedRooms: (150 * occupancyRate / 100).round(),
        availableRooms: 150 - (150 * occupancyRate / 100).round() - 5,
        maintenanceRooms: 5,
        occupancyRate: occupancyRate,
        averageDailyRate: averageDailyRate,
        revPar: occupancyRate * averageDailyRate / 100,
      ));
      
      currentDate = currentDate.add(const Duration(days: 1));
    }
    
    return reports;
  }

  // Get department reports
  Future<List<DepartmentReport>> getDepartmentReports() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));
    
    return [
      DepartmentReport(
        departmentName: 'Housekeeping',
        totalTasks: 120,
        completedTasks: 115,
        pendingTasks: 3,
        overdueTasks: 2,
        efficiency: 95.8,
        staffCount: 25,
        activeStaff: 23,
      ),
      DepartmentReport(
        departmentName: 'Maintenance',
        totalTasks: 35,
        completedTasks: 32,
        pendingTasks: 2,
        overdueTasks: 1,
        efficiency: 91.4,
        staffCount: 8,
        activeStaff: 7,
      ),
      DepartmentReport(
        departmentName: 'Front Desk',
        totalTasks: 80,
        completedTasks: 78,
        pendingTasks: 2,
        overdueTasks: 0,
        efficiency: 97.5,
        staffCount: 12,
        activeStaff: 11,
      ),
      DepartmentReport(
        departmentName: 'Kitchen',
        totalTasks: 95,
        completedTasks: 90,
        pendingTasks: 4,
        overdueTasks: 1,
        efficiency: 94.7,
        staffCount: 18,
        activeStaff: 16,
      ),
    ];
  }

  // Get financial summary
  Future<FinancialSummary> getFinancialSummary({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    const totalRevenue = 285000.50;
    const totalExpenses = 180000.25;
    
    return FinancialSummary(
      startDate: startDate,
      endDate: endDate,
      totalRevenue: totalRevenue,
      totalExpenses: totalExpenses,
      netProfit: totalRevenue - totalExpenses,
      profitMargin: ((totalRevenue - totalExpenses) / totalRevenue) * 100,
      revenueByCategory: {
        'Room Revenue': 220000.00,
        'Food & Beverage': 45000.25,
        'Services': 15000.15,
        'Other': 5000.10,
      },
      expensesByCategory: {
        'Staff Salaries': 85000.00,
        'Utilities': 25000.50,
        'Maintenance': 15000.25,
        'Supplies': 35000.75,
        'Other': 19999.75,
      },
    );
  }

  // Get monthly revenue summary
  Future<Map<String, double>> getMonthlyRevenueSummary(int year) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));
    
    return {
      'January': 285000.50,
      'February': 295200.75,
      'March': 318500.25,
      'April': 342800.00,
      'May': 361200.50,
      'June': 389500.25,
      'July': 425800.75,
      'August': 441200.00,
      'September': 398500.50,
      'October': 375800.25,
      'November': 352200.75,
      'December': 368500.00,
    };
  }

  // Get yearly comparison
  Future<Map<String, Map<String, double>>> getYearlyComparison({
    required int currentYear,
    required int previousYear,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 700));
    
    return {
      currentYear.toString(): {
        'revenue': 4254000.50,
        'occupancy': 78.5,
        'adr': 185.25,
        'revpar': 145.42,
      },
      previousYear.toString(): {
        'revenue': 3854200.25,
        'occupancy': 72.3,
        'adr': 178.50,
        'revpar': 129.13,
      },
    };
  }

  // Export report data
  Future<String> exportReport({
    required String reportType,
    required DateTime startDate,
    required DateTime endDate,
    required String format, // 'csv', 'pdf', 'excel'
  }) async {
    // Simulate network delay for export processing
    await Future.delayed(const Duration(milliseconds: 1500));
    
    // In a real implementation, this would generate and save the actual file
    final fileName = '${reportType}_${startDate.toIso8601String().split('T')[0]}_to_${endDate.toIso8601String().split('T')[0]}.$format';
    
    return 'Report exported successfully: $fileName';
  }

  // Get dashboard summary for reports
  Future<Map<String, dynamic>> getReportsDashboardSummary() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    return {
      'total_revenue_mtd': 125000.50, // Month to date
      'total_revenue_ytd': 1250000.75, // Year to date
      'occupancy_rate_mtd': 78.5,
      'occupancy_rate_ytd': 76.8,
      'adr_mtd': 185.25, // Average Daily Rate
      'adr_ytd': 182.50,
      'revpar_mtd': 145.42, // Revenue per available room
      'revpar_ytd': 140.18,
      'total_bookings_mtd': 456,
      'total_bookings_ytd': 4850,
    };
  }
}