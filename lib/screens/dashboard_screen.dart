import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF00C2A8),
                Color(0xFF009688),
              ],
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'รายได้รวม',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '฿39,113',
                style: TextStyle(
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
          children: const [
            Expanded(
              child: SummaryCard(
                title: 'OT รวม',
                value: '฿19,213',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: SummaryCard(
                title: 'ค่าเดินทาง',
                value: '฿900',
              ),
            ),
          ],
        ),

        SizedBox(height: 12),

        Row(
          children: const [
            Expanded(
              child: SummaryCard(
                title: 'รายได้สุทธิ',
                value: '฿38,263',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: SummaryCard(
                title: 'คงเหลือ',
                value: '฿22,113',
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  title: Text('วันทำงาน'),
                  trailing: Text('19 วัน'),
                ),
                Divider(),
                ListTile(
                  title: Text('วันหยุด'),
                  trailing: Text('4 วัน'),
                ),
                Divider(),
                ListTile(
                  title: Text('วันนักขัตฤกษ์'),
                  trailing: Text('2 วัน'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
  });

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