import 'package:flutter/material.dart';

import '../models/work_record.dart';
import '../state/work_record_state.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final records = WorkRecordScope.of(context).records;

    if (records.isEmpty) {
      return const Center(child: Text('ยังไม่มีรายการบันทึก'));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: records.map(_WorkRecordCard.new).toList(),
    );
  }
}

class _WorkRecordCard extends StatelessWidget {
  final WorkRecord record;

  const _WorkRecordCard(this.record);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.work),
        title: Text(record.date),
        subtitle: Text('${record.checkIn} - ${record.checkOut}'),
        trailing: Text('OT ${_formatNumber(record.otHours)} ชม.'),
      ),
    );
  }

  String _formatNumber(double value) {
    if (value == value.roundToDouble()) {
      return value.toStringAsFixed(0);
    }

    return value.toStringAsFixed(2);
  }
}
