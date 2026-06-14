import 'package:flutter/material.dart';

import '../state/work_record_state.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workRecordState = WorkRecordScope.of(context);
    final totalOtHours = _formatNumber(workRecordState.totalOtHours);
    final totalTravelCost = _formatCurrency(workRecordState.totalTravelCost);
    final totalRecords = workRecordState.totalRecords.toString();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0xFF00C2A8), Color(0xFF009688)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ค่าเดินทางรวม',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                totalTravelCost,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: SummaryCard(title: 'OT รวม', value: '$totalOtHours ชม.'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SummaryCard(title: 'ค่าเดินทาง', value: totalTravelCost),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: SummaryCard(title: 'รายการ', value: totalRecords),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SummaryCard(title: 'บันทึกแล้ว', value: totalRecords),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  title: const Text('จำนวนรายการ'),
                  trailing: Text(totalRecords),
                ),
                const Divider(),
                ListTile(
                  title: const Text('OT รวม'),
                  trailing: Text(totalOtHours),
                ),
                const Divider(),
                ListTile(
                  title: const Text('ค่าเดินทางรวม'),
                  trailing: Text(totalTravelCost),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _formatNumber(double value) {
    if (value == value.roundToDouble()) {
      return value.toStringAsFixed(0);
    }

    return value.toStringAsFixed(2);
  }

  String _formatCurrency(double value) {
    if (value == value.roundToDouble()) {
      return '฿${value.toStringAsFixed(0)}';
    }

    return '฿${value.toStringAsFixed(2)}';
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;

  const SummaryCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 110,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
