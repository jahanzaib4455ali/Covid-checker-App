import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/my_colors.dart';
import '../../../theme/my_text_styles.dart';
import '../text_view.dart';

class TableColumn {
  final String header;
  final double width;
  final TextAlign alignment;
  final bool isNumeric;
  final bool isEditable;

  const TableColumn({
    required this.header,
    required this.width,
    this.alignment = TextAlign.center,
    this.isNumeric = false,
    this.isEditable = false,
  });
}

class HorizontalScrollableTable extends StatefulWidget {
  final List<TableColumn> columns;
  final List<List<dynamic>> data;
  final double? tableHeight;
  final Color? headerBackgroundColor;
  final Color? headerTextColor;
  final Color? rowBackgroundColor;
  final Color? rowTextColor;
  final double? borderWidth;
  final Color? borderColor;
  final bool showActions;
  final Function(int)? onEditRow;
  final Function(int)? onDeleteRow;
  final Function()? onAddRow;
  final Function(int, int, String)? onCellEdit;

  const HorizontalScrollableTable({
    super.key,
    required this.columns,
    required this.data,
    this.tableHeight,
    this.headerBackgroundColor,
    this.headerTextColor,
    this.rowBackgroundColor,
    this.rowTextColor,
    this.borderWidth,
    this.borderColor,
    this.showActions = false,
    this.onEditRow,
    this.onDeleteRow,
    this.onAddRow,
    this.onCellEdit,
  });

  @override
  State<HorizontalScrollableTable> createState() => _HorizontalScrollableTableState();
}

class _HorizontalScrollableTableState extends State<HorizontalScrollableTable> {
  // List<List<dynamic>> _data = [];
  int? _editingRow;
  int? _editingColumn;
  final Map<String, TextEditingController> _controllers = {};
  final ScrollController _scrollController = ScrollController();
  double _columnWidthFactor = 1.0; // 1.0 = full width, 0.5 = half width

  @override
  void initState() {
    super.initState();
    // Add scroll listener
    _scrollController.addListener(_onScroll);
  }
  
