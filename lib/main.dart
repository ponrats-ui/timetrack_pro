import 'screens/list_screen.dart';
import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/record_screen.dart';

void main() {
  runApp(const TimeTrackPro());
}

class TimeTrackPro extends StatelessWidget {
  const TimeTrackPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TimeTrack Pro',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF00C2A8),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
  const RecordScreen(),
  const ListScreen(),
  const Center(child: Text('รายวัน')),
  const Center(child: Text('รายเดือน')),
];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TimeTrack Pro'),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.edit_note),
            label: 'บันทึก',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt),
            label: 'รายการ',
          ),
          NavigationDestination(
            icon: Icon(Icons.today),
            label: 'รายวัน',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: 'รายเดือน',
          ),
        ],
      ),
    );
  }
}