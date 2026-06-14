import 'package:flutter/material.dart';

import '../models/work_record.dart';
import '../state/work_record_state.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final dateController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();
  final otController = TextEditingController();
  final travelController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    startController.dispose();
    endController.dispose();
    otController.dispose();
    travelController.dispose();
    super.dispose();
  }

  void saveRecord() {
    final date = dateController.text.trim();
    final checkIn = startController.text.trim();
    final checkOut = endController.text.trim();
    final otText = otController.text.trim();
    final travelText = travelController.text.trim();

    if (date.isEmpty ||
        checkIn.isEmpty ||
        checkOut.isEmpty ||
        otText.isEmpty ||
        travelText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
      return;
    }

    final otHours = double.tryParse(otText);
    final travelCost = double.tryParse(travelText);

    if (otHours == null || travelCost == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid numbers for OT and travel cost.'),
        ),
      );
      return;
    }

    WorkRecordScope.of(context).addRecord(
      WorkRecord(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        date: date,
        checkIn: checkIn,
        checkOut: checkOut,
        otHours: otHours,
        travelCost: travelCost,
      ),
    );

    dateController.clear();
    startController.clear();
    endController.clear();
    otController.clear();
    travelController.clear();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('บันทึกข้อมูลสำเร็จ')));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'บันทึกเวลาทำงาน',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: dateController,
            decoration: const InputDecoration(
              labelText: 'วันที่',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: startController,
            decoration: const InputDecoration(
              labelText: 'เวลาเข้างาน',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: endController,
            decoration: const InputDecoration(
              labelText: 'เวลาออกงาน',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: otController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'OT (ชั่วโมง)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: travelController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'ค่าเดินทาง',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton.icon(
              onPressed: saveRecord,
              icon: const Icon(Icons.save),
              label: const Text('บันทึกข้อมูล'),
            ),
          ),
        ],
      ),
    );
  }
}
