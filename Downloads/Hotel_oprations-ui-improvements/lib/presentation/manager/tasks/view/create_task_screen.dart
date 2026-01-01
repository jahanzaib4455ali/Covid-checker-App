import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/presentation/manager/tasks/widgets/task_creation_popups.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  // Form State
  String selectedDepartment = "Housekeeping"; // Default
  String selectedAssignedType = "Worker"; // Worker or Team
  
  // New: Category Field (Driven by Popup)
  String selectedCategory = "Cleaning"; 
  
  String selectedEmployee = "Khizer (001)";
  String selectedTaskLocation = "";
  
  // New: Budget Field
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController(text: "Clean Guest Room(s) and Sanitize UV at once");
  
  String selectedPriority = "Normal"; /* Normal / Urgent */
  
  // Automation Logic
  bool isTaskAutomation = false;
  String selectedAutomationType = "Event Based";
  String selectedEventType = "Guest Check-out";
  
  // Timings
  DateTime? _startDate;
  TimeOfDay? _startTime;
  DateTime? _deadlineDate;
  TimeOfDay? _deadlineTime;

  bool hasVoiceNote = false;
  
  bool _isFormDirty = false; // To track changes for Draft Alert

  @override
  void initState() {
    super.initState();
    // Prompt for Location Access on Load (Simulated)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showLocationPopup();
    });
    
    // Listen for changes
    _descriptionController.addListener(_markDirty);
    _budgetController.addListener(_markDirty);
  }
  
  void _markDirty() {
    if (!_isFormDirty) setState(() => _isFormDirty = true);
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  // --- Popups ---

  void _showLocationPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => LocationAccessPopup(
        onAllow: () {
          Navigator.pop(context);
          // Logic to enable map/location
        },
        onDeny: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showCategoryPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => CategoryPickerSheet(
        onSelect: (category) {
          setState(() {
            selectedCategory = category;
            _isFormDirty = true;
          });
        },
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (!_isFormDirty) return true;
    
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => DiscardDraftAlert(
        onDiscard: () {
          Navigator.pop(context, true); // Return true to pop
        },
        onSaveDraft: () {
          // Logic to save draft
          Navigator.pop(context, true); // Return true to pop
        },
      ),
    );
    return result ?? false;
  }

  void _submitTask() {
    // Validate
    if (_descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Description is required")));
      return;
    }
    
    // Show Success
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessTickDialog(
        onFinished: () {
          Navigator.pop(context); // Close Dialog
          Navigator.pop(context); // Close Screen
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // Premium Form UI
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: MyColors.grayF7F7F7,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () async {
              if (await _onWillPop()) Navigator.pop(context);
            },
          ),
          title: TextView("Create New Task", style: myTextStyle.font_18w600.copyWith(color: Colors.black)),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () { 
                // Save Draft Logic
                Navigator.pop(context);
              },
              child: TextView("Save Draft", style: myTextStyle.font_14w600.copyWith(color: MyColors.gray667085)),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Service Selection (Clickable Tile)
              TextView("Service Category", style: myTextStyle.font_14w600.copyWith(color: MyColors.gray667085)),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: _showCategoryPicker,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: MyColors.grayD0D5DD),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: MyColors.primaryDark1D1929.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(Icons.cleaning_services, size: 20.sp, color: MyColors.primaryDark1D1929),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: TextView(selectedCategory, style: myTextStyle.font_16ww500),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: MyColors.gray9F9F9F),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20.h),
              
              // 2. Customer/Location Info
              TextView("Customer & Location", style: myTextStyle.font_14w600.copyWith(color: MyColors.gray667085)),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: MyColors.grayD0D5DD),
                ),
                child: Column(
                  children: [
                    _buildCompactInput("Room / Location", "e.g. Room A-102", (val) => selectedTaskLocation = val),
                    Divider(height: 24.h, thickness: 1, color: MyColors.grayF4F4F6),
                    _buildCompactInput("Customer Name (Optional)", "Guest Name", (val) {}),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // 3. Task Details & Budget
              TextView("Task Details", style: myTextStyle.font_14w600.copyWith(color: MyColors.gray667085)),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: MyColors.grayD0D5DD),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _descriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Describe what needs to be done...",
                        hintStyle: myTextStyle.font_14w400.copyWith(color: MyColors.gray9F9F9F),
                        border: InputBorder.none,
                      ),
                    ),
                    Divider(height: 24.h, thickness: 1, color: MyColors.grayF4F4F6),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView("Budget / Price", style: myTextStyle.font_12w500.copyWith(color: MyColors.gray667085)),
                               TextField(
                                controller: _budgetController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "\$0.00",
                                  hintStyle: myTextStyle.font_16ww600.copyWith(color: MyColors.primaryDark1D1929),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                                style: myTextStyle.font_16ww600.copyWith(color: MyColors.primaryDark1D1929),
                              ),
                            ],
                          ),
                        ),
                        Container(width: 1, height: 40.h, color: MyColors.grayF4F4F6),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView("Priority", style: myTextStyle.font_12w500.copyWith(color: MyColors.gray667085)),
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedPriority,
                                  isExpanded: true,
                                  isDense: true,
                                  icon: Icon(Icons.flag_outlined, size: 18.sp, color: selectedPriority == 'High' ? Colors.red : Colors.orange),
                                  items: ["Normal", "Urgent", "High"].map((e) => DropdownMenuItem(value: e, child: TextView(e, style: myTextStyle.font_14w500))).toList(),
                                  onChanged: (val) => setState(() => selectedPriority = val!),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              
              SizedBox(height: 20.h),
              
              // 4. Scheduling
              TextView("Schedule", style: myTextStyle.font_14w600.copyWith(color: MyColors.gray667085)),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(child: _buildDateTimeTile("Start Time", "Now", Icons.access_time)),
                  SizedBox(width: 12.w),
                  Expanded(child: _buildDateTimeTile("Deadline", "Select", Icons.event_busy)),
                ],
              ),
              
              SizedBox(height: 40.h),
              
              // Action Button
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: _submitTask,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.primaryDark1D1929,
                    elevation: 5,
                    shadowColor: MyColors.primaryDark1D1929.withOpacity(0.3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                  ),
                  child: TextView("Create Task", style: myTextStyle.font_16ww700.copyWith(color: Colors.white)),
                ),
              ),
               SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompactInput(String label, String hint, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(label, style: myTextStyle.font_12w500.copyWith(color: MyColors.gray667085)),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: myTextStyle.font_14w500.copyWith(color: MyColors.gray9F9F9F),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8.h),
          ),
          style: myTextStyle.font_14w500.copyWith(color: MyColors.dark000000),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildDateTimeTile(String label, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
         border: Border.all(color: MyColors.grayD0D5DD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           TextView(label, style: myTextStyle.font_12w500.copyWith(color: MyColors.gray667085)),
           SizedBox(height: 8.h),
           Row(
             children: [
               Icon(icon, size: 18.sp, color: MyColors.primaryDark1D1929),
               SizedBox(width: 8.w),
               TextView(value, style: myTextStyle.font_14w600),
             ],
           )
        ],
      ),
    );
  }
}