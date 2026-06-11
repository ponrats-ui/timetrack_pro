import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'บันทึกเวลาทำงาน',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
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
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('บันทึกข้อมูลสำเร็จ'),
                  ),
                );
              },
              icon: const Icon(Icons.save),
              label: const Text('บันทึกข้อมูล'),
            ),
          ),
        ],
      ),
    );
  }
}