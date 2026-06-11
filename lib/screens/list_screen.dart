import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [

        Card(
          child: ListTile(
            leading: Icon(Icons.work),
            title: Text('11/06/2026'),
            subtitle: Text('08:00 - 20:00'),
            trailing: Text('OT 4 ชม.'),
          ),
        ),

        Card(
          child: ListTile(
            leading: Icon(Icons.work),
            title: Text('10/06/2026'),
            subtitle: Text('08:00 - 18:00'),
            trailing: Text('OT 2 ชม.'),
          ),
        ),

      ],
    );
  }
}