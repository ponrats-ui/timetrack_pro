import 'package:flutter/widgets.dart';

import '../models/work_record.dart';

class WorkRecordState extends ChangeNotifier {
  final List<WorkRecord> _records = [];

  List<WorkRecord> get records => List.unmodifiable(_records);

  int get totalRecords => _records.length;

  double get totalOtHours {
    return _records.fold<double>(0, (total, record) => total + record.otHours);
  }

  double get totalTravelCost {
    return _records.fold<double>(
      0,
      (total, record) => total + record.travelCost,
    );
  }

  void addRecord(WorkRecord record) {
    _records.insert(0, record);
    notifyListeners();
  }
}

class WorkRecordScope extends InheritedNotifier<WorkRecordState> {
  const WorkRecordScope({
    super.key,
    required WorkRecordState notifier,
    required super.child,
  }) : super(notifier: notifier);

  static WorkRecordState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<WorkRecordScope>();

    assert(scope != null, 'No WorkRecordScope found in context.');
    return scope!.notifier!;
  }
}