  void _onScroll() {
    if (_scrollController.hasClients) {
      final offset = _scrollController.offset;
      
      // Progressive shrinking based on scroll offset
      // Starts shrinking immediately and reaches minimum at 100 pixels
      const double maxScrollForShrink = 100.0;
      const double minWidthFactor = 0.7; // Minimum width is 70% of original
      
      // Calculate the width factor based on scroll progress
      double progress = (offset / maxScrollForShrink).clamp(0.0, 1.0);
      double newWidthFactor = 1.0 - (progress * (1.0 - minWidthFactor));
      
      // Only update if the width factor has changed significantly
      if ((newWidthFactor - _columnWidthFactor).abs() > 0.01) {
        setState(() {
          _columnWidthFactor = newWidthFactor;
        });
      }
    }
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _startEditing(int rowIndex, int colIndex) {
    if (widget.columns[colIndex].isEditable) {
      setState(() {
        _editingRow = rowIndex;
        _editingColumn = colIndex;
      });
    }
  }

  void _saveEdit(int rowIndex, int colIndex) {
    final controller = _controllers['${rowIndex}_$colIndex'];
    if (controller != null) {
      setState(() {
        widget.data[rowIndex][colIndex] = controller.text;
        _editingRow = null;
        _editingColumn = null;
      });
      widget.onCellEdit?.call(rowIndex, colIndex, controller.text);
    }
  }

  void _cancelEdit() {
    setState(() {
      _editingRow = null;
      _editingColumn = null;
    });
  }

  void _addRow() {
    setState(() {
      widget.data.add(List.generate(widget.columns.length, (index) => ''));
    });
    widget.onAddRow?.call();
  }

  void _deleteRow(int rowIndex) {
    setState(() {
      widget.data.removeAt(rowIndex);
    });
    widget.onDeleteRow?.call(rowIndex);
  }

  void _editRow(int rowIndex) {
    widget.onEditRow?.call(rowIndex);
  }

@override
  Widget build(BuildContext context) {
    // Calculate dynamic height based on number of rows
    final double headerHeight = 50.h;
    final double baseRowHeight = 50.h;
    // Check if any row contains complex widgets and increase row height if needed
    // Also account for potential text wrapping in the narrower first column
    final bool hasComplexContent = widget.data.any((row) =>
        row.any((cell) => cell is Widget));
    final double rowHeight = hasComplexContent ? 70.h : 60.h; // Increased base height for text wrapping
    final double calculatedHeight = headerHeight + (widget.data.length * rowHeight);
    final double finalHeight = widget.tableHeight ?? calculatedHeight;

    return Container(
      height: finalHeight,
      decoration: BoxDecoration(
        color: widget.rowBackgroundColor ?? MyColors.whiteFFFFFF,
        // borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: widget.borderColor ?? MyColors.grayD0D5DD,
          width: widget.borderWidth ?? 1,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: widget.columns.isEmpty ? Container() : Row(
        children: [
          // Fixed first column container with animated width
          AnimatedContainer(
            duration: const Duration(milliseconds: 50), // Quick response to scroll
            curve: Curves.linear, // Linear for smooth continuous movement
            width: (widget.columns[0].width + 8.w) * _columnWidthFactor,
            decoration: BoxDecoration(
              color: widget.rowBackgroundColor ?? MyColors.whiteFFFFFF,
              border: Border(
                right: BorderSide(
                  color: widget.borderColor ?? MyColors.grayD0D5DD,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                // Fixed header
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: widget.headerBackgroundColor ?? MyColors.grayF2F2F2,
                    borderRadius: BorderRadius.only(
                      // topLeft: Radius.circular(8.r),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                  alignment: Alignment.centerLeft,
                  child: TextView(
                    widget.columns[0].header,
                    style: myTextStyle.font_14w400.copyWith(
                      color: widget.headerTextColor ?? MyColors.gray6D6D6D,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                    ),
                    textAlign: widget.columns[0].alignment,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  ),
                ),
                // Fixed column data rows
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.data.length,
                    itemBuilder: (context, rowIndex) {
                      final rowData = widget.data[rowIndex];
                      final cellData = rowData.isNotEmpty ? rowData[0] : '';
                      final isLastRow = rowIndex == widget.data.length - 1;

                      bool isEditing = _editingRow == rowIndex && _editingColumn == 0;
                      String controllerKey = '${rowIndex}_0';

                      if (isEditing && !_controllers.containsKey(controllerKey)) {
                        _controllers[controllerKey] = TextEditingController(text: cellData.toString());
                      }

                      return Container(
                        constraints: BoxConstraints(minHeight: rowHeight), // Set minimum height constraint
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: widget.rowBackgroundColor ?? MyColors.whiteFFFFFF,
                          borderRadius: isLastRow ? BorderRadius.only(
                            // bottomLeft: Radius.circular(12.r),
                          ) : null,
                          border: Border(
                            bottom: !isLastRow ? BorderSide(
                              color: MyColors.grayD0D5DD.withOpacity(0.3),
                              width: 0.5,
                            ) : BorderSide.none,
                          ),
                        ),
                        child: isEditing && widget.columns[0].isEditable
                            ? Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _controllers[controllerKey],
                                      style: TextStyle(fontSize: 11.sp),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                                      ),
                                      onSubmitted: (_) => _saveEdit(rowIndex, 0),
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  IconButton(
                                    icon: Icon(Icons.check, size: 14.w, color: Colors.green),
                                    onPressed: () => _saveEdit(rowIndex, 0),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.close, size: 14.w, color: Colors.red),
                                    onPressed: _cancelEdit,
                                  ),
                                ],
                              )
                            : GestureDetector(
                                onTap: () => _startEditing(rowIndex, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: cellData is Widget
                                      ? cellData
                                      : TextView(
                                          cellData.toString(),
                                          style: myTextStyle.font_14w400.copyWith(
                                            color: widget.rowTextColor ?? MyColors.dark000000,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp,
                                          ),
                                          textAlign: widget.columns[0].alignment,
                                          maxLines: null,
                                          overflow: TextOverflow.visible,
                                        ),
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Scrollable remaining columns
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Container(
                width: widget.columns.skip(1).fold<double>(0.0, (sum, col) => sum + col.width + 20.w),
                child: Column(
                  children: [
                    // Scrollable header
                    Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: widget.headerBackgroundColor ?? MyColors.grayF2F2F2,
                        borderRadius: BorderRadius.only(
                          // topRight: Radius.circular(12.r),
                        ),
                      ),
                      child: Row(
                        children: widget.columns.skip(1).map((column) {
                          return Container(
                            width: column.width + 20.w, // Add spacing
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: MyColors.grayD0D5DD.withOpacity(0.3),
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: TextView(
                              column.header,
                              style: myTextStyle.font_14w400.copyWith(
                                color: widget.headerTextColor ?? MyColors.gray6D6D6D,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                              textAlign: column.alignment,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // Scrollable data rows
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.data.length,
                        itemBuilder: (context, rowIndex) {
                          final rowData = widget.data[rowIndex];
                          final isLastRow = rowIndex == widget.data.length - 1;
                          return Container(
                            height: rowHeight,
                            decoration: BoxDecoration(
                              color: widget.rowBackgroundColor ?? MyColors.whiteFFFFFF,
                              borderRadius: isLastRow ? BorderRadius.only(
                                bottomRight: Radius.circular(12.r),
                              ) : null,
                              border: Border(
                                bottom: !isLastRow ? BorderSide(
                                  color: MyColors.grayD0D5DD.withOpacity(0.3),
                                  width: 0.5,
                                ) : BorderSide.none,
                              ),
                            ),
                            child: Row(
                              children: widget.columns.skip(1).toList().asMap().entries.map((colEntry) {
                                final originalColIndex = colEntry.key + 1; // Adjust for skipped first column
                                final column = colEntry.value;
                                final cellData = originalColIndex < rowData.length ? rowData[originalColIndex] : '';

                                bool isEditing = _editingRow == rowIndex && _editingColumn == originalColIndex;
                                String controllerKey = '${rowIndex}_$originalColIndex';

                                if (isEditing && !_controllers.containsKey(controllerKey)) {
                                  _controllers[controllerKey] = TextEditingController(text: cellData.toString());
                                }

                                return Container(
                                  width: column.width + 20.w, // Add spacing
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: MyColors.grayD0D5DD.withOpacity(0.3),
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                  child: isEditing && column.isEditable
                                      ? Row(
                                          children: [
                                            Expanded(
                                              child: TextField(
                                                controller: _controllers[controllerKey],
                                                style: TextStyle(fontSize: 11.sp),
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                                                ),
                                                onSubmitted: (_) => _saveEdit(rowIndex, originalColIndex),
                                              ),
                                            ),
                                            SizedBox(width: 2.w),
                                            IconButton(
                                              icon: Icon(Icons.check, size: 14.w, color: Colors.green),
                                              onPressed: () => _saveEdit(rowIndex, originalColIndex),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.close, size: 14.w, color: Colors.red),
                                              onPressed: _cancelEdit,
                                            ),
                                          ],
                                        )
                                      : GestureDetector(
                                          onTap: () => _startEditing(rowIndex, originalColIndex),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: cellData is Widget
                                                ? cellData
                                                : TextView(
                                                    cellData.toString(),
                                                    style: myTextStyle.font_14w400.copyWith(
                                                      color: widget.rowTextColor ?? MyColors.dark000000,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 11.sp,
                                                    ),
                                                    textAlign: column.alignment,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                          ),
                                        ),
                                );
                              }).toList(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Enhanced example usage
class PriceQuotationTable extends StatefulWidget {
  final List<List<dynamic>> data;
  final Function(int, int, String)? onCellEdit;
  final Function(int)? onEditRow;
  final Function(int)? onDeleteRow;
  final Function()? onAddRow;

  const PriceQuotationTable({
    super.key,
    required this.data,
    this.onCellEdit,
    this.onEditRow,
    this.onDeleteRow,
    this.onAddRow,
  });

  @override
  State<PriceQuotationTable> createState() => _PriceQuotationTableState();
}

class _PriceQuotationTableState extends State<PriceQuotationTable> {
  @override
  Widget build(BuildContext context) {
    final columns = [
      const TableColumn(header: 'Item Name', width: 80, alignment: TextAlign.left, isEditable: true),
      const TableColumn(header: 'Brand Name', width: 100, alignment: TextAlign.left, isEditable: true),
      const TableColumn(header: 'Total Quantity Required', width: 140, alignment: TextAlign.center, isEditable: true),
      const TableColumn(header: 'Unit Size', width: 80, alignment: TextAlign.center, isEditable: true),
      const TableColumn(header: 'Total Unit Calculation', width: 140, alignment: TextAlign.center, isEditable: true),
      const TableColumn(header: 'Total Unit Supply', width: 120, alignment: TextAlign.center, isEditable: true),
      const TableColumn(header: 'Total Quantity Supplied', width: 140, alignment: TextAlign.center, isEditable: true),
      const TableColumn(header: 'Quantity Margin Error', width: 130, alignment: TextAlign.center, isEditable: true),
      const TableColumn(header: 'Vendor Unit Price', width: 120, alignment: TextAlign.center, isEditable: true),
      const TableColumn(header: 'Vendor Total Price', width: 120, alignment: TextAlign.center, isEditable: true),
      const TableColumn(header: 'Client Unit Price', width: 120, alignment: TextAlign.center, isEditable: true),
      const TableColumn(header: 'Client Total Price', width: 120, alignment: TextAlign.center, isEditable: true),
      const TableColumn(header: 'Price Difference Per Unit\n(Vendor - Client)', width: 160, alignment: TextAlign.center, isEditable: true),
      const TableColumn(header: 'Negotiation Status', width: 120, alignment: TextAlign.center, isEditable: true),
      const TableColumn(header: 'Agreed Unit Price', width: 120, alignment: TextAlign.center, isEditable: true),
    ];

    return HorizontalScrollableTable(
      columns: columns,
      data: widget.data,
      // tableHeight: Remove this to use dynamic height based on rows
      showActions: true,
      onCellEdit: widget.onCellEdit,
      onEditRow: widget.onEditRow,
      onDeleteRow: widget.onDeleteRow,
      onAddRow: widget.onAddRow,
    );
  }
}

// Example data for the price quotation table
List<List<dynamic>> getPriceQuotationTableData() {
  return [
    [
      'Hand Sanitizer',
      'Dettol',
      '100kg',
      '900ml',
      '166.66',
      '166',
      '149.40 kg',
      '-600ml',
      '\$15',
      '\$2,490',
      '\$14',
      '\$2,490',
      '\$1',
      'Price Agreed',
      '\$15',
    ],
    [
      'Hand Sanitizer',
      'Spirit',
      '100kg',
      '1000ml',
      '150',
      '150',
      '100kg',
      '--',
      '\$15',
      '\$2,250',
      '\$14',
      '\$2,250',
      '\$1',
      'Negotiation',
      '--',
    ],
    [
      'Soap',
      'Luxus',
      '100kg',
      '1000ml',
      '150',
      '150',
      '100kg',
      '0',
      '\$15',
      '\$2,250',
      '\$14',
      '\$2,250',
      '\$1',
      'Negotiation',
      '--',
    ],
    [
      'Tooth Paste',
      'Colgate',
      '100kg',
      '1000ml',
      '150',
      '150',
      '100kg',
      '0',
      '\$15',
      '\$2,250',
      '\$15',
      '\$2,250',
      '\$1',
      'Negotiation',
      '--',
    ],
  ];
}

