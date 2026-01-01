import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class CounterSalePaymentSummaryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items; // each: {name, subtitle, price, qty}
  final int totalPrice;
  final int gst; // in currency units
  final int vat; // in currency units
  final String orderId;
  final String customerName;
  final DateTime orderTime;

  const CounterSalePaymentSummaryScreen({
    super.key,
    required this.items,
    required this.totalPrice,
    required this.gst,
    required this.vat,
    required this.orderId,
    required this.customerName,
    required this.orderTime,
  });

  @override
  Widget build(BuildContext context) {
    final totalAmount = totalPrice + gst + vat;
    final timeStr = DateFormat('h:mm a').format(orderTime);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
        title: const Text(
          'Payment Summary',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            Text('Bill Summary', style: myTextStyle.font_18w600),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.grayD0D5DD),
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  // Header row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    child: Row(
                      children: [
                        _kv('Order Id', orderId),
                        _dividerV(),
                        _kv('Customer Name', customerName),
                        _dividerV(),
                        _kv('Items', items.length.toString()),
                        _dividerV(),
                        _kv('Order Time', timeStr),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: Color(0xFFE0E0E0)),

                  // Table header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                    child: Row(
                      children: [
                        _th('Item Name'),
                        _dividerV(),
                        _th('Portion Size'),
                        _dividerV(),
                        _th('Quantity\n& Price'),
                        _dividerV(),
                        _th('Total\nPrice'),
                      ],
                    ),
                  ),

                  // Items
                  ...items.map((it) {
                    final qty = it['qty'] as int;
                    final price = it['price'] as int; // per item
                    final lineTotal = qty * price;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _td(it['name'] as String),
                          _dividerV(),
                          _td(it['subtitle'] as String),
                          _dividerV(),
                          _td('${qty}×\₹$price'),
                          _dividerV(),
                          _td('₹$lineTotal'),
                        ],
                      ),
                    );
                  }).toList(),

                  const Divider(height: 1, color: Color(0xFFE0E0E0)),

                  // Summary rows
                  _amountRow('Total Price', totalPrice),
                  _amountRow('GST Tax', gst),
                  _amountRow('VAT Tax', vat),
                  const Divider(height: 1, color: Color(0xFFE0E0E0)),
                  _amountRow('Total Amount', totalAmount, isBold: true),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Text('Payment', style: myTextStyle.font_18w600),
            const SizedBox(height: 12),
            const Text('Select Payment Method', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            _dropdown(['Cash/POS', 'Card', 'UPI'], 'Cash/POS'),
            const SizedBox(height: 16),
            const Text('Total Amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            _amountField('₹$totalAmount'),
            const SizedBox(height: 16),
            const Text('Payment Received', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            _amountField('₹'),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF18181B),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Complete', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _kv(String k, String v) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(k, style: myTextStyle.font_14w500.copyWith(color: MyColors.gray979797)),
          const SizedBox(height: 2),
          Text(v, style: myTextStyle.font_16ww700),
        ],
      ),
    );
  }

  Widget _th(String t) => Expanded(
        child: Text(t, style: myTextStyle.font_16ww400.copyWith(color: MyColors.gray979797)),
      );
  Widget _td(String t) => Expanded(
        child: Text(t, style: myTextStyle.font_16ww700),
      );
  Widget _dividerV() => Container(width: 1, height: 25, color: Colors.grey.shade300, margin: const EdgeInsets.symmetric(horizontal: 8));

  Widget _amountRow(String label, int value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: isBold ? myTextStyle.font_16ww700 : myTextStyle.font_16ww400),
          Text('₹${value.toStringAsFixed(0)}', style: isBold ? myTextStyle.font_16ww700 : myTextStyle.font_16ww400),
        ],
      ),
    );
  }

  Widget _dropdown(List<String> options, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD9D9D9)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
          items: options.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }

  Widget _amountField(String hint) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD9D9D9)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '',
        ),
      ),
    );
  }
}
